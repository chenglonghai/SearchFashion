//
//  NSString+Trim.m
//  AppClient
//
//  Created by xinz on 2017/11/24.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import "NSString+Trim.h"

@implementation NSString (Trim)
+ (NSString *)trim:(NSString *)val trimCharacterSet:(NSCharacterSet *)characterSet {
       NSString *returnVal = @"";
       if (val) {
               returnVal = [val stringByTrimmingCharactersInSet:characterSet];
           }
      return returnVal;
  }
+ (NSString *)trimWhitespace:(NSString *)val {
      return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceCharacterSet]]; //去掉前后空格
  }
 + (NSString *)trimNewline:(NSString *)val {
      return [self trim:val trimCharacterSet:[NSCharacterSet newlineCharacterSet]]; //去掉前后回车符
}
+ (NSString *)trimWhitespaceAndNewline:(NSString *)val {
    return [self trim:val trimCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]; //去掉前后空格和回车符
  }

@end
