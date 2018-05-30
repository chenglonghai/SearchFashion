//
//  FBLNetworkReachability.m
//  FBLWoodmall
//
//  Created by emir on 2017/4/10.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import "FBLNetworkReachability.h"
#import <AFNetworking/AFNetworking.h>

@implementation FBLNetworkReachability


NSString *const FBLNetworkingReachabilityDidChangeNotification = @"com.alamofire.networking.reachability.change";
NSString *const FBLNetworkingReachabilityNotificationStatusKey = @"AFNetworkingReachabilityNotificationStatusItem";

+ (FBLNetworkReachableStatus)status {
    
    if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusUnknown) {
        return FBLNetworkReachableStatusUnknown;
    }else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable) {
        return FBLNetworkReachableStatusNotReachable;
    }else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWWAN) {
        return FBLNetworkReachableStatusReachableViaWWAN;
    }else if ([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi) {
        return FBLNetworkReachableStatusReachableViaWiFi;
    }
    return FBLNetworkReachableStatusNotReachable;
}

+ (BOOL)isReachable {
    return [[AFNetworkReachabilityManager sharedManager] isReachable];
}

+ (void)startMonitoring {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

+ (void)stopMonitoring {
    [[AFNetworkReachabilityManager sharedManager] stopMonitoring];
}

@end
