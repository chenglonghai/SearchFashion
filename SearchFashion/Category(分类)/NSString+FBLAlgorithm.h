//
//  NSString+FBLAlgorithm.h
//  FBLWoodmall
//
//  Created by emir on 2017/3/17.
//  Copyright © 2017年 Emir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString (FBLAlgorithm)
+ (NSString *) compareCurrentTime:(NSString *)str;
+ (NSString *)base64StringFromText:(NSString *)text;
+ (NSString *)textFromBase64String:(NSString *)base64;
+ (NSString *)returnPrice:(NSString *)price;

+ (NSString *)encryptUseDES:(NSString *)plainText;
+ (NSString *)decryptUseDES:(NSString *)cipherText;


+(NSString*)meiYiXiuDecryptUseDES:(NSString*)cipherText key:(NSString*)key;
+(NSString *)meiYiXiuEncryptUseDES:(NSString *)clearText key:(NSString *)key;



/**
 
 ********************************
 */

+ (NSString *) encode:(NSString *)str key:(NSString *)key;
+ (NSString *) decode:(NSString *)str key:(NSString *)key;



+ (NSString *) encodeBase64WithString:(NSString *)strData;
+ (NSString *) encodeBase64WithData:(NSData *)objData;
+ (NSData *) decodeBase64WithString:(NSString *)strBase64;
+ (NSString *)doCipher:(NSString *)sTextIn key:(NSString *)sKey
               context:(CCOperation)encryptOrDecrypt;




+ (NSString *)encryptUseHmacSha1:(NSString *)data;
+ (NSString*)DataToJsonString:(id)object;
+ (NSString *)removeSpaceAndNewline:(NSString *)str;
+(NSString *)timeTranslaterTimestamp:(NSString *)timestamp;
+(NSString *)time__TranslaterTimestamp:(NSString *)timestamp;
+ (BOOL)isBiggerAfterTwoDayWithSelectTime:(NSString *)selectDay;
+(NSString *)timeTranslaterTimestampHours:(NSString *)timestamp;
+(NSString *)timeTranslaterTimestampDay:(NSString *)timestamp;
+(int)compareOneDay:(NSString *)oneDay withAnotherDay:(NSString *)anotherDay;
+ (CGSize)sizeForLabelWithString:(NSString *)str
                           width:(float)width;
+ (CGSize)sizeForLabelWithString:(NSString *)str
                           width:(float)width fontSize:(float)fontSize;
+(BOOL)checkBankCardNumber:(NSString *)cardNumber;
+ (BOOL)CheckIsIdentityCard: (NSString *)identityCard;


+ (BOOL)isContainerLiterAndNumber:(NSString *)passWord;
+(NSString *)getNowTimeTimestamp;
+(NSString *)dicToJson:(NSDictionary *)dic;
@end
