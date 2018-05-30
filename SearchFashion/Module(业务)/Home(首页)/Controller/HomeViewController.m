//
//  HomeViewController.m
//  SearchFashion
//
//  Created by longhai on 2018/5/19.
//  Copyright © 2018年 study. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginViewController.h"
#import "PresentViewController.h"
#import "NextViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(100, 100, 200, 50);
    [loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    nextBtn.frame = CGRectMake(100, 200, 200, 50);
    [nextBtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"push" forState:UIControlStateNormal];
    [self.view addSubview:nextBtn];
    // Do any additional setup after loading the view.
}
- (void)login:(UIButton *)btn
{
   LoginViewController *loginVC = [LoginViewController new];
   [self presentViewController:loginVC animated:YES completion:nil];

    
}

- (void)push:(UIButton *)btn
{
    NextViewController *nVC = [NextViewController new];
    [self.navigationController pushViewController:nVC animated:YES];

    
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
