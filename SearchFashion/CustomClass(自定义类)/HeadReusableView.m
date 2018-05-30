//
//  HeadReusableView.m
//  YuanDaiTong
//
//  Created by 陈龙海 on 14-12-23.
//  Copyright (c) 2014年 陈龙海. All rights reserved.
//

#import "HeadReusableView.h"

@implementation HeadReusableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        self.backgroundColor = [UIColor redColor];
//        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 , 20, 150, 50)];
//        _titleLabel.center = CGPointMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
//        [self addSubview:_titleLabel];
//        [_titleLabel release];
        self.showView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        self.showView.backgroundColor    = [UIColor clearColor];
        
        [self addSubview:_showView];
//        [_showView release];
        
        // Initialization code
    }
    return self;
}


//- (void)dealloc
//{
//    self.showView = nil;
//    [super dealloc];
//}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
