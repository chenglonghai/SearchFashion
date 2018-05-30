//
//  FBLAPIManager.m
//  FBLWoodmall
//
//  Created by 123 on 2017/3/13.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import "FBLAPIManager.h"

/** 登录 */
static NSString *kLoginPath = @"user/authentication";

/** 注册 */
static NSString *kRegisterPath = @"user/register";

//用户信息
static NSString *kUserStatusPath = @"inter/mobile/inter/status";

//个人实名认证
static NSString *kAuthPersonPath = @"inter/mobile/inter/authPerson";

//安全中心
static NSString *kSecurityCenterPath = @"inter/mobile/queryMobile";

/** 修改密码 */
static NSString *kRevisePassWordPath = @"inter/mobile/updatePwd";

//修改手机
//static NSString *kChangePhonePath = @"inter/mobile/saveMobile";

//修改手机
static NSString *kChangePhonePath = @"mobile/inter/saveMobile";

////修改邮箱
//static NSString *kChangeEmailPath = @"inter/mobile/saveEmail";

//修改邮箱
static NSString *kChangeEmailPath = @"mobile/inter/saveEmail";

//修改手机验证码
static NSString *kChangePhoneCodePath = @"code/checkOldMobileCode";
//验证邮箱验证码
static NSString *kChangeEmailCodePPath = @"mobile/checkEmailCode";
//绑定手机验证码
static NSString *kAddPhoneCodePath = @"code/sendMobile";

static NSString *kCheckEmailAndPhone = @"user/checkPhone";
//检查邮箱是否绑定
static NSString *kCheckEmailIsUsed = @"user/verifyEmail";
//检查电话是否绑定
static NSString *kCheckPhoneIsUsed = @"user/verifyPhone";
////发送邮箱验证码
//static NSString *kChangeEmailCodePath = @"inter/mobile/sendMail";

//发送邮箱验证码
static NSString *kChangeEmailCodePath = @"mobile/sendMail";

//收货地址列表
//static NSString *kAddressList= @"inter/userAddress/list/";

//修改收件地址
static NSString *kEditAddressDetial= @"inter/userAddress/updateAdress";

//添加新收货地址
static NSString *kNewAddress= @"inter/userAddress/saveAdress";

//更改默认地址
static NSString *kDefaultAddress= @"inter/userAddress/setDefaultAddr";

//获取国家列表
static NSString *kCountryListPath = @"countryinfo/list";
//获取省列表
static NSString *kProvincelistPath = @"countryinfo/provincesByCountryId/";


//获取城市列表
static NSString *kCityListPath = @"countryinfo/citysByProvinceId/";
//获取城市列表
static NSString *kAreaListPath = @"countryinfo/areasByCityId/";

static NSString *kTopAccountInfo = @"userFound/inter/account";

//用户预扣手续费和保证金
//static NSString *kPoundageAndBond = @"userFound/inter/fundbond";

//资金账户信息
static NSString *kAccountInfo = @"userFound/inter/home";

//预扣保证金信息
static NSString *kWithholdAccountInfo = @"userFound/inter/fundbond";

//预扣手续费
static NSString *kHoldAccountInfo = @"userFound/inter/fee";

//校验资金密码是否设置
static NSString *kCheckCapitalPasswod = @"inter/userBankCard/vaildatePass";

//校验资金密码是否正确
static NSString *kCheckCapitalPasswodRight = @"inter/userBankCard/checkPass";

//用户资金密码初始化管理接口
static NSString *kInitFundPwd =@"userFound/inter/initfundPwd";

//修改资金密码接口
static NSString *kChangeFundPwd =@"userFound/inter/updfundPwd";


//获取入金列表
static NSString *kInFundListPath = @"userApplyIncash/inter/list";

//获取出金列表
static NSString *kOutFundListPath = @"userApplyOutcash/inter/list";

//用户保存入金接口
static NSString *kSaveFund =@"userApplyIncash/inter/save";

//用户保存出金接口
static NSString *kSaveOutFund =@"userApplyOutcash/inter/save";

//获取银行列表
static NSString *kBankListPath = @"userBank/findBanks";

//上传新银行卡
static NSString *kSaveBankCardPath = @"inter/userBankCard/saveBankCard";

//static NSString *kDeleteBankCadrPath = @"inter/userBankCard/saveBankCard";

/** 获取用户银行卡列表 */
static NSString *kBankCardList = @"inter/userBankCard/getBankCardsByPage";

//我的仓单
static NSString *kMyRepoList = @"warehouselist/inter/toWarehouseWarrant";

/** 获取国家列表 */
static NSString *kCountryList = @"countryinfo/list";

/** 保存入金 */
static NSString *kUploadImagePath = @"userApplyIncash/inter/save";

