//
//  NextViewController.m
//  SearchFashion
//
//  Created by longhai on 2018/5/19.
//  Copyright © 2018年 study. All rights reserved.
//

#import "NextViewController.h"
#import <WXApi.h>
#import "APOrderInfo.h"
#import "payRequsestHandler.h"
#import "APRSASigner.h"
#import <AlipaySDK/AlipaySDK.h>
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"支付测试";
    
    UIButton *WXBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    WXBtn.frame = CGRectMake(100, 100, 200, 50);
    [WXBtn addTarget:self action:@selector(wxtest:) forControlEvents:UIControlEventTouchUpInside];
    [WXBtn setTitle:@"微信支付测试" forState:UIControlStateNormal];
    [self.view addSubview:WXBtn];
    
    UIButton *nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    nextBtn.frame = CGRectMake(100, 200, 200, 50);
    [nextBtn addTarget:self action:@selector(zfbtest:) forControlEvents:UIControlEventTouchUpInside];
    [nextBtn setTitle:@"支付宝支付测试" forState:UIControlStateNormal];
    [self.view addSubview:nextBtn];
    
    // Do any additional setup after loading the view.
}
- (void)zfbtest:(UIButton *)btn{
    [self doAliPayWithOrderno:@"0.1" tittle:@"买买买" content:@"测试"];
}
- (void)wxtest:(UIButton *)btn{
    
    [self weixinDopayWithOrderno:@"122222" tittle:@"hellp" content:@"bacd" prepay_id:@"123456"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)weixinDopayWithOrderno:(NSString *)orderno
                        tittle:(NSString *)tittle
                       content:(NSString *)content
                     prepay_id:(NSString *)prepay_id
{
    
    //
    [WXApi registerApp:@"wx47d8a4a9cfe7b275" enableMTA:YES];
    payRequsestHandler *req = [[payRequsestHandler alloc] init];
    //初始化支付签名对象
    [req init:APP_ID mch_id:MCH_ID];
    //设置密钥
    [req setKey:PARTNER_ID];
    //获取到实际调起微信支付的参数后，在app端调起支付
    
    NSMutableDictionary *dict = [req sendPay_demoWithOrderName:tittle orderid:orderno price:@"0.01" prepayid:prepay_id];
    
    
    //     NSLog(@"xxxxxxxxxx%@",dict);
    
    
    if(dict == nil){
        //错误提示
        NSString *debug = [req getDebugifo];
        [self showHint:debug];
        
    }else{
        
        NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
        
        //调起微信支付
        PayReq* req             = [[PayReq alloc] init];
        req.openID              =  [dict objectForKey:@"appid"];
        req.partnerId           = [dict objectForKey:@"partnerid"];
        req.prepayId            = [dict objectForKey:@"prepayid"];
        req.nonceStr            = [dict objectForKey:@"noncestr"];
        req.timeStamp           = stamp.intValue;
        req.package             = [dict objectForKey:@"package"];
        req.sign                = [dict objectForKey:@"sign"];
        [WXApi sendReq:req];
        
        
    }
}


//
// 选中商品调用支付宝极简支付
//
- (void)doAliPayWithOrderno:(NSString *)orderno tittle:(NSString *)tittle content:(NSString *)content
{
    // 重要说明
    // 这里只是为了方便直接向商户展示支付宝的整个支付流程；所以Demo中加签过程直接放在客户端完成；
    // 真实App里，privateKey等数据严禁放在客户端，加签过程务必要放在服务端完成；
    // 防止商户私密数据泄露，造成不必要的资金损失，及面临各种安全风险；
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *appID = @"2018051860155868";
    
    // 如下私钥，rsa2PrivateKey 或者 rsaPrivateKey 只需要填入一个
    // 如果商户两个都设置了，优先使用 rsa2PrivateKey
    // rsa2PrivateKey 可以保证商户交易在更加安全的环境下进行，建议使用 rsa2PrivateKey
    // 获取 rsa2PrivateKey，建议使用支付宝提供的公私钥生成工具生成，
    // 工具地址：https://doc.open.alipay.com/docs/doc.htm?treeId=291&articleId=106097&docType=1
    NSString *rsa2PrivateKey = @"MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC2ck9C6+ehGdPz3qqKy2ns1bxz3H3gPbooLz2KGqQrPOSWPCx/5JDlU1wnssc7Hd/tT9GY3fzuJ+wU+Sl+0qVaPofZDfKHcDQq+1nbImBpUQ4h2VgTODNoB/85kyLvB3isV6Lw8//EOpDDTYsVZlywv7cZOgCRk1LZ3VO3gNVown9gTuZC8/381XF87AvMiAyorDpemFe6O2KqnCqRpd/RBHITtgi8HIyDi+ngQ3Mh+ZwqDsjtcQj8SllMMy0VrEdLIcqoY7Xyaq/T7qR9qnWtndRWoMnKJyFOJGl0xzif06vuFiDV9Nt9gq+cmEKDNxJG1ohvP8SjObI1pIknbovvAgMBAAECggEAfAnDMXBJDhINM6OStsIMxeOaN/sT6TyOL3vOjvIF4w+HKUzHxDuU9xRxdtvo75wj/adijFd/+jpSGwA64eo8WNpiaYM9/C6giQhR0tXQTkm5HfIyGv7+lB+7uVz7Rx8BP8plEQQSQ0q92MoDYQ0yv0fYJ+JzOIW8sjnzDLMeZBWP5WwQxZNqZpIKnQ1YWfQpYq1R/etIxZb01dqLrCDZaSZMK/lcdnJ/UxNrUlIMI/U71KVLL8aWZs3EXWTtNETkN3x80zgKshhCID/YnfDXQTa+h4mpM/zjlxEogayiX7N4udduUxu2fzguWTkGZqs+QzYoouKZ7LMHH9gAErAlYQKBgQDxxHF1owHwwXSO1LVzpy/mt3hCHC/OKKv0FGSA0Jauw92+8qI23ca3axRFTdsa1ni+hmmde4qzlQ62KOqkGSRb/CuMRasYvIe0hbFvOsZGD7CQNCiP58DlE65Fibr5776J6UjW7xKxcbu3pus1XferiV5yMFIyAJsSFs2dT1V2wwKBgQDBL98PH9dM5481/wSH4OCHcJn2IF0801w2pKdk8+SqXQ/2bm1VWfaPfv+pUbo9XwHppe/c+ibVG6Sl8kz0rLlrl/MdxoFgaPWYl/pe2Vki2ZPSCY5DC3rOjphur7Nw4Rfdhh9biafNjF7xDpHGBFm71Ftn5V7NUCdTRirUhk17ZQKBgE/CpD/QAFLiL8bzS82U6YuvGaCN1gOojVof5CxPJHcRrTVSrMt3DRjz3aMjlVZcTUdl5rAK0u5+DXVxOD/c/47NOby0O0cU45xdwvTUKhdxE6nvWzZmmc+5V3QfhSzxuCWdbedixgL+Z5SmH9DiaFQSJLN9V5ChfIdSOJFeW+6rAoGAYpx6AvFg6CunCYv0Fxvt4JTUsjMRBNRq1KW1oK1yQpggZs01WAUE+3h7LkW+iEcv5cFDMAwsuElVATQunhJwz4APpFpIfhr1in/BWJsfic+ASg2Apa59cGSPYKilMvBjSzuEVChvFFgbunaSaH6eA2fBhMYrXygT+sjtYfBwKpUCgYEAztlmqFRKyTDe2lXBwaO7i2bRhnhAOddGohW/nlMSBd0dBT/LoblcO0KGiCwnHrEuITPf1Z8m9nPan6bVPmrgmn//StvaJo2DIKlrAaDjRohI5sasTUojqtPio/4qpO1lXYjDSgj3mwLfcZUldOpqpU5xK8JyCqN3XX8HzpY5wWw=";
    
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    APOrderInfo* order = [APOrderInfo new];
    
    // NOTE: app_id设置
    order.app_id = appID;
    
    // NOTE: 支付接口名称
    order.method = @"alipay.trade.app.pay";
    
    // NOTE: 参数编码格式
    order.charset = @"utf-8";
    
    // NOTE: 当前时间点
    NSDateFormatter* formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    order.timestamp = [formatter stringFromDate:[NSDate date]];
    
    // NOTE: 支付版本
    order.version = @"1.0";
    
    // NOTE: sign_type 根据商户设置的私钥来决定
    order.sign_type = (rsa2PrivateKey.length > 1)?@"RSA2":@"RSA";
    
    order.notify_url = [NSString stringWithFormat:@"%@index.php/alipaymsg", kBaseUrl];
    // NOTE: 商品数据
    order.biz_content = [APBizContent new];
    order.biz_content.body = content;
    order.biz_content.subject = tittle;
    order.biz_content.out_trade_no = orderno; //订单ID（由商家自行制定）
    order.biz_content.timeout_express = @"30m"; //超时时间设置
    order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f",0.1]; //商品价格
    //     order.biz_content.total_amount = [NSString stringWithFormat:@"%.2f", 0.01];
    order.return_url = [NSString stringWithFormat:@"%@index.php/alipaymsg", kBaseUrl];
    
    //将商品信息拼接成字符串
    NSString *orderInfo = [order orderInfoEncoded:NO];
    NSString *orderInfoEncoded = [order orderInfoEncoded:YES];
    NSLog(@"orderSpec = %@",orderInfo);
    
    // NOTE: 获取私钥并将商户信息签名，外部商户的加签过程请务必放在服务端，防止公私钥数据泄露；
    //       需要遵循RSA签名规范，并将签名字符串base64编码和UrlEncode
    NSString *signedString = nil;
    APRSASigner* signer = [[APRSASigner alloc] initWithPrivateKey:rsa2PrivateKey];
    if ((rsa2PrivateKey.length > 1)) {
        signedString = [signer signString:orderInfo withRSA2:YES];
    } else {
        signedString = [signer signString:orderInfo withRSA2:NO];
    }
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"SearchFashion";
        
        // NOTE: 将签名成功字符串格式化为订单字符串,请严格按照该格式
        NSString *orderString = [NSString stringWithFormat:@"%@&sign=%@",
                                 orderInfoEncoded, signedString];
        
        
        NSLog(@"%@",orderString);
        
        // NOTE: 调用支付结果开始支付
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            
            
            
            
            NSLog(@"=------------------------------------------%@",resultDic);
            NSString *resultStatus = [NSString stringWithFormat:@"%@",[resultDic objectForKey:@"resultStatus"]];
            
            
            
            NSLog(@"reslut = %@",resultDic);
        }];
    }
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
