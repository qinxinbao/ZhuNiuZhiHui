//
//  ChatVC.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "ChatVC.h"
#import "LoginVC.h"
@interface ChatVC ()

@end

@implementation ChatVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xfb824b ,1.0);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(100);
        make.bottom.mas_equalTo(-200);
    }];

}
- (void)buttonAction
{
    LoginVC *login = [[LoginVC alloc]init];
    
    [self presentViewController:login animated:YES completion:nil];
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
