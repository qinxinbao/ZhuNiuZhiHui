//
//  LoginView.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LTView;
@interface LoginView : UIView

@property (strong,nonatomic) LTView *usernameView;
@property (strong,nonatomic) LTView *passwordView;
@property (strong,nonatomic) UIImageView *logoImage;
@property (strong,nonatomic) UIButton *loginBT;

@end
