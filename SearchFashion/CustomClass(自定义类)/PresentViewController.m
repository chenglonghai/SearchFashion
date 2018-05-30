//
//  PresentViewController.m
//  SearchFashion
//
//  Created by longhai on 2018/5/19.
//  Copyright © 2018年 study. All rights reserved.
//

#import "PresentViewController.h"
#import "AppDelegate.h"
#import "WRNavigationBar.h"
@interface PresentViewController ()

@end

@implementation PresentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupNavBar];
}

- (void)setupNavBar
{
    [self.view addSubview:self.customNavBar];
    
    // 设置自定义导航栏背景图片
//    self.customNavBar.barBackgroundImage = [UIImage imageNamed:@"millcolorGrad"];
     self.customNavBar.barBackgroundImage = [UIColor imageWithColor:[UIColor navColor]];
    // 设置自定义导航栏标题颜色
    self.customNavBar.titleLabelColor = [UIColor whiteColor];
    
    if (self.navigationController.childViewControllers.count != 1) {
//        [self.customNavBar wr_setLeftButtonWithTitle:@"<" titleColor:[UIColor whiteColor]];
        [self.customNavBar wr_setLeftButtonWithImage:[UIImage imageNamed:@"navLeft"]];
    }
}

- (WRCustomNavigationBar *)customNavBar
{
    if (_customNavBar == nil) {
        _customNavBar = [WRCustomNavigationBar CustomNavigationBar];
    }
    return _customNavBar;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
