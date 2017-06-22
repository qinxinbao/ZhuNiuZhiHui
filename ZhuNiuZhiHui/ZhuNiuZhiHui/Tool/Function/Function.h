//
//  Function.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/18.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#define kLoadCompleteKey @"loadComplete"
#define SET_HUD_LOAD_COMPLETE(hud, status) {objc_setAssociatedObject(hud, kLoadCompleteKey, status ? @"yes" : @"no", OBJC_ASSOCIATION_RETAIN_NONATOMIC);}

#define IS_HUD_LOAD_COMPLETE(hud) ([objc_getAssociatedObject(hud,kLoadCompleteKey) isEqual:@"yes"])
@class MBProgressHUD;
@interface Function : NSObject




+ (MBProgressHUD *)createHUD;
+ (MBProgressHUD *)createHUDWithSuccessCheckmark;
+ (MBProgressHUD *)createHUDWithFailureCrossmark;
+ (MBProgressHUD *)createHUDForLoading;

@end
