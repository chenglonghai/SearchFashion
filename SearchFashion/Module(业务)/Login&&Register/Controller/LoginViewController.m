//
//  LoginViewController.m
//  SearchFashion
//
//  Created by longhai on 2018/5/19.
//  Copyright © 2018年 study. All rights reserved.
//

#import "LoginViewController.h"
#import "NSString+RegexString.h"
#import "UIButton+CountDown.h"
#import "CLHSessionManager.h"
#import <UMShare/UMShare.h>
#define BORD_H 44
@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *loginLabel;
@property (nonatomic, strong) UILabel *countryLabel;
@property (nonatomic, strong) UITextField *phoneTF;
@property (nonatomic, strong) UITextField *codeTF;
@property (nonatomic, strong) UIButton *codeBtn;

@property (nonatomic, strong) UIButton *loginBtn;

@property (nonatomic, strong) UIButton *wxBtn;

@end

@implementation LoginViewController

- (void)addUI{
    
    self.loginLabel = [[UILabel alloc] init];
    [self.view addSubview:self.loginLabel];
    self.countryLabel = [[UILabel alloc] init];
    [self.view addSubview:self.countryLabel];
    
    self.phoneTF = [[UITextField alloc] init];
    [self.view addSubview:self.phoneTF];
    
    
    self.codeTF=[[UITextField alloc] init];
    [self.view addSubview:self.codeTF];
    
    self.codeBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.codeBtn];
    
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.loginBtn];
    
    self.wxBtn = [UIButton  buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:self.wxBtn];
    
    [self.loginLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(28);
        make.top.equalTo(self.view).offset(30 +kNavBarHeight);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    self.loginLabel.textColor = [UIColor mainColor];
    self.loginLabel.text = @"登录";
    self.loginLabel.font = [UIFont systemFontOfSize:24.0f weight:5];
    
    
    
    [self.countryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.loginLabel.mas_left).offset(0);
        make.top.equalTo(self.loginLabel.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(50, BORD_H));
    }];
    self.countryLabel.text = @"+86";
    self.countryLabel.textColor = [UIColor grayColor];
    self.countryLabel.font = [UIFont systemFontOfSize:18];
    
    
    
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.backgroundColor = [UIColor grayColor];
    lineView1.alpha  = 0.5;
    [self.view addSubview:lineView1];
    
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countryLabel.mas_right).offset(0.5);
        make.top.equalTo(self.countryLabel.mas_top).offset(12);
        make.size.mas_equalTo(CGSizeMake(0.5, 20));
    }];
    
    
    
    [self.phoneTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView1.mas_right).offset(10);
        make.top.equalTo(self.loginLabel.mas_bottom).offset(30);
        make.height.equalTo(@BORD_H);
        make.right.equalTo(self.view).offset(-28);
    }];
    self.phoneTF.placeholder = @"请输入手机号";
    self.phoneTF.delegate = self;
    self.phoneTF.keyboardType = UIKeyboardTypeNumberPad;
    [self.phoneTF addTarget:self action:@selector(phone:) forControlEvents:UIControlEventEditingChanged];
    
    
    
    UIView *lineView2 = [[UIView alloc] init];
    lineView2.backgroundColor = [UIColor grayColor];
    lineView2.alpha = 0.5;
    [self.view addSubview:lineView2];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countryLabel.mas_left).offset(0);
        make.top.equalTo(self.countryLabel.mas_bottom).offset(0);
        make.right.equalTo(self.view).offset(-28);
        make.height.equalTo(@0.5);
    }];
    
    
    
    
    [self.codeTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countryLabel.mas_left).offset(0);
        make.top.equalTo( lineView2.mas_bottom).offset(27);
        make.right.equalTo(self.view).offset(-(28+64));
        make.height.equalTo(@44);
    }];
    [self.codeTF addTarget:self action:@selector(code:) forControlEvents:UIControlEventEditingChanged];
    self.codeTF.placeholder = @"输入验证码";
    self.codeTF.delegate = self;
    self.codeTF.keyboardType = UIKeyboardTypeNumberPad;
    
    
    
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.codeTF.mas_right).offset(-30);
        make.top.equalTo( self.codeTF.mas_top).offset(7);
        make.right.equalTo(self.view).offset(-28);
        make.height.equalTo(@30);
    }];
    [self.codeBtn setTitle:@"发送验证码" forState:UIControlStateNormal];
    [self.codeBtn addTarget:self action:@selector(countDownBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.codeBtn setTintColor:[UIColor whiteColor]];
    self.codeBtn.backgroundColor = [UIColor grayColor];
    self.codeBtn.userInteractionEnabled = NO;
    self.codeBtn.layer.cornerRadius = 6;
    self.codeBtn.clipsToBounds = YES;
    
    
    UIView *lineView3 = [[UIView alloc] init];
    lineView3.backgroundColor = [UIColor grayColor];
    lineView3.alpha = 0.5;
    [self.view addSubview:lineView3];
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countryLabel.mas_left).offset(0);
        make.top.equalTo(self.codeTF.mas_bottom).offset(0);
        make.right.equalTo(self.view).offset(-28);
        make.height.equalTo(@0.5);
    }];
    
    
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(28);
        make.top.equalTo( lineView3.mas_bottom).offset(50);
        make.right.equalTo(self.view).offset(-28);
        make.height.equalTo(@40);
    }];
    [self.loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn setTintColor:[UIColor whiteColor]];
    self.loginBtn.backgroundColor = [UIColor grayColor];
    self.loginBtn.userInteractionEnabled = NO;
    self.loginBtn.layer.cornerRadius = 20;
    self.loginBtn.clipsToBounds = YES;
    
    [self.wxBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(28);
        make.top.equalTo( self.loginBtn.mas_bottom).offset(50);
        make.right.equalTo(self.view).offset(-28);
        make.height.equalTo(@40);
    }];
    [self.wxBtn addTarget:self action:@selector(wxlogin:) forControlEvents:UIControlEventTouchUpInside];
    [self.wxBtn setTitle:@"微信登录" forState:UIControlStateNormal];
    [self.wxBtn setTintColor:[UIColor whiteColor]];
    self.wxBtn.backgroundColor = [UIColor navColor];
    self.wxBtn.layer.cornerRadius = 20;
    self.wxBtn.clipsToBounds = YES;
    
    
}
- (void)wxlogin:(UIButton *)wxlogin{
    [self getAuthWithUserInfoFromWechat];
}
- (void)getAuthWithUserInfoFromWechat
{
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:UMSocialPlatformType_WechatSession currentViewController:self completion:^(id result, NSError *error) {
        if (error) {
        } else {
            UMSocialUserInfoResponse *resp = result;
            // 授权信息
            NSLog(@"Wechat uid: %@", resp.uid);
            NSLog(@"Wechat openid: %@", resp.openid);
            NSLog(@"Wechat unionid: %@", resp.unionId);
            NSLog(@"Wechat accessToken: %@", resp.accessToken);
            NSLog(@"Wechat refreshToken: %@", resp.refreshToken);
            NSLog(@"Wechat expiration: %@", resp.expiration);
            // 用户信息
            NSLog(@"Wechat name: %@", resp.name);
            NSLog(@"Wechat iconurl: %@", resp.iconurl);
            NSLog(@"Wechat gender: %@", resp.unionGender);
            // 第三方平台SDK源数据
            NSLog(@"Wechat originalResponse: %@", resp.originalResponse);
        }
    }];
}
- (void)login:(UIButton *)login{
    
    [self checkCode:self.codeTF.text phone:self.phoneTF.text];
    
}
- (void)phone:(UITextField *)textTF{
    
    
    //   NSLog(@"phone---%@==%ld",textTF.text,[NSString validateMobile:textTF.text]);
    if ([NSString validateMobile:textTF.text] == YES) {
        self.codeBtn.backgroundColor = [UIColor grayColor];
        self.codeBtn.userInteractionEnabled = YES;
    }else{
        if (textTF.text.length == 11) {
            NSLog(@"手机号码不对");
            
            [self showHint:@"手机号码不对"];
            
        }
        self.codeBtn.backgroundColor = [UIColor grayColor];
        self.codeBtn.userInteractionEnabled = NO;
    }
    if (textTF.text.length == 4 && [NSString validateMobile:self.phoneTF.text] == YES) {
        self.loginBtn.backgroundColor = [UIColor grayColor];
        self.loginBtn.userInteractionEnabled = YES;
    }else{
        self.loginBtn.backgroundColor = [UIColor grayColor];
        self.loginBtn.userInteractionEnabled = NO;
    }
    
    
    
}
- (void)countDownBtnAction:(UIButton *)button{
    
    [self sendCode:self.phoneTF.text];
    
    
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField == self.phoneTF) {
        if (textField.text.length > 10){
            textField.text = [textField.text substringToIndex:10];
        }
    }
    
    if (textField == self.codeTF) {
        if (textField.text.length > 3){
            textField.text = [textField.text substringToIndex:3];
        }
    }
    return YES;
}

