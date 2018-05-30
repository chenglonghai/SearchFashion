//
//  UserManager.h
//  AppClient
//
//  Created by xinz on 2017/10/28.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserManager : NSObject

@property (nonatomic, strong) UserModel *userModel;
@property (nonatomic, strong) NSString *appVersion;
@property (nonatomic, assign) int versionCode;

@property (nonatomic, assign) BOOL isLogin;



+ (instancetype)shareManager;

-(void)saveUserInfo:(NSDictionary *)userModelDic;
-(void)cleanUserInfo;
-(NSDictionary *)getLocalUserInfo;
@end
