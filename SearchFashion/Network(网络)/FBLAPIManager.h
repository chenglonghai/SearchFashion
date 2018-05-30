//
//  FBLAPIManager.h
//  FBLWoodmall
//
//  Created by 123 on 2017/3/13.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FBLSessionManager.h"

@interface FBLAPIManager : NSObject

+ (instancetype)shareManager;

/** 查询店铺 */
//- (id)requestSearchShopWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestLoginWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestUserStatusWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestAuthPersonWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestSecurityCenterWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestNewPassword:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestChangePhoneNumberWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestChangeEmailWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 修改手机验证码
- (id)requestChangePhoneCodePathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)bloc;
#pragma mark 验证邮箱验证码
- (id)requestChangeEmailCodePathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark 绑定手机验证码
- (id)requestAddPhoneCodeWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 邮箱验证码
- (id)requestChangeEmailCodeWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestAddressListWithParamsJson:(NSString *)paramsJson PageNumber:(NSInteger)pageNumber PageSize:(NSInteger)pageSize andBlock:(ResultCompleteBlock)block;

- (id)requestEeitAddressWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestNewAddressWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestDeleteAdressWithParamsJson:(NSString *)paramsJson addressID:(NSString *)addressID andBlock:(ResultCompleteBlock)block;

- (id)requestSetDetaultAddressWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

//- (id)requestProvinceListWithParams:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

//- (id)requestCityListWithParams:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestAcconutTopInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestAcconutInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestkPoundageAndBondWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestkHoldWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestCheckCapitalPasswodWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestCheckCapitalPasswodRightWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestInitFundPwdWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestChangeFundPwdWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestkInFundListPathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestkOutFundListPathWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestSaveFundWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestSaveOutFundPasswodWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

//- (id)requestBankCardListWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestBankListWithBlock:(ResultCompleteBlock)block;

- (id)requestSaveBankCardWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestDeleteBankCardWithParamsJson:(NSString *)paramsJson bankCarId:(NSString *)bankCardId andBlock:(ResultCompleteBlock)block;

#pragma mark 获取银行列表
- (id)requestBankLsitWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 获取用户银行卡列表
- (id)requestBankCardLsitWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestCountryListWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 请求国家列表
- (id)requestCountryListWithParams:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 请求省份列表
- (id)requestProvinceListWithParams:(NSString *)paramsJson countryID:(NSString *)countryID andBlock:(ResultCompleteBlock)block
;
#pragma mark 请求城市列表
- (id)requestCityListWithParams:(NSString *)paramsJson provienceID:(NSString *)provienceID andBlock:(ResultCompleteBlock)block;

#pragma mark 请求县区列表
- (id)requestloadCityCountryListWithParams:(NSString *)paramsJson cityID:(NSString *)cityID andBlock:(ResultCompleteBlock)block;

- (id)requestMyRepoListParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 查询店铺认证状态
-(id)requestShopApplyInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 查询开店实名认证
-(id)requestUserShopApplyInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

- (id)requestUpOpenShopInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
- (id)requestUpOpenCompanyShopInfoWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark （买家）查看发货单接口
- (id)requestOrderToInvoiceWithParamsJson:(NSString *)paramsJson OrderID:(NSString *)orderID andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）创建订单的接口
- (id)requestCreatOrderWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）评价商品接口
- (id)requestEvaluateWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）买家确认收货（单）接口
- (id)requestConfirmReceiptGoodsWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）买家确认收票接口
- (id)requestConfirmReceiptInvoiceWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）申请背书接口
- (id)requestApplyEndorseWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）申请提货单接口
- (id)requestApplyDeliveryBillsWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）提醒卖家确认订单接口
- (id)requestSalerConfrimOrderWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品
- (id)requestAlreadyBuyWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark （卖家）查询已卖商品
- (id)requestAlreadySaledWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 待卖方确认
- (id)requestAlreadyBuyWaitConfirmWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 待付保证金
- (id)requestAlreadyBuyWaitPayTradeBailWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 待交割
- (id)requestAlreadyBuyWaitDeliveryWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 已交割
- (id)requestAlreadyBuyAlreadyDeliveryWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 待确认货款
- (id)requestAlreadyBuyWaitConfirmPaymentWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 待确认发票
- (id)requestAlreadyBuyWaitConfirmInvoiceWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 待确认尾款
- (id)requestAlreadyBuyWaitConfirmLastPaymentWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 评价
- (id)requestAlreadyBuyWaitAssessWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 取消
- (id)requestAlreadyBuyCancelWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）查询已买到商品 违约
- (id)requestAlreadyBuyBreachWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）用户取消订单接口
- (id)requestCancelOrderWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）支付保证金接口
- (id)requestOrderBondWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark （买家）支付货款接口
- (id)requestOrderPayWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 搜索商品列表
- (id)requestSearchGoodsParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark 商品详情
- (id)requestGoodsDetailParamsJson:(NSString *)paramsJson goodsID:(NSString *)goodsID andBlock:(ResultCompleteBlock)block;
#pragma mark 交易参数-交割方式
- (id)requestGoodsDetailParamsJson:(NSString *)paramsJson deliveryMethod:(NSString *)deliveryMethod andBlock:(ResultCompleteBlock)block;
#pragma mark 商品评价
- (id)requestGoodsCommentParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark 木材分来
- (id)requestWoodSortParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 树种-长度-宽度-厚度
- (id)requestWoodsPropertyParamsJson:(NSString *)paramsJson
                            parentId:(NSString *)parentId
                            woodType:(NSString *)woodType
                            andBlock:(ResultCompleteBlock)block;
