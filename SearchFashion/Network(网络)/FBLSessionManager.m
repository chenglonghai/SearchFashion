//
//  FBLSessionManager.m
//  FBLWoodmall
//
//  Created by 123 on 2017/3/13.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import "FBLSessionManager.h"
#import "FBLBaseModel.h"
#import <YYModel.h>
#import "FBLUserStatusManager.h"
#import "FBLNetworkReachability.h"

@interface FBLSessionManager ()

@property (copy, nonatomic) NSString *headerJson;

@end

@implementation FBLSessionManager

+ (instancetype)shareManager {
    static FBLSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FBLSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];
        [manager prepareForCommonRequest];
    });
    
    return manager;
}

- (void)prepareForCommonRequest {
    
    NSString *version = [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    responseSerializer.removesKeysWithNullValues = YES;
    self.responseSerializer = responseSerializer;
    self.requestSerializer.timeoutInterval = 15;
    
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    //machine_code加密
    uuid = [NSString encryptUseDES:uuid];
    
    [self.requestSerializer setValue:uuid forHTTPHeaderField:@"machine_code"];
    
    NSTimeInterval date = [[NSDate date] timeIntervalSince1970];
    NSString *dateStr = [NSString stringWithFormat:@"%zd", date];
    [self.requestSerializer setValue:dateStr forHTTPHeaderField:@"access_time"];
    [self.requestSerializer setValue:@"iOS" forHTTPHeaderField:@"os_type"]; //平台类型
    [self.requestSerializer setValue:[[UIDevice currentDevice] systemVersion] forHTTPHeaderField:@"os_version"]; //iOS系统版本

    [self.requestSerializer setValue:version forHTTPHeaderField:@"app_version"]; //客户端版本
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *currentLangguage = [[userDefault objectForKey:@"AppleLanguages"] objectAtIndex:0];
    
    [self.requestSerializer setValue:currentLangguage forHTTPHeaderField:@"locale_language"]; //本地语言
    [self.requestSerializer setValue:nil forHTTPHeaderField:@"Accept-Language"];

    self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
    [self.requestSerializer setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
}

- (void)generateSignWithParams: (NSDictionary *)params{
    
    //1. access_token
    [self.requestSerializer setValue:[FBLUserStatusManager shareManager].loginToken forHTTPHeaderField:@"access_token"];

    //2. 处理header转jsonStr，每个元素之间有空格
    NSString *headerJson = [NSString stringWithFormat:@"{machine_code:'%@', access_time:%@, access_url:'%@', os_type:'%@', os_version:'%@', app_version:'%@', locale_language:'%@', access_token:'%@'}", [self.requestSerializer valueForHTTPHeaderField:@"machine_code"], [self.requestSerializer valueForHTTPHeaderField:@"access_time"], [self.requestSerializer valueForHTTPHeaderField:@"access_url"], [self.requestSerializer valueForHTTPHeaderField:@"os_type"], [self.requestSerializer valueForHTTPHeaderField:@"os_version"], [self.requestSerializer valueForHTTPHeaderField:@"app_version"], [self.requestSerializer valueForHTTPHeaderField:@"locale_language"], [FBLUserStatusManager shareManager].loginToken];

    //存储headerJson，为了response
    self.headerJson = headerJson;

    //3. 拼接params
    if (params != nil) {
        headerJson = [headerJson stringByAppendingString:params[@"param"]];
    }
    
    //4. hmacsha1加密
    headerJson = [NSString encryptUseHmacSha1:headerJson];
    [self.requestSerializer setValue:headerJson forHTTPHeaderField:@"sign"];
}

//判断返回数据是否校验成功
- (BOOL)isResponseSign:(id)responseObject {
    
    NSString *resultStr = [(NSDictionary *)responseObject objectForKey:@"result"];
    NSString *resultSign = [(NSDictionary *)responseObject objectForKey:@"sign"];
    
    //1. headerJson拼接result
    self.headerJson = [self.headerJson stringByAppendingString:resultStr];
    
    //2. hmacsha1加密
    self.headerJson = [NSString encryptUseHmacSha1:self.headerJson];

    return [self.headerJson isEqualToString:resultSign] ? YES : NO;
}

- (NSURLSessionDataTask *)requestDataWithPath:(NSString *)path paramsJson:(NSString *)paramsJson method:(FBLRequestMethod)method withBlock:(ResultBlock)block {
    
    if (!path || path.length <= 0 ) {
        return nil;
    }
    NSLogDebug(@"%@",path);
    path = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLogDebug(@"%@",path);
    //1. 参数DES处理 最后格式：@{@"param":"xdfa11sa"}
    NSDictionary *params = nil;
    if (paramsJson != nil) {
        params = @{@"param" : [NSString encryptUseDES:paramsJson]};
    }

    //2. 获取完整url
    //如果是get请求，后面需要把参数拼接全
    NSString *access_url = [[self.baseURL absoluteString] stringByAppendingString:path];
    if (method == FBLRequestMethodGet) {
        NSLogDebug(@"%@",params);
        NSLogDebug(@"%@",params[@"param"]);
        NSString *paramValue = [params[@"param"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSLogDebug(@"%@",paramValue);
        if (paramValue != nil){
            //[jsonStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            //access_url = [access_url stringByAppendingString:[NSString stringWithFormat:@"?param=%@", paramValue]];

            //urlEncode
            access_url = [access_url stringByAppendingString:[self encodeString:[NSString stringWithFormat:@"?param=%@", paramValue]]];
            NSLogDebug(@"%@",access_url);
        }
    }
    
    [self.requestSerializer setValue:access_url forHTTPHeaderField:@"access_url"];

    //3. 处理header，生成sign，设置header
    [self generateSignWithParams:params];
    
    NSLogDebug(@"URL----%@",path);
    NSLogDebug(@"请求头部信息---------%@",self.requestSerializer.HTTPRequestHeaders);
    NSLogDebug(@"网络请求参数----%@",params);
    
//    if (![FBLNetworkReachability isReachable]) {
//        FBLShowHudMsg(@"网络不给力，请稍后重试");
//        return nil;
//    }
    
    NSURLSessionDataTask *task = nil;
    FBLShowProgress;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            FBLHideProgress;
    });
    
    switch (method) {
        case FBLRequestMethodGet:
        {
            task = [self GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self successBlock:block WithData:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self failureBlock:block WithError:error];
            }];
        }
            break;
        case FBLRequestMethodPost:
        {
            task = [self POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self successBlock:block WithData:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self failureBlock:block WithError:error];
            }];
        }
            break;
        case FBLRequestMethodDelete:
        {
            task = [self DELETE:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self successBlock:block WithData:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self failureBlock:block WithError:error];
            }];
        }
            break;
        default:
            break;
    }
    return task;
}