- (void)code:(UITextField *)textTF{
    NSLog(@"code---%@",textTF.text);
    
    if (textTF.text.length == 4 && [NSString validateMobile:self.phoneTF.text] == YES) {
        self.loginBtn.backgroundColor = [UIColor grayColor];
        self.loginBtn.userInteractionEnabled = YES;
    }else{
        self.loginBtn.backgroundColor = [UIColor grayColor];
        self.loginBtn.userInteractionEnabled = NO;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.customNavBar.title = @"登录";
    [self addUI];
    
    self.view.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1];
    // Do any additional setup after loading the view.
}

- (void)sendCode:(NSString *)phone{
    
    
    [self.codeTF resignFirstResponder];
    [self.phoneTF resignFirstResponder];
    NSString *url=  kBaseUrl;
    //构造参数
    NSString  *paramsJson=[NSString stringWithFormat:@"{\"phone\":\"%@\",\"u_ostype\":\"%@\",\"u_deviceToken\":\"%@\",\"u_system\":\"%@\",\"u_version\":\"%@\"}", phone,[NSString getPhoneModel],[NSString getIdentifierStr],[NSString getPhoneVersion],[UserManager shareManager].appVersion];
    
           NSLog(@"===%@==",paramsJson );
    //AFN管理者调用get请求方法
    [[CLHSessionManager shareManager] requestDataWithPath:[url stringByAppendingString:@"index.php/sendcode"] paramsJson:paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error, ResultModel *resultModel) {
        
        
        NSLog(@"===%@==%@==%@",data,error,resultModel.data );
        if ([[NSString stringWithFormat:@"%@", resultModel.code] isEqualToString:@"1"]) {
            [self showHint:@"验证码已发送"];
            [self.codeBtn startWithTime:90 title:@"验证码" countDownTitle:@"s" mainColor:[UIColor grayColor] countColor:[UIColor grayColor]];
        }
    }];
    
}


