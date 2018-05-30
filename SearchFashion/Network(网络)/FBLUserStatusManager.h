//
//  FBLUserStatusManager.h
//  FBLWoodmall
//
//  Created by 陈龙海on 2017/3/17.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBLUserStatusManager : NSObject

+ (instancetype)shareManager;

@property(nonatomic, strong)NSString *userName;//用户名
@property(nonatomic, strong)NSString *userID;//账号
@property(nonatomic, strong)NSString *loginToken;//服务端验证id
@property(nonatomic, strong)NSString *headImageUrl;//用户头像Url
@property(nonatomic, strong)NSString *cellPhoneNum;//手机号
@property(nonatomic, strong)NSString *email;//邮箱
@property(nonatomic, assign)BOOL isLogin;//判断是否登录
@property(nonatomic, assign)BOOL isCompany;//是否是企业

@property(nonatomic, strong)NSString *totalAccount;
@property(nonatomic, strong)NSString *freezeAccount;
@property(nonatomic, strong)NSString *usableAccount;

@property (nonatomic, strong)  NSString *accountNo;

//交易睁眼闭眼

@property (nonatomic, assign)BOOL isCloseEye;




-(void)saveUserInfo:(NSDictionary *)dict;//登录
-(void)cleanUserInfo;//退出登录
-(void)getLocalUserInfo;//客户端启动读登录状态

-(void)setUserAccountInfoWithDict:(NSDictionary *)dict;//设置用户账户信息

@end