#pragma mark --热搜
- (id)requestHotSearchParamsJson:(NSString *)paramsJson
                        andBlock:(ResultCompleteBlock)block;
#pragma mark --币种字典项
- (id)requestCurrencyParamsJson:(NSString *)paramsJson
                       andBlock:(ResultCompleteBlock)block;
#pragma mark --单位字典项
- (id)requestUnitParamsJson:(NSString *)paramsJson
                   andBlock:(ResultCompleteBlock)block;
#pragma mark --产地字典项
- (id)requestProducePlaceParamsJson:(NSString *)paramsJson
                   andBlock:(ResultCompleteBlock)block;
#pragma mark --交割地字典项
- (id)requestDeliveryPlaceParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block;

#pragma mark --现货发布
- (id)requestsubmitWoodParamsJson:(NSString *)paramsJson
                        andBlock:(ResultCompleteBlock)block;

#pragma mark --发布保存
- (id)requestSaveWoodParamsJson:(NSString *)paramsJson
                       andBlock:(ResultCompleteBlock)block;
#pragma mark --现货确认发布
- (id)ensureSubmitWoodParamsJson:(NSString *)paramsJson
                              ID:(NSString *)ID
                        andBlock:(ResultCompleteBlock)block;
#pragma mark --木材规格（历史规格列表）的接口
- (id)getWoodGoodsSpeciesHisParamsJson:(NSString *)paramsJson
                               pageNum:(NSInteger)pageNum
                              pageSize:(NSInteger)pageSize
                              andBlock:(ResultCompleteBlock)block;
#pragma mark --删除木材历史规格的接口
- (id)deleteWoodGoodsSpeciesHisParamsJson:(NSString *)paramsJson
                                       ID:(NSString *)ID
                                 andBlock:(ResultCompleteBlock)block;
#pragma mark --订单确认页面

- (id)requestEnsureGoodOrderParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block;
#pragma mark --创建订单的接口
- (id)requestEnsureBuyerOrderParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block;
#pragma mark --资讯中心
- (id)getnewsGoodsSpeciesHisParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block;
#pragma mark --相关推荐
- (id)getRelevantRecommendationParamsJson:(NSString *)paramsJson
                                 andBlock:(ResultCompleteBlock)block;
#pragma mark --消息列表的接口
- (id)getnMessageListParamsJson:(NSString *)paramsJson
                        pageNum:(NSInteger)pageNum
                       pageSize:(NSInteger)pageSize
                       andBlock:(ResultCompleteBlock)block;

#pragma mark --获取首页数据
- (id)getHomePageDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark --获取首页猜你喜欢数据
- (id)getGuessYouLoveDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
//- (id)requestGoodsDetialParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark --获取我的仓单列表/根据条件分页查询仓单的接口
- (id)getMyWarehouseListDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark --获取仓单分割列表
- (id)getWarehouseSplitDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark --获取仓单合并列表
- (id)getWarehouseCombineDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark --获取出库申请列表
- (id)getOutinputApplyDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark --取消提货单
- (id)cancelApplyOrderParamsJson:(NSString *)paramsJson ID:(NSString *)ID andBlock:(ResultCompleteBlock)block;
#pragma mark --申请提货单接口
- (id)applyOrderParamsJson:(NSString *)paramsJson ID:(NSString *)ID andBlock:(ResultCompleteBlock)block;

