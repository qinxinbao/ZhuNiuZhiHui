//
//  ZNtabbarVC.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "ZNtabbarVC.h"
#import "TodoVC.h"
#import "OfficeVC.h"
#import "ChatVC.h"
#import "UserVC.h"
#import "Macros.h"
@interface ZNtabbarVC ()

@end

@implementation ZNtabbarVC


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    self.tabBar.tintColor = [UIColor redColor];
    [self setUpAllChildViewController];
    self.tabBar.translucent = NO;
    self.tabBar.tintColor = UIColorFromRGB(0x2b9dfe, 1.0);
}
- (void)setUpAllChildViewController
{
    TodoVC *todoVC = [[TodoVC alloc] init];
    [self setUpOneChildViewController:todoVC image:[UIImage imageNamed:@"待办-1"] selectImage:[UIImage imageNamed:@"待办-2"] title:@"待办"];
    
    ChatVC *chatVC = [[ChatVC alloc] init];
    [self setUpOneChildViewController:chatVC image:[UIImage imageNamed:@"消息-1"] selectImage:[UIImage imageNamed:@"消息-2"]title:@"消息"];
    OfficeVC *officeVC = [[OfficeVC alloc] init];
    [self setUpOneChildViewController:officeVC image:[UIImage imageNamed:@"办公-1"] selectImage:[UIImage imageNamed:@"办公-2"]title:@"办公"];
    UserVC *userVC = [[UserVC alloc] init];
    [self setUpOneChildViewController:userVC image:[UIImage imageNamed:@"我的-1"] selectImage:[UIImage imageNamed:@"我的-2"]title:@"我的"];
    
}
- (void)setUpOneChildViewController:(UIViewController *)viewController image:(UIImage *)image selectImage:(UIImage *)selectImage title:(NSString *)title
{
    viewController.navigationController.title = title;
    
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:viewController];
    navc.title = title;
    navc.navigationBar.tintColor = [UIColor whiteColor];
    navc.navigationBar.translucent = NO;
    navc.navigationBar.barTintColor = kThemColor;
    [navc.navigationBar setTitleTextAttributes:@{NSFontAttributeName:SYSTEMFONT(18),NSForegroundColorAttributeName:[UIColor whiteColor]}];
    navc.tabBarItem.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navc.tabBarItem.image = image;
    navc.tabBarItem.selectedImage = selectImage;

    
    viewController.navigationItem.title = title;
    
    [self addChildViewController:navc];
}
- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    
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
