//
//  UserManager.m
//  AppClient
//
//  Created by xinz on 2017/10/28.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager

+ (instancetype)shareManager{
    static UserManager *userManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        userManager = [[UserManager alloc]init];
        userManager.isLogin = NO;
        userManager.appVersion = @"1.0";
        userManager.versionCode = 1;

        
        [userManager addObserver:userManager forKeyPath:@"loginToken" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
        

 
    });
    
    
    
    return userManager;
}


-(void)saveUserInfo:(NSDictionary *)userModelDic{
   
    [[NSUserDefaults standardUserDefaults] setObject:userModelDic forKey:@"userInfo"];
    if (self.userModel != nil) {
        [self.userModel setValuesForKeysWithDictionary:userModelDic];
        
        NSLog(@"---xx--%@",self.userModel.u_id);
        self.isLogin = YES;
    }else{
           self.userModel = [[UserModel alloc] init];
          self.isLogin = YES;

          [self.userModel setValuesForKeysWithDictionary:userModelDic];
                      NSLog(@"---xx--%@",self.userModel.u_id);
    }
       NSLog(@"-----%@==%@",self.userModel.u_id,userModelDic);
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)cleanUserInfo{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userInfo"];
    
    self.userModel = nil;
    self.isLogin = NO;
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(NSDictionary *)getLocalUserInfo{
    
    NSDictionary *userModelDic = nil;
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"] != nil)
    {
        
//        NSLog(@"xxxxxxxxxxxxxxxxxxxxx");
        userModelDic = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"];
        self.isLogin = YES;

    }else{
     self.isLogin = NO;
    }
     return userModelDic;
    
}

@end