/** 查询自己店铺信息 */
static NSString *kSearchShopPath = @"shop/inter/shop";

/** 查询自己店铺商品 */
static NSString *kSearchSelfShopPath = @"shop/inter/list";

//查询店铺认证状态
static NSString *kShopApplyInfoPath = @"userShopApplyInfo/inter/shopStatus";

//查询开店实名认证
static NSString *kUserShopApplyInfoPath = @"userShopApplyInfo/inter/storeapply";

//上传店铺信息
static NSString *kOpenShopInfoPath = @"userShopApplyInfo/inter/save";

//上传企业店铺信息
static NSString *kOpenCompanyShopInfoPath = @"userShopCompany/inter/save";

/** 买家创建订单 */
static NSString *kCreatOrderPath = @"inter/orderMain/creatOrder";

/** 买家评价商品 */
static NSString *kEvaluateListPath = @"orderBuy/inter/doEvaluate";

/** 买家确认收货（单） */
static NSString *kConfirmReceiptGoodsPath = @"orderBuy/inter/doConfirmReceiptGoods";

/** 买家确认收票 */
static NSString *kConfirmReceiptInvoicePath = @"orderBuy/inter/doConfirmReceiptInvoice";

/** 申请背书 */
static NSString *kApplyEndorsePath = @"orderBuy/inter/doApplyEndorse";

/** 申请提货单 */
static NSString *kApplyDeliveryBillsPath = @"orderBuy/inter/doApplyDeliveryBills";

/** 提醒卖家确认订单 */
static NSString *kSalerConfrimOrderListPath = @"inter/message/inter/save";

/** 已买到的商品 */
static NSString *kAlreadyBuyListPath = @"orderBuy/inter/list/";
/** 已卖出的商品 */
static NSString *kAlreadySaledListPath = @"orderSale/inter/list";
/** 已买到的商品 待卖方确认 */
static NSString *kAlreadyBuyWaitConfirmListPath = @"orderBuy/inter/list/WaitConfirm";

/** 已买到的商品 待付保证金*/
static NSString *kAlreadyBuyWaitPayTradeBailListPath = @"orderBuy/inter/list/WaitPayTradeBail";

/** 已买到的商品 待交割*/
static NSString *kAlreadyBuyWaitDeliveryListPath = @"orderBuy/inter/list/WaitDelivery";

/** 已买到的商品 已交割*/
static NSString *kAlreadyBuyAlreadyDeliveryListPath = @"orderBuy/inter/list/AlreadyDelivery";

/** 已买到的商品 待确认货款*/
static NSString *kAlreadyBuyWaitConfirmPaymentListPath = @"orderBuy/inter/list/WaitConfirmPayment";

/** 已买到的商品 待确认发票*/
static NSString *kAlreadyBuyWaitConfirmInvoiceListPath = @"orderBuy/inter/list/WaitConfirmInvoice";

/** 已买到的商品 待确认尾款*/
static NSString *kAlreadyBuyWaitConfirmLastPaymentListPath = @"orderBuy/inter/list/WaitConfirmLastPayment";

/** 已买到的商品 评价*/
static NSString *kAlreadyBuyWaitAssessListPath = @"orderBuy/inter/list/WaitAssess";

/** 已买到的商品 取消*/
//static NSString *kAlreadyBuyCancelListPath = @"orderBuy/inter/list/Cancel";

/** 已买到的商品 违约*/
static NSString *kAlreadyBuyBreachListPath = @"orderBuy/inter/list/status";

/** 已买到的商品 用户取消订单 */
static NSString *kAlreadyBuyCancelOrderListPath = @"orderBuy/inter/doCancel";
static NSString *kAlreadyBuyCancelOrder  = @"orderBuy/inter/doCancel";
/** 支付保证金 */
static NSString *kOrderBondListPath = @"orderBuy/inter/doOrderBond";

/** 支付货款 */
static NSString *kOrderPayListPath = @"orderBuy/inter/doOrderPay";

/** 搜索商品列表 */
static NSString *kSearchGoodsListPath = @"search/getGoodsList";
/** 查看商品详情 */
static NSString *kGoodsDetailPath = @"search/goodsDetails/";
/** 商品交易参数 */
static NSString *kGoodsDeliveryMethod = @"search/goodsParam/";
/** 商品评价 */
static NSString *kGoodsComments = @"search/goodsComment";
/** 木材分类 */
static NSString *kWoodSort = @"search/getGoodsWoodDictionaryData";
/** 木材属性 */
static NSString *kWoodsProperty = @"search/getDictionaryData/";

/**热搜**/
static NSString *kHotSearch = @"search/topSearch";
/**币种**/
static NSString *kGetCurrencyList = @"inter/goods/getCurrencyList";

