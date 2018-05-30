//
//  NSString+RegexString.m
//  AppClient
//
//  Created by xinz on 2017/10/27.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import "NSString+RegexString.h"

@implementation NSString (RegexString)
+(BOOL)validateMobile:(NSString *)mobile
{
    // 130-139  150-153,155-159  180-189  145,147  170,171,173,176,177,178
    NSString *phoneRegex = @"^((13[0-9])|(15[^4,\\D])|(18[0-9])|(14[57])|(17[013678]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}
@end
