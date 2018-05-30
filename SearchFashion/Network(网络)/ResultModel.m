//
//  ResultModel.m
//  AppClient
//
//  Created by xinz on 2017/10/28.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import "ResultModel.h"

@implementation ResultModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"code"]) {
        self.code = [NSString stringWithFormat:@"%@",value];
    }
    if ([key isEqualToString:@"msg"]) {
        self.msg = [NSString stringWithFormat:@"%@",value];
    }
}
@end