/**现货发布**/
static NSString *kWoodSumbit = @"inter/goods/newSubmit";
/**发布保存**/
static NSString *kWoodSave = @"inter/goods/newSave";
/**确认发布**/
static NSString *kEnsureWoodSumbit = @"inter/goods/submit/";
/**规格历史**/
static NSString *kWoodGoodsSpeciesHis = @"inter/woodGoodsSpeciesHis/list/";
/**产地**/
static NSString *kCountry = @"search/getCountry";
/**交割地**/
static NSString *kDeliveryPlace = @"search/getDelivery";
/**获取首页数据**/
static NSString *kHomePageData = @"index/getPicture";
/**获取首页猜你喜欢数据**/
static NSString *kGuessYouLove = @"index/like";
/**获取我的仓单**/
static NSString *kWarehouseList = @"inter/warehouse/inter/getWarehouse";
/**获取仓单分割**/
static NSString *kCDSplit = @"userLading/inter/division";
/**获取仓单合并**/
static NSString *kWarehouseCombine = @"userLading/inter/financeMerge";
/**获取出库申请列表**/
static NSString *kOutInputApply = @"userLading/inter/receipt";

/**申请出库**/
static NSString *kApplyGetOut = @"userLading/inter/save";
/**取消提货单**/
static NSString *kCancelApplyGetOut = @"userLading/inter/cancel";

/**获取提货单列表**/
static NSString *kDeliveryOrder = @"userLading/inter/billoflading";
/**获取我的发布列表**/
static NSString *kMySendsList = @"inter/goods/list/";
/*删除木材历史规格的接口*/
static NSString *kWoodGoodsSpeciesHisDelelte =@"inter/woodGoodsSpeciesHis/delete/";
/*资讯中心接口*/
static NSString *kNewsList =@"news/list";
/*相关推荐接口*/
static NSString *kRelevantNewsList =@"news/recommended";
/*消息列表的接口*/
static NSString *kMessagesList = @"inter/message/findMessageByPage/";

/*订单确认页面*/
static NSString *kEnsureOrder = @"inter/orderMain/inter/toConfirm";
/*创建订单的接口*/
static NSString *kEnsureBuyerOrder = @"inter/orderMain/creatOrder";

/*我的仓单中查看仓单接口*/
static NSString *kMyCangDan = @"inter/warehouse/inter/toWarehouseWarrant/";
/*查看提货单的接口*/
static NSString *kLookUpOrder = @"userLading/inter/billofladingPrint/";
/*根据店铺id查询店铺信息和店铺商品信息*/
static NSString *kLookUpShopDetail = @"shop/shopmMessage";
/*账户信息*/
static NSString *kShowAccountInfo = @"userFound/inter/account";
//查看合同

static NSString *kSeeAgreement = @"inter/orderMain/inter/toContract/";

//订单详情
static NSString *kOrderDetail = @"inter/orderMain/inter/toDetail/";
//获取保证金详情
static NSString *kMarginDetail = @"orderBuy/inter/toOrderBond/";
//支付保证金
static NSString *kPayMarginDetail = @"orderBuy/inter/doOrderBond";
//查看订单取消原因接口
static NSString *kCancelOrderReason = @"inter/orderMain/inter/viewCancel/";

//查看评价
static NSString *kDetailComment = @"inter/orderMain/inter/viewEvaluate/";

//查看发票信息
static NSString *kBillInfo = @"inter/orderMain/inter/toInvoice/";
//开发票信息
static NSString *kOpenBill = @"orderSale/inter/doConfirmOpenInvoice";

//仓单信息
static NSString *kWarehouseInfo = @"orderSale/inter/toWarehouseWarrantDetail/";
//提货单
static NSString *kBillOfLadingInfo = @"inter/orderMain/inter/toSendGoods/";


//卖家确认发货获取物流信息
static NSString *kSalerEnsureSendOut = @"orderSale/inter/toSendGoods/";

//卖家确认发货
static NSString *kSalerEnsureDoSendOut = @"orderSale/inter/doSendGoods";

//修改保存订单
static NSString *kChangeOrdered = @"orderSale/inter/doSaleConfirm";
//确认提交仓单的接口
static NSString *kSummitWarehouseOrdered = @"orderSale/inter/doOrderWarehouseWarrant";
//提交仓单列表的接口
static NSString *kSummitWarehouseOrderedList = @"orderSale/inter/toWarehouseWarrantList/";

//提交仓单列表的接口
static NSString *kEnsureLastMoney = @"orderSale/inter/doConfirmLastPayment";


//提交仓单列表的接口
static NSString *kEnsureRMoney = @"orderSale/inter/doConfirmPayment";
//商品按条件筛选

static NSString *kFilterProducter = @"search/filterProducter";


