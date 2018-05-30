//
//  UIImageView+CLHDownImage.m
//  AppClient
//
//  Created by xinz on 2018/1/11.
//  Copyright © 2018年 Chenlonghai. All rights reserved.
//

#import "UIImageView+CLHDownImage.h"

@implementation UIImageView (CLHDownImage)
- (void)clh_sd_setImageWithURL:(nullable NSURL *)url
{
    if (![url.absoluteString hasPrefix:@"http"]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",kBaseUrl,url.absoluteString]];
    }
    
    [self sd_setImageWithURL:url];
}
- (void)clh_sd_setImageWithURL:(nullable NSURL *)url placehold:(UIImage *)placehold{
    
    if (![url.absoluteString hasPrefix:@"http"]) {
        url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/%@",kBaseUrl,url.absoluteString]];
    }
    
    [self sd_setImageWithURL:url placeholderImage:placehold];
}
@end
