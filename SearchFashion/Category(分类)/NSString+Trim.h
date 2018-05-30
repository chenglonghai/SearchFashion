//
//  NSString+Trim.h
//  AppClient
//
//  Created by xinz on 2017/11/24.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trim)
+ (NSString *)trim:(NSString *)val trimCharacterSet:(NSCharacterSet *)characterSet;
+ (NSString *)trimWhitespace:(NSString *)val;
+ (NSString *)trimNewline:(NSString *)val;
+ (NSString *)trimWhitespaceAndNewline:(NSString *)val;
@end