//查看用户基本信息
static NSString *kUserBaseInfo = @"inter/mobile/inter/list";
static NSString *kUserBaseInfo1 = @"inter/mobile/inter/status";
//企业实名制认证

static NSString *kVCompany = @"inter/mobile/inter/authCompany";

//保存头像和昵称
static NSString *kSavePhoto = @"inter/mobile/inter/saveHeadImg";
//保存地址
static NSString *kSaveAddress = @"inter/mobile/inter/saveTuUserInfo";

//企业保存地址

static NSString *kSaveAddressCompany = @"inter/mobile/inter/saveTuCompanyInfo";
//上传图片接口
static NSString *kUploadImgPath = @"inter/goods/upload";
//删除图片
static NSString *deleteImggPath = @"inter/goods/deleteUpload/";

//身份校验 个人
static NSString *kVerifyPersonPath = @"inter/mobile/vailateIdentithyPerson";
//身份校验 企业
static NSString *kVerifyCompanyPath = @"inter/mobile/vailateIdentithyCompany";




//手机号找回//邮箱找回
static NSString *kFindPassworadPhonePath = @"user/resetPass";

//手机号找回//邮箱找回
static NSString *kUserNameEistPhonePath = @"user/checkName";

//修改联系人/固定电话
static NSString *kChangeLinkManAndPhonePath = @"inter/mobile/inter/saveTuCompanyInfo";


//仓单合并页面接口
static NSString *kSaveMergeListPath = @"userLading/inter/mergeForm/";

//保存仓单合并
static NSString *kSaveMergePath = @"userLading/inter/saveMerge";

//仓单分割，创建子仓单
static NSString *kMakeChildWarePath = @"userLading/inter/childWare";
//保存子仓单
static NSString *kSaveMakeChildWarePath = @"userLading/inter/saveDivision";
//商品下架
static NSString *kGoodsSoldOutPath = @"inter/goods/withdraw/";



//查询 实名认证 个人
static NSString *kPersonReason = @"inter/mobile/inter/searchUserAuth";

//查询 实名认证 企业
static NSString *kCompanyReason = @"inter/mobile/inter/searchCompanyAuth";


//商品提交
static NSString *kGoodsSubmitPath = @"inter/goods/getGoodsMonty/";

@implementation FBLAPIManager

+ (instancetype)shareManager{
    static FBLAPIManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FBLAPIManager alloc]init];
    });
    return manager;
}

//- (id)requestSearchShopWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
//    
//    return [[FBLSessionManager shareManager] requestDataWithPath:kUserInfoPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
//        if (data) {
//            block(data, error);
//        }else {
//            block(nil, error);
//        }
//    }];
//}


/**
 上传图片

 @param paramsJson 参数json
 @param block 回调数据
 */
- (id)requestUploadImageWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:@"userApplyIncash/inter/save" paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestLoginWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {

    return [[FBLSessionManager shareManager] requestDataWithPath:kLoginPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestUserStatusWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kUserStatusPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestAuthPersonWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAuthPersonPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


- (id)requestSecurityCenterWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSecurityCenterPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


- (id)requestNewPassword:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kRevisePassWordPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestChangePhoneNumberWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangePhonePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestChangeEmailWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangeEmailPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 修改手机验证码
- (id)requestChangePhoneCodePathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangePhoneCodePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


#pragma mark 验证邮箱验证码
- (id)requestChangeEmailCodePathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangeEmailCodePPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 绑定手机验证码
- (id)requestAddPhoneCodeWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAddPhoneCodePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 邮箱验证码
- (id)requestChangeEmailCodeWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangeEmailCodePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

////修改手机验证码
//static NSString *kChangePhoneCodePath = @"code/checkOldMobileCode";
//
////绑定手机验证码
//static NSString *kAddPhoneCodePath = @"code/sendMobile";
//
////发送邮箱验证码
//static NSString *kChangeEmailCodePath = @"inter/mobile/sendMail";


- (id)requestAddressListWithParamsJson:(NSString *)paramsJson PageNumber:(NSInteger)pageNumber PageSize:(NSInteger)pageSize andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[NSString stringWithFormat:@"inter/userAddress/list/%ld/%ld",(long)pageNumber,(long)pageSize] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

//kEditAddressDetial
- (id)requestEeitAddressWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kEditAddressDetial paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}

- (id)requestNewAddressWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kNewAddress paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}


