//
//  NSString+ImageBase64.m
//  AppClient
//
//  Created by xinz on 2017/10/30.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import "NSString+ImageBase64.h"

@implementation NSString (ImageBase64)
+(NSString *)UIImageToBase64Str:(UIImage *) image {
    NSData *data = UIImageJPEGRepresentation(image, 0.2f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

+(NSString *)UIImageToBase64Str5f:(UIImage *) image {
    NSData *data = UIImageJPEGRepresentation(image, 0.3f);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}

+(NSString *)UIImageToBase64Str:(UIImage *) image sizef:(float)sizef{
    NSData *data = UIImageJPEGRepresentation(image, sizef);
    NSString *encodedImageStr = [data base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    return encodedImageStr;
}
/**
 移除NSString空格和换行
 */
+ (NSString *)removeSpaceAndNewline:(NSString *)str
{
    NSString *temp = [str stringByReplacingOccurrencesOfString:@"" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"(null)" withString:@""];
       // temp = [temp stringByReplacingOccurrencesOfString:@"null" withString:@""];
    //    temp = [temp stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    //    temp = [temp stringByReplacingOccurrencesOfString:@"/" withString:@""];
    NSLogDebug(@"%@",[NSString stringWithFormat:@"\\"]);
    NSLogDebug(@"%@",temp);
    //    temp = [temp stringByReplacingOccurrencesOfString:@"[" withString:@""];
    //    temp = [temp stringByReplacingOccurrencesOfString:@"]" withString:@""];
    return temp;
}
@end
