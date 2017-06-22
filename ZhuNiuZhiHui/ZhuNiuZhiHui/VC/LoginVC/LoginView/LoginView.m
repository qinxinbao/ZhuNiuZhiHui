//
//  LoginView.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "LoginView.h"
#import "LTView.h"
#import "Macros.h"
#define kBasicPadding 10
@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self p_setupSubviews];
    }
    return self;
}

#pragma mark - 添加控件
- (void)p_setupSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    
    
    self.logoImage = [[UIImageView alloc]initWithFrame:CGRectMake(140, 40,Main_Screen_Width - 280, Main_Screen_Width - 280)];
    _logoImage.backgroundColor = [UIColor redColor];
    _logoImage.image = [UIImage imageNamed:@""];
    [self addSubview:_logoImage];

    
    _usernameView = [[LTView alloc]initWithFrame:CGRectMake(kBasicPadding, Y(_logoImage) + HEIGHT(_logoImage) + 20,Main_Screen_Width - 20,40)
                                     description:@"账号:"
                                     placeholder:@"暂不支持手机号登录"];
    _usernameView.destriptionLabel.font = SYSTEMFONT(14);
    _usernameView.inputField.font = SYSTEMFONT(12);
    
    
    _passwordView = [[LTView alloc]initWithFrame:CGRectMake(kBasicPadding,Y(_usernameView) + HEIGHT(_usernameView), WIDTH(_usernameView), HEIGHT(_usernameView)) description:@"密码:" placeholder:@"不小于6位"];
    _passwordView.destriptionLabel.font = SYSTEMFONT(14);
    _passwordView.inputField.font = SYSTEMFONT(12);
    
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(8, Y(_passwordView), Main_Screen_Width - 16, 1)];
    line1.backgroundColor = UIColorFromRGB(0xe5e5e5, 1);
    [self addSubview:line1];
    
    UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(8, Y(line1) + HEIGHT(_passwordView), Main_Screen_Width - 16, 1)];
    line2.backgroundColor = UIColorFromRGB(0xe5e5e5, 1);
    [self addSubview:line2];
    
    {//custom input field
        //一般用户名小写开头，不需要大写
        _usernameView.inputField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        //用户名一般不是规则的单词，无需自动更正
        _usernameView.inputField.autocorrectionType = UITextAutocorrectionTypeNo;
        
        //将用户名输入的return key设置为“下一个”
        [_usernameView.inputField setReturnKeyType:UIReturnKeyNext];
        
        //将密码输入的return key显示为“完成”
        [_passwordView.inputField setReturnKeyType:UIReturnKeyDone];
        
        [_passwordView.inputField setSecureTextEntry:YES];
    }//custom input field
    

    [self addSubview:_usernameView];
    [self addSubview:_passwordView];
    
    self.loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginBT.backgroundColor = UIColorFromRGB(0x2aa5ff, 1.0);
    _loginBT.layer.cornerRadius = 4;
    _loginBT.layer.masksToBounds = YES;
    [_loginBT setTitle:@"登录" forState:UIControlStateNormal];

    [self addSubview:_loginBT];
    
    
    [_loginBT mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_usernameView);
        make.right.equalTo(_usernameView);
        make.top.equalTo(_passwordView.mas_bottom).offset(20);
        make.height.mas_equalTo(40);
    }];

    
}

- (UIImageView *)logoImage
{
    if (!_logoImage) {
        self.logoImage = [[UIImageView alloc]init];
        _logoImage.backgroundColor = [UIColor redColor];
        _logoImage.image = [UIImage imageNamed:@""];
    }
    return _logoImage;
}
- (UIButton *)loginBT
{
    if (!_loginBT) {
        self.loginBT = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginBT.backgroundColor = UIColorFromRGB(0x2aa5ff, 1.0);
        [_loginBT setTitle:@"登录" forState:UIControlStateNormal];
        
    }
    
    return _loginBT;
}
@end