- (id)requestDeleteAdressWithParamsJson:(NSString *)paramsJson addressID:(NSString *)addressID andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[NSString stringWithFormat:@"inter/userAddress/deleteAdress/%@",addressID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodDelete WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

- (id)requestSetDetaultAddressWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kDefaultAddress paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 请求国家列表
- (id)requestCountryListWithParams:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kCountryListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 请求省份列表
- (id)requestProvinceListWithParams:(NSString *)paramsJson countryID:(NSString *)countryID andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kProvincelistPath stringByAppendingString:countryID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 请求城市列表
- (id)requestCityListWithParams:(NSString *)paramsJson provienceID:(NSString *)provienceID andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kCityListPath stringByAppendingString:provienceID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 请求县区列表
- (id)requestloadCityCountryListWithParams:(NSString *)paramsJson cityID:(NSString *)cityID andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kAreaListPath stringByAppendingString: cityID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}



- (id)requestInitFundPwdWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kInitFundPwd paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestChangeFundPwdWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangeFundPwd paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


- (id)requestkInFundListPathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kInFundListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestkOutFundListPathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kOutFundListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestSaveFundWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSaveFund paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestSaveOutFundPasswodWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSaveOutFund paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

//userFound/inter/account
- (id)requestAcconutTopInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kTopAccountInfo paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestAcconutInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAccountInfo paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestkPoundageAndBondWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kWithholdAccountInfo paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestkHoldWithParamsJson:(NSString *)paramsJsom andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kHoldAccountInfo paramsJson:paramsJsom method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestCheckCapitalPasswodWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kCheckCapitalPasswod paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestCheckCapitalPasswodRightWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kCheckCapitalPasswodRight paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestBankListWithBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kBankListPath paramsJson:nil method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestSaveBankCardWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSaveBankCardPath paramsJson:paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestDeleteBankCardWithParamsJson:(NSString *)paramsJson bankCarId:(NSString *)bankCardId andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:[NSString stringWithFormat:@"inter/userBankCard/deleteBankCard/%@",bankCardId] paramsJson:paramsJson method:FBLRequestMethodDelete WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestBankLsitWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kBankListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestBankCardLsitWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kBankCardList paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestMyRepoListParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kMyRepoList paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 查询店铺认证状态
- (id)requestShopApplyInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kShopApplyInfoPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 查询开店实名认证
-(id)requestUserShopApplyInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kUserShopApplyInfoPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


- (id)requestUpOpenShopInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kOpenShopInfoPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
- (id)requestUpOpenCompanyShopInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kOpenCompanyShopInfoPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark （买家）查看发货单接口
- (id)requestOrderToInvoiceWithParamsJson:(NSString *)paramsJson OrderID:(NSString *)orderID andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:[NSString stringWithFormat:@"inter/orderMain/inter/toInvoice/%@",orderID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）创建订单的接口
- (id)requestCreatOrderWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kCreatOrderPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）评价商品接口
- (id)requestEvaluateWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kEvaluateListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）买家确认收货（单）接口
- (id)requestConfirmReceiptGoodsWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kConfirmReceiptGoodsPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）买家确认收票接口
- (id)requestConfirmReceiptInvoiceWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kConfirmReceiptInvoicePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）申请背书接口
- (id)requestApplyEndorseWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kApplyEndorsePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）申请提货单接口
- (id)requestApplyDeliveryBillsWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kApplyDeliveryBillsPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）提醒卖家确认订单接口
- (id)requestSalerConfrimOrderWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSalerConfrimOrderListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品
- (id)requestAlreadyBuyWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （卖家）查询已卖商品
- (id)requestAlreadySaledWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadySaledListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 待卖方确认
- (id)requestAlreadyBuyWaitConfirmWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyWaitConfirmListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 待付保证金
- (id)requestAlreadyBuyWaitPayTradeBailWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyWaitPayTradeBailListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 待交割
- (id)requestAlreadyBuyWaitDeliveryWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyWaitDeliveryListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 已交割
- (id)requestAlreadyBuyAlreadyDeliveryWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyAlreadyDeliveryListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 待确认货款
- (id)requestAlreadyBuyWaitConfirmPaymentWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyWaitConfirmPaymentListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 待确认发票
- (id)requestAlreadyBuyWaitConfirmInvoiceWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyWaitConfirmInvoiceListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 待确认尾款
- (id)requestAlreadyBuyWaitConfirmLastPaymentWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyWaitConfirmLastPaymentListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 评价
- (id)requestAlreadyBuyWaitAssessWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyWaitAssessListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 取消
- (id)requestAlreadyBuyCancelWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyCancelOrder paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）查询已买到商品 违约
- (id)requestAlreadyBuyBreachWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyBreachListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}



#pragma mark （买家）用户取消订单接口
- (id)requestCancelOrderWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kAlreadyBuyCancelOrderListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）支付保证金接口
- (id)requestOrderBondWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kOrderBondListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark （买家）支付货款接口
- (id)requestOrderPayWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kOrderPayListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


