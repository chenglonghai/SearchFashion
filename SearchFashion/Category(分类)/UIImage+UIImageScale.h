//
//  UIImage+UIImageScale.h
//  AppClient
//
//  Created by xinz on 2017/10/23.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImageScale)
-(UIImage*)getSubImage:(CGRect)rect;
-(UIImage*)scaleToSize:(CGSize)size;
+(UIImage *)boxblurImage:(UIImage *)image withBlurNumber:(CGFloat)blur;
@end
