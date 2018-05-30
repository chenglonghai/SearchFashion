//
//  Encrypt.h
//  AppClient
//
//  Created by xinz on 2017/10/23.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt : NSObject
+(NSString*) decryptUseDES:(NSString*)cipherText key:(NSString*)key;
+(NSString *) encryptUseDES:(NSString *)clearText key:(NSString *)key;
@end
