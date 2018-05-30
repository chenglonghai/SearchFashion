//
//  NSString+PhoneInfo.h
//  AppClient
//
//  Created by xinz on 2017/11/2.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PhoneInfo)
//设备唯一标识符
+(NSString *)getIdentifierStr;
//手机别名： 用户定义的名称
+(NSString *)getUserPhoneName;
//设备名称
+(NSString *)getDeviceName;

//手机系统版本
+(NSString *)getPhoneVersion;

//手机型号
+(NSString *)getPhoneModel;

// 当前应用软件版本  比如：1.0.1
+(NSString *)appCurVersion;
@end
