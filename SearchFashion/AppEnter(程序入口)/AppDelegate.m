//
//  AppDelegate.m
//  SearchFashion
//
//  Created by longhai on 2018/5/17.
//  Copyright © 2018年 study. All rights reserved.
//

#import "AppDelegate.h"
#import "WXApiManager.h"
#import "CLHTabBarController.h"
#import <AlipaySDK/AlipaySDK.h>
#import <UMShare/UMShare.h>
#import <UMCommon/UMCommon.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //关闭设置为NO, 默认值为NO.
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;

//    [self confitUShareSettings];
    //微信支付
//    [WXApi registerApp:@"wx1bc516fac184fedb" enableMTA:YES];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    // U-Share 平台设置
    [UMConfigure setLogEnabled:YES];//设置打开日志
    [UMConfigure initWithAppkey:@"5b0780f7f43e484d84000136" channel:@"App Store"];
    [self configUSharePlatforms];
    CLHTabBarController *tabBarVC = [CLHTabBarController new];


    
    self.window.rootViewController = tabBarVC;
    [tabBarVC setNavBarAppearence];
    
    [self.window makeKeyAndVisible];
    NSLog(@"hello");
    
    return YES;
}
//- (UINavigationController *)rootNavigationController {
//    UIViewController *viewController = nil;
//    if (self.window.rootViewController == self.rootVC) {
//        viewController = self.rootVC.selectedViewController;
//    } else {
//        viewController = self.window.rootViewController;
//    }
//    if ([viewController isKindOfClass:[UINavigationController class]]) {
//        return (UINavigationController *)viewController;
//    }
//    return viewController.navigationController;
//}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return  [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
    //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
//    BOOL result = [[UMSocialManager defaultManager] handleOpenURL:url sourceApplication:sourceApplication annotation:annotation];
//    if (!result) {
        // 其他如支付等SDK的回调
         return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
//    }
//    return result;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    
    BOOL result = [[UMSocialManager defaultManager]  handleOpenURL:url options:options];
    if (!result) {
        // 其他如支付等SDK的回调

    
    if ([url.host isEqualToString:@"safepay"]) {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alipay"
                                                                object:resultDic];
        }];
        
        // 授权跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
            
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"alipay"
                                                                object:resultDic];
            // 解析 auth code
            NSString *result = resultDic[@"result"];
            NSString *authCode = nil;
            if (result.length>0) {
                NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                for (NSString *subResult in resultArr) {
                    if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                        authCode = [subResult substringFromIndex:10];
                        break;
                    }
                }
            }
            NSLog(@"授权结果 authCode = %@", authCode?:@"");
        }];
    }
    if ([url.host isEqualToString:@"pay"])
    {
        //微信支付，处理支付结果
        return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
        
    }
    return YES;
        
    }
    return result;
}

- (void)confitUShareSettings
{
    /*
     * 打开图片水印
     */
    //[UMSocialGlobal shareInstance].isUsingWaterMark = YES;
    /*
     * 关闭强制验证https，可允许http图片分享，但需要在info.plist设置安全域名
     <key>NSAppTransportSecurity</key>
     <dict>
     <key>NSAllowsArbitraryLoads</key>
     <true/>
     </dict>
     */
    //[UMSocialGlobal shareInstance].isUsingHttpsWhenShareContent = NO;
}

- (void)configUSharePlatforms
{
    /* 设置微信的appKey和appSecret */
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx1bc516fac184fedb" appSecret:@"e471c56c91c5e61d42e5c486b3491ed6" redirectURL:@"http://mobile.umeng.com/social"];

  
}

@end