#pragma mark 搜索商品列表
- (id)requestSearchGoodsParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSearchGoodsListPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark 商品详情
- (id)requestGoodsDetailParamsJson:(NSString *)paramsJson goodsID:(NSString *)goodsID andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:[kGoodsDetailPath stringByAppendingString:goodsID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


#pragma mark 交易参数-交割方式
- (id)requestGoodsDetailParamsJson:(NSString *)paramsJson deliveryMethod:(NSString *)deliveryMethod andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:[kGoodsDeliveryMethod stringByAppendingString:deliveryMethod] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark 商品评价
- (id)requestGoodsCommentParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kGoodsComments paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark 木材分来
- (id)requestWoodSortParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kWoodSort paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}
#pragma mark 树种-长度-宽度-厚度
- (id)requestWoodsPropertyParamsJson:(NSString *)paramsJson
                            parentId:(NSString *)parentId
                            woodType:(NSString *)woodType
                            andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kWoodsProperty stringByAppendingString:[NSString stringWithFormat:@"%@/%@",parentId,woodType]]paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark --热搜
- (id)requestHotSearchParamsJson:(NSString *)paramsJson
                        andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kHotSearch paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark --币种字典项
- (id)requestCurrencyParamsJson:(NSString *)paramsJson
                        andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kGetCurrencyList paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark --单位字典项
- (id)requestUnitParamsJson:(NSString *)paramsJson
                       andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kGetCurrencyList paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark --产地字典项
- (id)requestProducePlaceParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kCountry paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark --交割地字典项
- (id)requestDeliveryPlaceParamsJson:(NSString *)paramsJson
                            andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kDeliveryPlace paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark --现货发布
- (id)requestsubmitWoodParamsJson:(NSString *)paramsJson
                         andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kWoodSumbit paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark --发布保存
- (id)requestSaveWoodParamsJson:(NSString *)paramsJson
                         andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kWoodSave paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}


#pragma mark --现货确认发布
- (id)ensureSubmitWoodParamsJson:(NSString *)paramsJson
                              ID:(NSString *)ID
                         andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kEnsureWoodSumbit paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark --木材规格（历史规格列表）的接口
- (id)getWoodGoodsSpeciesHisParamsJson:(NSString *)paramsJson
                               pageNum:(NSInteger)pageNum
                              pageSize:(NSInteger)pageSize
                        andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kWoodGoodsSpeciesHis stringByAppendingString:[NSString stringWithFormat:@"%ld/%ld",pageNum,(long)pageSize]] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark --删除木材历史规格的接口
- (id)deleteWoodGoodsSpeciesHisParamsJson:(NSString *)paramsJson
                                       ID:(NSString *)ID
                              andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kWoodGoodsSpeciesHisDelelte stringByAppendingString:[NSString stringWithFormat:@"%@",ID]] paramsJson:(NSString *)paramsJson method:FBLRequestMethodDelete WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark --订单确认页面

- (id)requestEnsureGoodOrderParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kEnsureOrder paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark --创建订单的接口
- (id)requestEnsureBuyerOrderParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    
    return  [[FBLSessionManager shareManager] requestDataWithPath:kEnsureBuyerOrder paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark --资讯中心
- (id)getnewsGoodsSpeciesHisParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kNewsList paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark --相关推荐
- (id)getRelevantRecommendationParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kRelevantNewsList paramsJson:paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark --消息列表的接口
- (id)getnMessageListParamsJson:(NSString *)paramsJson
                        pageNum:(NSInteger)pageNum
                       pageSize:(NSInteger)pageSize
                       andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kMessagesList stringByAppendingString:[NSString stringWithFormat:@"%ld/%ld", pageNum, pageSize]] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

- (id)requestCountryListWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block {
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kCountryList paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark --获取首页数据
- (id)getHomePageDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kHomePageData paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}

#pragma mark --获取首页猜你喜欢数据
- (id)getGuessYouLoveDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kGuessYouLove paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark --获取我的仓单列表/根据条件分页查询仓单的接口
- (id)getMyWarehouseListDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kWarehouseList paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}

#pragma mark --获取仓单分割列表
- (id)getWarehouseSplitDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kCDSplit paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark --获取仓单合并列表
- (id)getWarehouseCombineDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kWarehouseCombine paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark --获取出库申请列表
- (id)getOutinputApplyDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kOutInputApply paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark --取消提货单
- (id)cancelApplyOrderParamsJson:(NSString *)paramsJson ID:(NSString *)ID andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kCancelApplyGetOut paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}
#pragma mark --申请提货单接口
- (id)applyOrderParamsJson:(NSString *)paramsJson ID:(NSString *)ID andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kApplyGetOut paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}