#pragma mark --获取提货单查询
- (id)getDeliveryOrderDataWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark --我的发布列表
- (id)getMySendsDataWithParamsJson:(NSString *)paramsJson
                           pageNum:(NSInteger)pageNum
                          pageSize:(NSInteger)pageSize
                         tradeType:(NSInteger)tradeType
                          andBlock:(ResultCompleteBlock)block;
- (id)requestUploadImageWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark --我的仓单中查看仓单接口
- (id)requestLookUpMyCangDanDetailWithParamsJson:(NSString *)paramsJson
                                              ID:(NSString *)ID
                                        andBlock:(ResultCompleteBlock)block;

#pragma mark --查看提货单的接口
- (id)requestLookUpDeliveryOrderDetailWithParamsJson:(NSString *)paramsJson
                                                  ID:(NSString *)ID
                                            andBlock:(ResultCompleteBlock)block;
#pragma mark --根据店铺id查询店铺信息和店铺商品信息
- (id)requesLookupShopDetailWithParamsJson:(NSString *)paramsJson
                                        ID:(NSString *)ID
                                  andBlock:(ResultCompleteBlock)block;
#pragma mark --账户信息
- (id)requesAccountInfoWithParamsJson:(NSString *)paramsJson
                             andBlock:(ResultCompleteBlock)block;
#pragma mark --查看合同接口
- (id)requesAgreementInfoWithParamsJson:(NSString *)paramsJson
                                     ID:(NSString *)ID
                               andBlock:(ResultCompleteBlock)block;
#pragma mark --注册
- (id)requesRegisterWithParamsJson:(NSString *)paramsJson
                          andBlock:(ResultCompleteBlock)block;
#pragma mark -订单详情
- (id)requestOrderDetailWithParamsJson:(NSString *)paramsJson
                                    ID:(NSString *)ID
                              andBlock:(ResultCompleteBlock)block;
#pragma mark -获取保证金金额
- (id)requestMarginDetailWithParamsJson:(NSString *)paramsJson
                                     ID:(NSString *)ID
                               andBlock:(ResultCompleteBlock)block;
#pragma mark -支付保证金
- (id)requestPayMarginWithParamsJson:(NSString *)paramsJson
                            andBlock:(ResultCompleteBlock)block;
#pragma mark -查看订单取消原因接口
- (id)requestCancelOrderReasonWithParamsJson:(NSString *)paramsJson
                                          ID:(NSString *)ID
                                    andBlock:(ResultCompleteBlock)block;
#pragma mark -查看评价接口
- (id)requestLookCommentReasonWithParamsJson:(NSString *)paramsJson
                                          ID:(NSString *)ID
                                    andBlock:(ResultCompleteBlock)block;

#pragma mark -查看发票信息
- (id)requestLookBillInfoWithParamsJson:(NSString *)paramsJson
                                     ID:(NSString *)ID
                               andBlock:(ResultCompleteBlock)block;
#pragma mark -开发票
- (id)requestOpenBillInfoWithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block;
#pragma mark -仓单信息
- (id)requestWarehouseInfoWithParamsJson:(NSString *)paramsJson
                                      ID:(NSString *)ID
                                andBlock:(ResultCompleteBlock)block;
#pragma mark -提货单
- (id)requestBillOfLadingInfoWithParamsJson:(NSString *)paramsJson
                                         ID:(NSString *)ID
                                   andBlock:(ResultCompleteBlock)block;
#pragma mark -卖家确认发货、自提、物流

- (id)requestSalerEnsureSendoutGoodsWithParamsJson:(NSString *)paramsJson
                                                ID:(NSString *)ID
                                          andBlock:(ResultCompleteBlock)block;
#pragma mark -卖家确认发货

- (id)requestSalerDoEnsureSendoutGoodsWithParamsJson:(NSString *)paramsJson
                                                  ID:(NSString *)ID
                                            andBlock:(ResultCompleteBlock)block;
#pragma mark -修改订单
- (id)requestChangeOrderWithParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block;
#pragma mark -确认提交仓单的接口
- (id)requestSumitWarehouseOrderWithParamsJson:(NSString *)paramsJson
                                      andBlock:(ResultCompleteBlock)block;
#pragma mark -提交仓单列表的接口
- (id)requestSumitWarehouseOrderListWithParamsJson:(NSString *)paramsJson
                                                ID:(NSString *)ID
                                          andBlock:(ResultCompleteBlock)block;