- (void)checkCode:(NSString *)code phone:(NSString *)phone{
    [self.codeTF resignFirstResponder];
    [self.phoneTF resignFirstResponder];
    NSString *url=  kBaseUrl;
    //构造参数
    NSString  *paramsJson=[NSString stringWithFormat:@"{\"phone\":\"%@\",\"code\":\"%@\",\"u_ostype\":\"%@\",\"u_deviceToken\":\"%@\",\"u_version\":\"%@\",\"u_system\":\"%@%@\"}", phone,code,[NSString getPhoneModel],[NSString getIdentifierStr],[NSString appCurVersion],[NSString getDeviceName],[NSString getPhoneVersion]];
    
    NSLog(@"%@",paramsJson);
    //AFN管理者调用get请求方法
    [[CLHSessionManager shareManager] requestDataWithPath:[url stringByAppendingString:@"index.php/checklogin"] paramsJson:paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error, ResultModel *resultModel) {
        NSLog(@"===%@==%@==%@=%@",error,resultModel.data,resultModel.code,resultModel.msg );
        if ([[NSString stringWithFormat:@"%@", resultModel.code] isEqualToString:@"1"]) {
            
            [self showHint:@"登录成功"];
            NSMutableDictionary *dataDic =[self setChangeDicContent:resultModel.data];
            [[UserManager shareManager] saveUserInfo:dataDic];
            NSLog(@"=======%@",dataDic);
            
//            MainViewController *mianVC =  [self getMianVC];
//            [mianVC.unityVC clearLocalData];
//            [UnityTestViewController getModelBodys];
//
//            [UserManager shareManager].isPresent = NO;
//            NSLog(@"==--%d",[UserManager shareManager].isPresent);
            [self dismissViewControllerAnimated:YES completion:nil];
            
            
        }else{
            [self showHint:[NSString stringWithFormat:@"%@",resultModel.msg]];
        }
        
        
    }];
    
}

-(NSMutableDictionary *)setChangeDicContent:(NSDictionary *)keyedValues

{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithDictionary:keyedValues];
    
    NSArray *valueArray= [dic allKeys];
    
    for (NSString *key in valueArray) {
        
        if ([[dic objectForKey:key] isEqual:[NSNull null]]) {
            
            [dic setObject:@"" forKey:key];
            
        }
        
    }
    
    return dic ;
    
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
#pragma mark 微信登录回调。
-(void)loginSuccessByCode:(NSString *)code{
    NSLog(@"code %@",code);
    __weak typeof(*&self) weakSelf = self;
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];//请求
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json",@"text/plain", nil];
    //通过 appid  secret 认证code . 来发送获取 access_token的请求
    [manager GET:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",URL_APPID,URL_SECRET,code] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {  //获得access_token，然后根据access_token获取用户信息请求。
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic %@",dic);
        
        /*
         access_token    接口调用凭证
         expires_in    access_token接口调用凭证超时时间，单位（秒）
         refresh_token    用户刷新access_token
         openid    授权用户唯一标识
         scope    用户授权的作用域，使用逗号（,）分隔
         unionid     当且仅当该移动应用已获得该用户的userinfo授权时，才会出现该字段
         */
        NSString* accessToken=[dic valueForKey:@"access_token"];
        NSString* openID=[dic valueForKey:@"openid"];
        [weakSelf requestUserInfoByToken:accessToken andOpenid:openID];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %@",error.localizedFailureReason);
    }];
    
}

-(void)requestUserInfoByToken:(NSString *)token andOpenid:(NSString *)openID{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",token,openID] parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //开发人员拿到相关微信用户信息后， 需要与后台对接，进行登录
        NSLog(@"login success dic  ==== %@",dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error %ld",(long)error.code);
    }];
}

@end