#pragma mark --获取提货单查询
- (id)getDeliveryOrderDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kDeliveryOrder paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark --我的发布列表
- (id)getMySendsDataWithParamsJson:(NSString *)paramsJson
                           pageNum:(NSInteger)pageNum
                          pageSize:(NSInteger)pageSize
                         tradeType:(NSInteger)tradeType
                          andBlock:(ResultCompleteBlock)block
{

    return [[FBLSessionManager shareManager] requestDataWithPath:[kMySendsList stringByAppendingString:[NSString stringWithFormat:@"%ld/%ld/%ld",pageNum,pageSize,tradeType]] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark --我的仓单中查看仓单接口
- (id)requestLookUpMyCangDanDetailWithParamsJson:(NSString *)paramsJson
                                              ID:(NSString *)ID
                                        andBlock:(ResultCompleteBlock)block
{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:[kMyCangDan stringByAppendingString:[NSString stringWithFormat:@"%@",ID]] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark --查看提货单的接口
- (id)requestLookUpDeliveryOrderDetailWithParamsJson:(NSString *)paramsJson
                                              ID:(NSString *)ID
                                        andBlock:(ResultCompleteBlock)block
{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:[kLookUpOrder stringByAppendingString:[NSString stringWithFormat:@"%@",ID]] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}


#pragma mark --根据店铺id查询店铺信息和店铺商品信息
- (id)requesLookupShopDetailWithParamsJson:(NSString *)paramsJson
                                                  ID:(NSString *)ID
                                            andBlock:(ResultCompleteBlock)block
{
     
    return [[FBLSessionManager shareManager] requestDataWithPath:kLookUpShopDetail paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark --账户信息
- (id)requesAccountInfoWithParamsJson:(NSString *)paramsJson
                             andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kShowAccountInfo paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}
#pragma mark --查看合同接口
- (id)requesAgreementInfoWithParamsJson:(NSString *)paramsJson
                                     ID:(NSString *)ID
                             andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kSeeAgreement stringByAppendingString:ID]paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark --注册
- (id)requesRegisterWithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kRegisterPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -订单详情
- (id)requestOrderDetailWithParamsJson:(NSString *)paramsJson
                                    ID:(NSString *)ID
                          andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kOrderDetail stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -获取保证金金额
- (id)requestMarginDetailWithParamsJson:(NSString *)paramsJson
                                    ID:(NSString *)ID
                              andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kMarginDetail stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark -支付保证金
- (id)requestPayMarginWithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kPayMarginDetail paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark -查看订单取消原因接口
- (id)requestCancelOrderReasonWithParamsJson:(NSString *)paramsJson
                                          ID:(NSString *)ID
                            andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kCancelOrderReason stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -查看评价接口
- (id)requestLookCommentReasonWithParamsJson:(NSString *)paramsJson
                                          ID:(NSString *)ID
                                    andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kDetailComment stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark -查看发票信息
- (id)requestLookBillInfoWithParamsJson:(NSString *)paramsJson
                                          ID:(NSString *)ID
                                    andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kBillInfo stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -开发票
- (id)requestOpenBillInfoWithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kOpenBill paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -仓单信息
- (id)requestWarehouseInfoWithParamsJson:(NSString *)paramsJson
                                     ID:(NSString *)ID
                               andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kWarehouseInfo stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -提货单
- (id)requestBillOfLadingInfoWithParamsJson:(NSString *)paramsJson
                                      ID:(NSString *)ID
                                andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kBillOfLadingInfo stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -卖家确认发货、自提、物流/

- (id)requestSalerEnsureSendoutGoodsWithParamsJson:(NSString *)paramsJson
                                         ID:(NSString *)ID
                                   andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kSalerEnsureSendOut stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -卖家确认发货

- (id)requestSalerDoEnsureSendoutGoodsWithParamsJson:(NSString *)paramsJson
                                                ID:(NSString *)ID
                                          andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kSalerEnsureDoSendOut paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -修改订单
- (id)requestChangeOrderWithParamsJson:(NSString *)paramsJson
                            andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangeOrdered paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -确认提交仓单的接口
- (id)requestSumitWarehouseOrderWithParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kSummitWarehouseOrdered paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark -提交仓单列表的接口
- (id)requestSumitWarehouseOrderListWithParamsJson:(NSString *)paramsJson
                                                ID:(NSString *)ID
                                      andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kSummitWarehouseOrderedList stringByAppendingString:ID] paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -确认收（尾）款的接口
- (id)requestEnsureLastMoneyWithParamsJson:(NSString *)paramsJson
                                      andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kEnsureLastMoney paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -确认收款的接口
- (id)requestEnsureRMoneyWithParamsJson:(NSString *)paramsJson
                                  andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kEnsureRMoney paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark -商品按条件筛选
- (id)requestFilterProducterWithParamsJson:(NSString *)paramsJson
                                  andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kFilterProducter paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -查看用户基本信息
- (id)requestLookBaseInfoWithParamsJson:(NSString *)paramsJson
                                  andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kUserBaseInfo paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -查看用户基本信息1
- (id)requestLookBaseInfo1WithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kUserBaseInfo1 paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -企业实名制认证
- (id)requestVCompanyWithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kVCompany paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -保存头像和昵称
- (id)requestSavePersonPhotoWithParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kSavePhoto paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -个人基本信息保存
- (id)requestSaveAddressWithParamsJson:(NSString *)paramsJson
                                  andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kSaveAddress paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark -企业基本信息保存
- (id)requestSaveAddressCompanyWithParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kSaveAddressCompany paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark- 上传图片的接口
- (id)requestUploadImageParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kUploadImgPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark- 删除图片的接口
- (id)requestDeleteImageParamsJson:(NSString *)paramsJson ID:(NSString *)ID
                          andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:[deleteImggPath stringByAppendingString:ID]paramsJson:(NSString *)paramsJson method:FBLRequestMethodDelete WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark-  身份校验 个人
- (id)requestVerifyPersonParamsJson:(NSString *)paramsJson
                          andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kVerifyPersonPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark-  身份校验 公司
- (id)requestVerifyCompanyParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kVerifyCompanyPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}


#pragma mark-  * 查询用户店铺信息
- (id)requestSelfShopInfoParamsJson:(NSString *)paramsJson
                            andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kSearchShopPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark-  * 查询店铺商品列表
- (id)requestSelfShopGoodsInfoParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kSearchSelfShopPath paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark-  * 手机号找回 #pragma mark-  * 邮箱找回
- (id)requestFindUsePhoneParamsJson:(NSString *)paramsJson
                                andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kFindPassworadPhonePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark-  * 用户名是否存在
- (id)requestUserNameeEixstParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kUserNameEistPhonePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}

