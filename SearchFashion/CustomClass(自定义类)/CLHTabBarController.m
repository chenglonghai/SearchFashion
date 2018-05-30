//
//  CLHTabBarController.m
//  AppClient
//
//  Created by APAPA on 2017/6/27.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import "CLHTabBarController.h"

#import "HomeViewController.h"
#import "ModuleForOneViewController.h"
#import "ModuleForTwoViewController.h"
#import "PersonViewController.h"
#import "BaseNavigationController.h"
#import "WRNavigationBar.h"
#import "NoneViewController.h"


UIColor *MainNavBarColor = nil;
UIColor *MainViewColor = nil;
@interface CLHTabBarController ()

@end

@implementation CLHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configViewControllers];
    // Do any additional setup after loading the view.
}
- (void)configViewControllers {

    HomeViewController *firstVC = [[HomeViewController alloc] init];
    [self addChildVc:firstVC title:NSLocalizedString(@"模块1", nil) image:@"uimage" selectedImage:@"simage"];

    ModuleForOneViewController *secondVC = [[ModuleForOneViewController alloc] init];
    [self addChildVc:secondVC title:NSLocalizedString(@"模块2", nil) image:@"uimage" selectedImage:@"simage"];

    ModuleForTwoViewController *thirdVC = [[ModuleForTwoViewController alloc] init];
    [self addChildVc:thirdVC title:NSLocalizedString(@"模块3", nil) image:@"uimage" selectedImage:@"simage"];

    PersonViewController *fourthVC = [[PersonViewController alloc] init];
    [self addChildVc:fourthVC title:NSLocalizedString(@"模块4", nil) image:@"uimage" selectedImage:@"simage"];

//  [self setNavBarAppearence];

}

- (void)addChildVc: (NoneViewController *)childVc title: (NSString *)title image: (NSString *)image selectedImage: (NSString *)selectedImage {

    BaseNavigationController   *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];

    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor tabUnselectedColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor tabUnselectedColor];

    [nav.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [nav.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    nav.tabBarItem.title = title;
}
- (void)setNavBarAppearence
{
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor purpleColor]}];
    //    [UINavigationBar appearance].tintColor = [UIColor yellowColor];
    //    [UINavigationBar appearance].barTintColor = [UIColor redColor];
    
    MainNavBarColor = [UIColor navColor];
    MainViewColor   = [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1];
    
    // 设置是 广泛使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是广泛使用
    [WRNavigationBar wr_widely];
//    [WRNavigationBar wr_setBlacklist:@[@"PersonViewController"]];
    
    // 设置导航栏默认的背景颜色
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:MainNavBarColor];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
