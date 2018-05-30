//
//  CLHSessionManager.m
//  AppClient
//
//  Created by APAPA on 2017/6/27.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import "CLHSessionManager.h"
#import "Encrypt.h"

@implementation CLHSessionManager
+ (instancetype)shareManager {
    static CLHSessionManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CLHSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl]];

 [manager prepareForCommonRequest];
    });
    manager.responseSerializer = [AFJSONResponseSerializer serializer];//返回格式 JSON
    //设置返回C的ontent-type
    manager.responseSerializer.acceptableContentTypes=[[NSSet alloc] initWithObjects:@"application/xml", @"text/xml",@"text/html", @"application/json",@"text/plain",@"application/x-www-form-urlencoded",nil];
 
    return manager;
}


- (void)prepareForCommonRequest {
    

    self.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    responseSerializer.removesKeysWithNullValues = YES;
    self.responseSerializer = responseSerializer;
    self.requestSerializer.timeoutInterval = 15;


}

- (NSURLSessionDataTask *)requestDataWithPath:(NSString *)path paramsJson:(NSString *)paramsJson method:(FBLRequestMethod)method withBlock:(ResultBlock)block {
    
    
    
    if (!path || path.length <= 0 ) {
        return nil;
    }

    NSDictionary *params = nil;
    
//    NSLog(@"==%@",paramsJson);
    if ([UserManager shareManager].isLogin == YES) {
        [self.requestSerializer setValue:[NSString stringWithFormat:@"%@",[UserManager shareManager].userModel.u_id]  forHTTPHeaderField:@"uid"]; //用户id
        
    }else{
        [self.requestSerializer setValue:@"" forHTTPHeaderField:@"uid"]; //用户id
    }
    
    
//    if ([path hasSuffix:@"feedback"]) {
//            params = @{@"param" :paramsJson};
//        
//        NSLog(@"%@",params);
//    }else{

    if (paramsJson != nil) {
        
         NSLog(@"----%@",[Encrypt encryptUseDES:paramsJson key:DES_APPKEY]);
      params = @{@"param" :[Encrypt encryptUseDES:paramsJson key:DES_APPKEY]};
        
        
//        NSLog(@"----%@",[Encrypt encryptUseDES:paramsJson key:DES_APPKEY]);
    }
//    }

  

    
    
    NSURLSessionDataTask *task = nil;
    
    if ([path hasSuffix:@"index.php/city"] ||[path hasSuffix:@"index.php/area"] ||[path hasSuffix:@"index.php/province"] || [path hasSuffix:@"index.php/mood"] ||[path hasSuffix:@"index.php/userleft"] || [path hasSuffix:@"index.php/approtate"]|| [path hasSuffix:@"index.php/fieldcategory"] ||[path hasSuffix:@"index.php/cross"] ||[path hasSuffix:@"index.php/iosupd"] ||[path hasSuffix:@"index.php/goodsdata"] || [path hasSuffix:@"index.php/hairlist"] || [path hasSuffix:@"index.php/usebody"]  || [path hasPrefix:@"index.php/adv"]) {

    }else
        FBLShowProgress;
    
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
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        FBLHideProgress;
    });
    
    return task;
    
    
}

- (void)successBlock:(ResultBlock)block WithData:(id)responseObject {
    FBLHideProgress;
    
    ResultModel *resultModel = [[ResultModel alloc] init];
    
     NSString *resultString  = [Encrypt decryptUseDES:[responseObject objectForKey:@"result"] key:DES_APPKEY];
    
      NSLog(@"xxxx%@",[responseObject objectForKey:@"result"] );

         resultString  = [NSString removeSpaceAndNewline:resultString];
    
//        NSLog(@"xxxx%@",resultString);

    id resultJson =[resultString objectFromJSONStringWithParseOptions:JKParseOptionPermitTextAfterValidJSON];
    // resultJson = [NSString removeSpaceAndNewline:resultJson];
   
    [resultModel setValuesForKeysWithDictionary:resultJson];

    //回调
      block([Encrypt decryptUseDES:[responseObject objectForKey:@"result"] key:DES_APPKEY],nil,resultModel);

}




- (void)failureBlock:(ResultBlock)block WithError:(NSError *)error{
    FBLHideProgress;
    NSLog(@"errorxxxxxx: %@", error.localizedDescription);
    block(nil,error,nil);
}




