//
//  FBLNetworkReachability.h
//  FBLWoodmall
//
//  Created by emir on 2017/4/10.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, FBLNetworkReachableStatus) {
    FBLNetworkReachableStatusUnknown          = -1,
    FBLNetworkReachableStatusNotReachable     = 0,
    FBLNetworkReachableStatusReachableViaWWAN = 1,
    FBLNetworkReachableStatusReachableViaWiFi = 2,
};

@interface FBLNetworkReachability : NSObject

FOUNDATION_EXPORT NSString *const JCNetworkingReachabilityDidChangeNotification;

FOUNDATION_EXPORT NSString *const JCNetworkingReachabilityNotificationStatusKey;

+ (FBLNetworkReachableStatus)status;

+ (BOOL)isReachable;

+ (void)startMonitoring;

+ (void)stopMonitoring;

@end
