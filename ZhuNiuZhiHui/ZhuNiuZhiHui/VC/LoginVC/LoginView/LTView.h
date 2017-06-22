//
//  LTView.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/18.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTView : UIView
@property (strong,nonatomic) UILabel *destriptionLabel;
@property (strong,nonatomic) UITextField *inputField;


//初始化方法，置顶lable上显示的文字
- (instancetype)initWithFrame:(CGRect)frame description:(NSString *)labelText placeholder:(NSString *)placeholderText;

//设置lable显示的文字
- (void)setDestription:(NSString *)destription;
//设置输入框的内容
- (NSString *)descriptionText;

//输入框是否是密码格式
- (NSString *)inputFieldText;

//输入框是否 密码格式
- (void)setSecureTextEnabled:(BOOL)isSecureText;

//设置textField代理
- (void)setTextFieldDelegate:(id<UITextFieldDelegate>)fieldDelegate;

//textfield回收键盘
- (void)recyleKeyboard;


@end
