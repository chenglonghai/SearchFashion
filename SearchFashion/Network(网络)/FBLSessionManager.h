//
//  FBLSessionManager.h
//  FBLWoodmall
//
//  Created by 123 on 2017/3/13.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSInteger, FBLRequestMethod) {
    FBLRequestMethodGet,
    FBLRequestMethodPost,
    FBLRequestMethodDelete
};

typedef void(^ResultBlock)(id rawdata, NSError *error);
typedef void(^ResultCompleteBlock)(NSMutableDictionary *data, NSError *error);

@interface FBLSessionManager : AFHTTPSessionManager

+ (instancetype)shareManager;

- (NSURLSessionDataTask *)requestDataWithPath:(NSString *)path paramsJson:(NSString *)paramsJson method:(FBLRequestMethod)method WithCompleteBlock:(ResultCompleteBlock)block;


@end
