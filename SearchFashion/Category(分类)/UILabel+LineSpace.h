//
//  UILabel+LineSpace.h
//  AppClient
//
//  Created by xinz on 2017/11/3.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LineSpace)
+(void)setLabelSpace:(UILabel*)label
           withValue:(NSString*)str
            withFont:(UIFont*)font
           lineSpace:(float)lineSpace ;
+(CGFloat)getSpaceLabelHeight:(NSString*)str
                     withFont:(UIFont*)font
                    withWidth:(CGFloat)width
                    lineSpace:(float)lineSpace;
@end
