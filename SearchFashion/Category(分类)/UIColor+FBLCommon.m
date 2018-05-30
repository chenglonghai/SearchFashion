//
//  UIColor+FBLCommon.m
//  FBLWoodmall
//
//  Created by 123 on 2017/2/20.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import "UIColor+FBLCommon.h"

@implementation UIColor (FBLCommon)

+ (UIColor *)colorWithHex:(NSString *)string {
    NSString *cleanString = [string stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}


+(UIImage*)imageWithColor:(UIColor*)color

{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    
    CGContextFillRect(context, rect);
    
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    
    return image;
    
}
/** 主色调 深绿色*/
+ (UIColor *)deepMainColor {
    return [UIColor colorWithHex:@"#8CC63F"];
}
//主题色
/** 主色调 绿色*/
+ (UIColor *)mainColor {
    return [UIColor colorWithHex:@"#FFFFFF"];
}

+ (UIColor *)bgColor
{
    return [UIColor colorWithRed:249/255.0 green:249/255.0 blue:249/255.0 alpha:1];
}

/** 导航栏颜色 **/
+ (UIColor *)navColor{
       return [UIColor colorWithHex:@"#8CC63F"];
}
+ (UIColor *)navTintColor
{
       return [UIColor whiteColor];
}
+ (UIColor *)tabUnselectedColor
{
       return [UIColor grayColor];
}
+ (UIColor *)tabSelectedColor
{
       return [UIColor colorWithHex:@"#8CC63F"];
}



@end
