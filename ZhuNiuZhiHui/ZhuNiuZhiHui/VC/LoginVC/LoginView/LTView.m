//
//  LTView.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/18.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "LTView.h"
@interface LTView ()

- (void)p_setupSubviews;

@end



@implementation LTView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self p_setupSubviews];
    }
    return self;
    
    
    
}


- (instancetype)initWithFrame:(CGRect)frame description:(NSString *)labelText placeholder:(NSString *)placeholderText
{
    self = [self initWithFrame:frame];
    if (self) {
        [self setDestription:labelText];
        _inputField.placeholder = placeholderText;
    }
    return self;
}

- (void)p_setupSubviews
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    //默认情况下lable和textfield宽度是1:2
    _destriptionLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width/5, height)];
    _destriptionLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_destriptionLabel];
    
    
    _inputField = [[UITextField alloc] initWithFrame:CGRectMake(width/5, 0, width - width/5, height)];
    //    _inputField.borderStyle = UITextBorderStyleRoundedRect;
    _inputField.text = @"";
    //在输入时 可以显示x号清空输入内容
    _inputField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_inputField];
    
}
//设置lable显示文字
- (void)setDestription:(NSString *)destription
{
    _destriptionLabel.text = destription;
}

//获取输入框里的内容
- (NSString *)descriptionText
{
    return _destriptionLabel.text;
}

//获取输入框的内容

- (NSString *)inputFieldText
{
    return _inputField.text;
}

//输入框是否是密码格式
- (void)setSecureTextEnabled:(BOOL)isSecureText
{
    _inputField.secureTextEntry = isSecureText;
}

//设置textfield代理
- (void)setTextFieldDelegate:(id<UITextFieldDelegate>)fieldDelegate
{
    _inputField.delegate = fieldDelegate;
}

//回收键盘
- (void)recyleKeyboard
{
    [_inputField resignFirstResponder];
}






@end
