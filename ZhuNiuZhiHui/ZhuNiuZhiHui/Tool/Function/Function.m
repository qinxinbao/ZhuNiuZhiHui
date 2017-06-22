//
//  Function.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/18.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "Function.h"
#define kMaxLoadingWaitIntervalInSeconds 0.8  // 显示加载条前最大等待的时间
@implementation Function


+ (MBProgressHUD *)createHUD
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:window];
    HUD.detailsLabel.font = [UIFont boldSystemFontOfSize:16];
    [window addSubview:HUD];
    [HUD showAnimated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    
    return HUD;
}

+ (MBProgressHUD *)createHUDWithSuccessCheckmark
{
    MBProgressHUD *hud = [Function createHUD];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HUD-Done"]];
    
    return hud;
}

+ (MBProgressHUD *)createHUDWithFailureCrossmark
{
    MBProgressHUD *hud = [Function createHUD];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HUD-Error"]];
    
    return hud;
}

+ (MBProgressHUD *)createHUDForLoading
{
    UIWindow *window = [[UIApplication sharedApplication].windows lastObject];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:window];
    hud.detailsLabel.font = [UIFont boldSystemFontOfSize:16];
    
    SET_HUD_LOAD_COMPLETE(hud, NO);
    
    dispatch_time_t scheduleTime = dispatch_time(DISPATCH_TIME_NOW, kMaxLoadingWaitIntervalInSeconds * NSEC_PER_SEC);
    
    dispatch_after(scheduleTime, dispatch_get_main_queue(), ^{
        if( !IS_HUD_LOAD_COMPLETE(hud) ) {
            [window addSubview:hud];
            [hud showAnimated:NO];
            hud.removeFromSuperViewOnHide = YES;
            
            hud.mode = MBProgressHUDModeIndeterminate;
            hud.label.text = @"加载中";
            hud.animationType = MBProgressHUDAnimationFade;
            [hud hideAnimated:YES afterDelay:10.0];
        }
    });
    
    return hud;
}


@end
