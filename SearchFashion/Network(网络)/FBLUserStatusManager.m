//
//  FBLUserStatusManager.m
//  FBLWoodmall
//
//  Created by 陈龙海on 2017/3/17.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import "FBLUserStatusManager.h"

@implementation FBLUserStatusManager

+ (instancetype)shareManager{
    static FBLUserStatusManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FBLUserStatusManager alloc]init];
        manager.isCloseEye = NO;
        [manager addObserver:manager forKeyPath:@"loginToken" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
    });
    return manager;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"loginToken"]) {
        if (object == self) {
         //   [[NSNotificationCenter defaultCenter] postNotificationName:kUserLoginTokenChangedNotification object:nil];
        }
    }
}

-(void)saveUserInfo:dict{
    NSLogDebug(@"%@",dict);
    self.isLogin = YES;
    [[NSUserDefaults standardUserDefaults]setObject:dict forKey:@"userInfo"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    self.loginToken = [[dict objectForKey:@"certificateBO" ]objectForKey:@"token"];
    self.cellPhoneNum = [[dict objectForKey:@"tuUser" ]objectForKey:@"mobile"];
    self.email = [[dict objectForKey:@"tuUser" ]objectForKey:@"email"];
    self.userName = [[dict objectForKey:@"tuUser" ]objectForKey:@"name"];
    self.headImageUrl = [[dict objectForKey:@"tuUser" ]objectForKey:@"headImg"];
    self.accountNo = [NSString stringWithFormat:@"%@",[dict objectForKey:@"accountNo" ]];
      self.accountNo = [NSString stringWithFormat:@"%@",[dict objectForKey:@"accountNo" ]];
    if([[NSString stringWithFormat:@"%@",[[dict objectForKey:@"tuUser" ]objectForKey:@"userType"]]isEqualToString:@"0"]){
        self.isCompany = NO;
    }else{
        self.isCompany = YES;
    }
    
}

-(void)cleanUserInfo{
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"userInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.isLogin = NO;
    self.loginToken = @"";
}

- (NSString *)loginToken {
    
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"] != nil) {
        NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
        NSLogDebug(@"%@",userInfo);
        return [[userInfo objectForKey:@"certificateBO" ]objectForKey:@"token"];
    }

    return @"";
}

- (NSString *)userName {
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"] != nil) {
        NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
        NSLogDebug(@"%@",userInfo);
        return [[userInfo objectForKey:@"tuUser"]objectForKey:@"name"];
    }
    
    return @"";
}

-(void)getLocalUserInfo{
    
    if([[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"] != nil)
    {
        
       NSDictionary *dict = [[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"];

        
        NSLog(@"==----%@", dict);;
        
        if (self.loginToken.length > 0) {
            self.isLogin = YES;
            self.cellPhoneNum = [[dict objectForKey:@"tuUser" ] objectForKey:@"mobile"];
            self.email = [[dict objectForKey:@"tuUser" ]objectForKey:@"email"];
            self.userName = [[dict objectForKey:@"tuUser" ]objectForKey:@"name"];
            self.headImageUrl = [[dict objectForKey:@"tuUser" ]objectForKey:@"headImg"];
             self.accountNo = [NSString stringWithFormat:@"%@",[dict objectForKey:@"accountNo" ]];
            if([[NSString stringWithFormat:@"%@",[[dict objectForKey:@"tuUser" ]objectForKey:@"userType"]]isEqualToString:@"0"]){
                self.isCompany = NO;
            }else{
                self.isCompany = YES;
            }
        }
       // self.isLogin = YES;
        
    }
//    else{
    
        //self.isLogin = NO;
        
//    }
}

-(void)setUserAccountInfoWithDict:(NSDictionary *)dict{
    self.totalAccount = [NSString stringWithFormat:@"%@",[dict objectForKey:@"availableBalance"]];
    self.freezeAccount = [NSString stringWithFormat:@"%@",[dict objectForKey:@"balance"]];
    self.usableAccount = [NSString stringWithFormat:@"%@",[dict objectForKey:@"unbalance"]];;
}

@end
