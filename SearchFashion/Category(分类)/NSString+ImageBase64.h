//
//  NSString+ImageBase64.h
//  AppClient
//
//  Created by xinz on 2017/10/30.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ImageBase64)
+(NSString *)UIImageToBase64Str:(UIImage *) image;
+(NSString *)UIImageToBase64Str5f:(UIImage *) image;
+(NSString *)UIImageToBase64Str:(UIImage *) image sizef:(float)sizef;
+ (NSString *)removeSpaceAndNewline:(NSString *)str;
@end