- (NSURLSessionDataTask *)requestDataWithPath:(NSString *)path paramsJson:(NSString *)paramsJson method:(FBLRequestMethod)method WithCompleteBlock:(ResultCompleteBlock)block {
    

    return [self requestDataWithPath:path paramsJson:paramsJson method:method withBlock:^(id rawdata, NSError *error, ResultModel *resultModel) {
        if (!error) {
                     NSMutableDictionary *data = [(NSDictionary *)rawdata mutableCopy];
                        block(data, error,resultModel);
                    }else{
                        block(nil, error,resultModel);
                }
        
    }];
    
}
- (NSURLSessionDataTask *)requestDataNotDesWithPath:(NSString *)path paramsJson:(NSDictionary *)paramsJson method:(FBLRequestMethod)method WithCompleteBlock:(ResultCompleteBlock)block{


    return [self requestDataNotDesWithPath:path paramsJson:paramsJson method:method withBlock:^(id rawdata, NSError *error, ResultModel *resultModel) {
        if (!error) {
            NSMutableDictionary *data = [(NSDictionary *)rawdata mutableCopy];
            block(data, error,resultModel);
        }else{
            block(nil, error,resultModel);
        }
    }];
}
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        
        return nil;
        
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];
    
    if(err) {
        
        NSLog(@"json解析失败：%@",err);
        
        return nil;
        
    }
    
    return dic;
    

}


// 将JSON串转化为字典或者数组

- (id)toArrayOrNSDictionary:(NSData *)jsonData{
    
    NSError *error = nil;
    
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                     
                                                    options:NSJSONReadingAllowFragments
                     
                                                      error:&error];
    
    
    
    if (jsonObject != nil && error == nil){
        
        return jsonObject;
        
    }else{
        
        // 解析错误
        
        return nil;
        
    }
    
    
}

#pragma mark-没有DES加密的请求
- (NSURLSessionDataTask *)requestDataNotDesWithPath:(NSString *)path paramsJson:(NSDictionary *)paramsJson method:(FBLRequestMethod)method withBlock:(ResultBlock)block {
    
    if (!path || path.length <= 0 ) {
        return nil;
    }
    
    if ([UserManager shareManager].isLogin == YES) {
        [self.requestSerializer setValue:[NSString stringWithFormat:@"%@",[UserManager shareManager].userModel.u_id]  forHTTPHeaderField:@"uid"]; //用户id
        
    }else{
        [self.requestSerializer setValue:@"" forHTTPHeaderField:@"uid"]; //用户id
    }
   NSDictionary * params = [NSDictionary dictionaryWithDictionary:paramsJson];
    
    
    
    NSLogDebug(@"URL----%@==%@",path,params);
    
    
    
    NSURLSessionDataTask *task = nil;
    FBLShowProgress;
    
    switch (method) {
        case FBLRequestMethodGet:
        {
            task = [self GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [self successBlock:block WithData:responseObject];
//                 [self successNotDesBlock:block WithData:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self failureBlock:block WithError:error];
            }];
        }
            break;
        case FBLRequestMethodPost:
        {
            task = [self POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              [self successBlock:block WithData:responseObject];
//                 [self successNotDesBlock:block WithData:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self failureBlock:block WithError:error];
            }];
        }
            break;
        case FBLRequestMethodDelete:
        {
            task = [self DELETE:path parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
               [self successBlock:block WithData:responseObject];
//                [self successNotDesBlock:block WithData:responseObject];
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








#pragma mark-没有DES加密的返回
- (void)successNotDesBlock:(ResultBlock)block WithData:(id)responseObject {
    FBLHideProgress;
    
    ResultModel *resultModel = [[ResultModel alloc] init];
    NSString *resultString  = responseObject;
    resultString  = [NSString removeSpaceAndNewline:resultString];
    
    id resultJson =[resultString objectFromJSONStringWithParseOptions:JKParseOptionPermitTextAfterValidJSON];
    
    [resultModel setValuesForKeysWithDictionary:resultJson];
    
    //回调
    block([Encrypt decryptUseDES:[responseObject objectForKey:@"result"] key:DES_APPKEY],nil,resultModel);
    
}


@end
