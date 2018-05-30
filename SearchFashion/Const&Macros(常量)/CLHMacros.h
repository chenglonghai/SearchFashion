//
//  CLHMacros.h
//  AppClient
//
//  Created by APAPA on 2017/6/27.
//  Copyright © 2017年 Chenlonghai. All rights reserved.
//

#ifndef CLHMacros_h
#define CLHMacros_h

#ifdef DEBUG
#define NSLogDebug(s, ...) NSLog(@"%s [ line--%d ]: %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])
#else
#define NSLogDebug(s, ...)
#endif

//App版本号
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b)    RGBA(r,g,b,1.0f)
#define RandomColor   RGB(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))


#define WIDTH(w)  r

// MainScreen Height&Width
#define kKeyWindow [UIApplication sharedApplication].delegate.window
#define kAppDelegate (AppDelegate *)[UIApplication sharedApplication].delegate
#define kScreenHeight      [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth       [[UIScreen mainScreen] bounds].size.width


#define ScreenW kScreenWidth
#define ScreenH [[UIScreen mainScreen] bounds].size.height
#define kNavBarHeight 64

#define kR      kScreenWidth/375.0
#define kShopImgHeight       75
// MainScreen bounds
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kNavigationBarHeight 64
#define kNavigationItemFontSize 16
// 当前系统版本
#define kSystemVersion          ([[[UIDevice currentDevice] systemVersion] doubleValue])

// 是否大于等于IOS7
#define isIOS7                  ([[[UIDevice currentDevice]systemVersion]doubleValue] >= 7.0)
// 是否IOS6
#define isIOS6                  ([[[UIDevice currentDevice]systemVersion]doubleValue] < 7.0)
// 是否大于等于IOS8
#define isIOS8                  ([[[UIDevice currentDevice]systemVersion]doubleValue] >=8.0)
// 是否大于IOS9
#define isIOS9                  ([[[UIDevice currentDevice]systemVersion]doubleValue] >=9.0)
// 是否iPad
#define isPad                   (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)


#define kInputWidth 230

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#define FBLShowHudMsg(msg)   [NSObject showHUDWithMsg:msg]
#define FBLShowProgress [NSObject showProgress]
#define FBLHideProgress [NSObject hideProgress]

//不同屏幕尺寸字体适配（375，667是因为效果图为IPHONE6 如果不是则根据实际情况修改）
#define kScreenWidthRatio  (kScreenWidth / 375.0)
#define kScreenHeightRatio (kScreenHeight / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     CHINESE_SYSTEM(AdaptedWidth(R))


#define DES_APPKEY @";7!}o,~N"


#define ALERT_MSG(msg) static UIAlertView *alert; alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];\
[alert show];\



/** rgb颜色转换（16进制->10进制）*/
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



#define WeakSelf(weakSelf)  __weak __typeof(self) weakSelf = self;
#define NAVH (MAX(Device_Width, Device_Height)  == 812 ? 88 : 64)
#define TABBARH 49
#define Device_Width  [[UIScreen mainScreen] bounds].size.width//获取屏幕宽高
#define Device_Height [[UIScreen mainScreen] bounds].size.height



// Include any system framework and library headers here that should be included in all compilation units.
// You will also need to set the Prefix Header build setting of one or more of your targets to reference this file.

#define IOS7 [[[UIDevice currentDevice]systemVersion] floatValue] >= 7.0


#define kColorWithRGB(R, G, B)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define kColorWithRGBAlpha(R, G, B, A)  [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define kAppThemeColor kColorWithRGB(56, 213, 124)  //App的主题颜色


#define kFontWithFamilyAndSize(FONT, SIZE) [UIFont fontWithName:FONT size:SIZE]
#define kAppFontWithSize(SIZE) [UIFont fontWithName:@"HelveticaNeue-Light" size:SIZE]

#define kButtonGap 20


#define kKeyOfUserDefaultImage @"kKeyOfUserDefaultImage"


#define kMixResultSuccess 0
#define kMixResultSourceImageNoFace 1
#define kMixResultModelImageNoFace 2
#define kMixResultUnknowError 3





//height and width
#define kHeaderViewHeight    200
#define kMenuViewHeight      44
#define kNavigationHeight    64
#define kScrollViewOriginY   (kHeaderViewHeight + kNavigationHeight - kNavigationHeight)


#define RGBcolor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define HEXRGBCOLOR(h) RGBcolor(((h>>16)&0xFF), ((h>>8)&0xFF), (h&0xFF))


//解决循环引用
#define weakify(va) \
autoreleasepool {} \
__weak __typeof__(va) metamacro_concat(va, _weak_) = (va);
#define strongify(va) \
try {} @finally {} \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong __typeof__(va) va = metamacro_concat(va, _weak_);\
_Pragma("clang diagnostic pop")
#define metamacro_concat(A, B) A ## B

//import






#endif /* CLHMacros_h */