#pragma mark-  *更改
- (id)requestChangeNameAndphoneParamsJson:(NSString *)paramsJson
                             andBlock:(ResultCompleteBlock)block
{
    return [[FBLSessionManager shareManager] requestDataWithPath:kChangeLinkManAndPhonePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
#pragma mark 保存仓单合并
- (id)requestSaveMergeWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSaveMergePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark 仓单合并页面接口
- (id)requestSaveMergeListWithParamsJson:(NSString *)paramsJson
                                      ID:(NSString *)ID
                                andBlock:(ResultCompleteBlock)block
{

    
    return [[FBLSessionManager shareManager] requestDataWithPath:[kSaveMergeListPath stringByAppendingString:ID]paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}

#pragma mark 仓单分割，创建子仓单
- (id)requestMakeChildWareWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kMakeChildWarePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark 保存子仓单
- (id)requestSaveMakeChildWareWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kSaveMakeChildWarePath paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}
#pragma mark 商品下架
- (id)requestSoldOutWithParamsJson:(NSString *)paramsJson
                                ID:(NSString *)ID
                          andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kGoodsSoldOutPath stringByAppendingString:ID]paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];

}


#pragma mark 个人失败原因
- (id)requestPersonDefailedReasonWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kPersonReason paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark 企业失败原因
- (id)requestCompanyDefailedReasonWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block{
    
    return [[FBLSessionManager shareManager] requestDataWithPath:kCompanyReason paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
}

#pragma mark -提交商品

- (id)requestSubmitGoodsWithParamsJson:(NSString *)paramsJson
                                ID:(NSString *)ID
                          andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:[kGoodsSubmitPath stringByAppendingString:ID]paramsJson:(NSString *)paramsJson method:FBLRequestMethodGet WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
//检查邮箱或者电话是否存在
- (id)requestCheckPhoneAndEmailWithParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kCheckEmailAndPhone paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}


//检查邮箱或者电话是否存在
- (id)requestCheckPhoneIsUsedWithParamsJson:(NSString *)paramsJson
                                     andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kCheckPhoneIsUsed paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
- (id)requestCheckEmailIsUsedWithParamsJson:(NSString *)paramsJson
                                   andBlock:(ResultCompleteBlock)block{
    return [[FBLSessionManager shareManager] requestDataWithPath:kCheckEmailIsUsed paramsJson:(NSString *)paramsJson method:FBLRequestMethodPost WithCompleteBlock:^(NSMutableDictionary *data, NSError *error) {
        if (data) {
            block(data, error);
        }else {
            block(nil, error);
        }
    }];
    
}
@end