- (void)successBlock:(ResultBlock)block WithData:(id)responseObject {
    FBLHideProgress;
    

    
    //判断是sign校验是否成功
    if ([self isResponseSign:responseObject]) {
        NSLogDebug(@"校验sign成功");
        
        //解密result
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSString *resultStr = responseDict[@"result"];
        
        resultStr = [NSString decryptUseDES:resultStr];
        resultStr  = [NSString removeSpaceAndNewline:resultStr];
 
        NSData *jsonData = [resultStr dataUsingEncoding:NSUTF8StringEncoding];
        id resultJson = [resultStr objectFromJSONString];
        
        //回调
        block(resultJson,nil);
          NSLogDebug(@"服务器返回数据==%@",resultJson);
        //展示解密后msg
        FBLBaseModel *baseModel = [FBLBaseModel yy_modelWithJSON:resultJson];
        [self messageWithErrorCode:baseModel.code.integerValue];
        
    }else {
        NSLogDebug(@"校验sign失败");
    }
}

- (void)failureBlock:(ResultBlock)block WithError:(NSError *)error{
    FBLHideProgress;
    NSLogDebug(@"error: %@", error.localizedDescription);
    block(nil,error);
}

- (NSURLSessionDataTask *)requestDataWithPath:(NSString *)path paramsJson:(NSString *)paramsJson method:(FBLRequestMethod)method WithCompleteBlock:(ResultCompleteBlock)block {
    
    return [self requestDataWithPath:path paramsJson:(NSString *)paramsJson method:method withBlock:^(id rawdata, NSError *error) {
        if (!error) {
            NSMutableDictionary *data = [(NSDictionary *)rawdata mutableCopy];
            block(data, error);
        }else{
            block(nil, error);
        }
    }];
}

- (void)messageWithErrorCode:(NSInteger)code {
    switch (code) {
        case -1:
            NSLogDebug(@"错误码: %ld, 未知错误", code);
            break;
        case -2:
            NSLogDebug(@"错误码: %ld, 没有找到数据!", code);
            break;
        case 1000:
            NSLogDebug(@"错误码: %ld, 操作太频繁", code);
            break;
        case 1010:
            NSLogDebug(@"错误码: %ld, 数据传输不完整", code);
            break;
        case 1020:
            NSLogDebug(@"错误码: %ld, 用户没登录或已经超时", code);
            break;
        case 1030:
            NSLogDebug(@"错误码: %ld, Header信息错误！", code);
            break;
        case 2000:
            NSLogDebug(@"错误码: %ld, 参数格式错误！", code);
            break;
        case 2010:
            NSLogDebug(@"错误码: %ld, 用户名密码错误", code);
            break;
        case 2020:
            NSLogDebug(@"错误码: %ld, 用户没有获得授权", code);
            break;
        case 2030:
            NSLogDebug(@"错误码: %ld, 用户已被禁用", code);
            break;
        case 2040:
            NSLogDebug(@"错误码: %ld, 用户已经删除", code);
            break;
        case 2050:
            NSLogDebug(@"错误码: %ld, 用户不存在", code);
            break;
        case 3000:
            NSLogDebug(@"错误码: %ld, 金额输入错误", code);
            break;
        case 4000:
            NSLogDebug(@"错误码: %ld, 银行卡已存在", code);
            break;
            
        default:
            break;
    }
}


-(NSString*)encodeString:(NSString*)unencodedString{
    
    // CharactersToBeEscaped = @":/?&=;+!@#$()~',*";
    
    // CharactersToLeaveUnescaped = @"[].";
    
    NSString*encodedString=(NSString*)
    
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              
                                                              (CFStringRef)unencodedString,
                                                              
                                                              NULL,  
                                                              
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",  
                                                              
                                                              kCFStringEncodingUTF8));  
    
    return encodedString;
    
}

@end
