//
//  UIColor+FBLCommon.h
//  FBLWoodmall
//
//  Created by 123 on 2017/2/20.
//  Copyright © 2017年 Emir. All rights reserved.
//  APP色值

#import <UIKit/UIKit.h>

@interface UIColor (FBLCommon)

+ (UIColor *)colorWithHex:(NSString *)string;

+(UIImage*)imageWithColor:(UIColor*)color;
/** 主色调 深绿色*/
+ (UIColor *)deepMainColor;
/** 主色调 */
+ (UIColor *)mainColor;
+ (UIColor *)bgColor;

+ (UIColor *)navColor;
+ (UIColor *)navTintColor;
+ (UIColor *)tabUnselectedColor;
+ (UIColor *)tabSelectedColor;
@end
