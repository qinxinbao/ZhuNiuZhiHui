//
//  LoginVC.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "LoginVC.h"
#import "LoginView.h"
#import "LTView.h"
#import "UserInforManager.h"
#import "JPPD.h"
@interface LoginVC ()<UITextFieldDelegate>
@property (strong,nonatomic) LoginView *loginView;
@property (strong,nonatomic) MBProgressHUD *HUD;
@end

@implementation LoginVC

- (void)loadView
{
    [super loadView];
    self.loginView = [[LoginView alloc] initWithFrame:Main_Screen_bounds];
    self.view = self.loginView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.loginView.loginBT addTarget:self action:@selector(loginBTAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.usernameView setTextFieldDelegate:(id)self];
    [self.loginView.passwordView setTextFieldDelegate:(id)self];
    
}

- (void)loginBTAction:(UIButton *)sender
{
    if (self.loginView.usernameView.inputField.text.length == 0 || self.loginView.passwordView.inputField.text.length == 0) {
        MBProgressHUD *hud = [Function createHUD];
        hud.label.text = @"账号和密码不能为空";
        [hud showAnimated:YES];
        [hud hideAnimated:YES afterDelay:2];
    }else{
//        self.loginView.loginBT.userInteractionEnabled = YES;//关闭登录按钮防止重复点击
        [[UserInforManager shareUserInforManager] loginWithAccount:self.loginView.usernameView.inputField.text password:self.loginView.passwordView.inputField.text completedBlock:^(BOOL isSuccess, id responseObject, NSError *error) {
            if (isSuccess) {
                NSMutableDictionary *userInfor = [NSMutableDictionary dictionary];
                NSDictionary *resultDic =[responseObject valueForKey:@"result"];
                [userInfor setValuesForKeysWithDictionary:resultDic];
                
                
                
                for (NSString *key in [userInfor allKeys]) {
                    // 确保全部为字符串
                    NSString *str = [NSString stringWithFormat:@"%@",userInfor[key]];
                    [userInfor setValue:str forKey:key];
                    if ([key isEqualToString:@"id"]) {
                        [userInfor setObject:str forKey:@"id"];
                    }
                }
                [userInfor setValue:@"1" forKey:@"hasLogined"];
                //丰富用户信息
                [JPPD sharedJPPD].type = JPStorageDirectoryTypeCaches;
                //保存数据
                [[JPPD sharedJPPD]writeManyLightweightValues:userInfor inTable:@"UserInfor"];
                // 查看数据
                NSLog(@"表格‘test’中的所有数据 = %@", [[JPPD sharedJPPD] allValuesInTable:@"UserInfor"].value);
                
                if ([[[JPPD sharedJPPD] valueForKey:@"hasLogined" inTable:@"UserInfor"].value isEqualToString:@"1"]) {
                    
                    [self dismissViewControllerAnimated:YES completion:nil];
                    
                }

                
                
                
                
                
            }else{
                
                
                
                
            }
            
            
            
            
        }];
        
        
        
    }
}
#pragma mark - 点击空白收回键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //当前界面停止编辑
    [self.loginView endEditing:YES];
    //恢复父视图的bounds
    [UIView animateWithDuration:0.3 animations:^{
        self.loginView.bounds = CGRectMake(0, 0, self.loginView.frame.size.width, self.loginView.frame.size.height);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