#pragma mark -确认收（尾）款的接口
- (id)requestEnsureLastMoneyWithParamsJson:(NSString *)paramsJson
                                  andBlock:(ResultCompleteBlock)block;
#pragma mark -确认收款的接口
- (id)requestEnsureRMoneyWithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block;
#pragma mark -商品按条件筛选
- (id)requestFilterProducterWithParamsJson:(NSString *)paramsJson
                                  andBlock:(ResultCompleteBlock)block;
#pragma mark -查看用户基本信息
- (id)requestLookBaseInfoWithParamsJson:(NSString *)paramsJson
                               andBlock:(ResultCompleteBlock)block;
#pragma mark -查看用户基本信息1
- (id)requestLookBaseInfo1WithParamsJson:(NSString *)paramsJson
                                andBlock:(ResultCompleteBlock)block;
#pragma mark -企业实名制认证
- (id)requestVCompanyWithParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block;
#pragma mark -保存头像和昵称
- (id)requestSavePersonPhotoWithParamsJson:(NSString *)paramsJson
                                  andBlock:(ResultCompleteBlock)block;
#pragma mark -个人基本信息保存
- (id)requestSaveAddressWithParamsJson:(NSString *)paramsJson
                              andBlock:(ResultCompleteBlock)block;
#pragma mark -企业基本信息保存
- (id)requestSaveAddressCompanyWithParamsJson:(NSString *)paramsJson
                                     andBlock:(ResultCompleteBlock)block;
#pragma mark- 上传图片的接口
- (id)requestUploadImageParamsJson:(NSString *)paramsJson
                          andBlock:(ResultCompleteBlock)block;
#pragma mark- 删除图片的接口
- (id)requestDeleteImageParamsJson:(NSString *)paramsJson ID:(NSString *)ID
                          andBlock:(ResultCompleteBlock)block;

#pragma mark-  身份校验 个人
- (id)requestVerifyPersonParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block;
#pragma mark-  身份校验 公司
- (id)requestVerifyCompanyParamsJson:(NSString *)paramsJson
                            andBlock:(ResultCompleteBlock)block;
#pragma mark-  * 查询用户店铺信息
- (id)requestSelfShopInfoParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block;
#pragma mark-  * 查询店铺商品列表
- (id)requestSelfShopGoodsInfoParamsJson:(NSString *)paramsJson
                                andBlock:(ResultCompleteBlock)block;
#pragma mark-  * 手机号找回 #pragma mark-  * 邮箱找回
- (id)requestFindUsePhoneParamsJson:(NSString *)paramsJson
                           andBlock:(ResultCompleteBlock)block;
#pragma mark-  * 用户名是否存在
- (id)requestUserNameeEixstParamsJson:(NSString *)paramsJson
                             andBlock:(ResultCompleteBlock)block;
#pragma mark-  *更改
- (id)requestChangeNameAndphoneParamsJson:(NSString *)paramsJson
                                 andBlock:(ResultCompleteBlock)block;

#pragma mark 保存仓单合并
- (id)requestSaveMergeWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 仓单合并页面接口
- (id)requestSaveMergeListWithParamsJson:(NSString *)paramsJson
                                      ID:(NSString *)ID
                                andBlock:(ResultCompleteBlock)block;
#pragma mark 仓单分割，创建子仓单
- (id)requestMakeChildWareWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark 保存子仓单
- (id)requestSaveMakeChildWareWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;

#pragma mark 商品下架
- (id)requestSoldOutWithParamsJson:(NSString *)paramsJson
                                      ID:(NSString *)ID
                                andBlock:(ResultCompleteBlock)block;


#pragma mark 个人失败原因
- (id)requestPersonDefailedReasonWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark 企业失败原因
- (id)requestCompanyDefailedReasonWithParamsJson:(NSString *)paramsJson andBlock:(ResultCompleteBlock)block;
#pragma mark -提交商品
- (id)requestSubmitGoodsWithParamsJson:(NSString *)paramsJson
                                    ID:(NSString *)ID
                              andBlock:(ResultCompleteBlock)block;
//检查邮箱或者电话是否存在
- (id)requestCheckPhoneAndEmailWithParamsJson:(NSString *)paramsJson
                                     andBlock:(ResultCompleteBlock)block;


//检查邮箱或者电话是否存在
- (id)requestCheckPhoneIsUsedWithParamsJson:(NSString *)paramsJson
                                   andBlock:(ResultCompleteBlock)block;
- (id)requestCheckEmailIsUsedWithParamsJson:(NSString *)paramsJson
                                   andBlock:(ResultCompleteBlock)block;


@end
