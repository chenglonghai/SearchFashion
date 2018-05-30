//
//  Based64.h
//  AppClient
//
//  Created by xinz on 2017/10/23.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Based64 : NSObject
//Base64加密
+ (NSString *) encodeBase64WithString:(NSString *)strData;
+ (NSString *) encodeBase64WithData:(NSData *)objData;

//Based64解密
+ (NSData *) decodeBase64WithString:(NSString *)strBase64;
@end
