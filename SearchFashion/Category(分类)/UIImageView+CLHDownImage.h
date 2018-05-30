//
//  UIImageView+CLHDownImage.h
//  AppClient
//
//  Created by xinz on 2018/1/11.
//  Copyright © 2018年 Chenlonghai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (CLHDownImage)
- (void)clh_sd_setImageWithURL:(nullable NSURL *)url;
- (void)clh_sd_setImageWithURL:(nullable NSURL *)url placehold:(UIImage *)placehold;

@end
