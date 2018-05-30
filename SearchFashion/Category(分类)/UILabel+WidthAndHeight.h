//
//  UILabel+WidthAndHeight.h
//  AppClient
//
//  Created by xinz on 2017/11/8.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WidthAndHeight)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font;
+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

@end
