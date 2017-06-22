//
//  UserVC.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/16.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "UserVC.h"
#import "AvatorCell.h"
#import "PublicCell.h"
#import "SetingVC.h"
#import "UserInfomationVC.h"
#define kUserNameCellidentifier @"userNameCell"
#define kselectCellidentifier @"selectCell"
@interface UserVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *userTab;
@end

@implementation UserVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureNavigationBar];
    [self creatSubView];
    
    
}
- (void)configureNavigationBar
{
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLable.text = [[JPPD sharedJPPD]valueForKey:@"nickName" inTable:@"UserInfor"].value;
    titleLable.font = SYSTEMFONT(18);
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = titleLable;
    
}
- (void)creatSubView
{
    self.userTab = [[UITableView alloc] initWithFrame:Main_Screen_bounds style:UITableViewStyleGrouped];
    _userTab.backgroundColor = kBackGroundColor;
    _userTab.sectionFooterHeight = 0.1;
    [self.view addSubview:_userTab];
    _userTab.delegate = self;
    _userTab.dataSource = self;
    
    [_userTab registerClass:[AvatorCell class] forCellReuseIdentifier:kUserNameCellidentifier];
    [_userTab registerClass:[PublicCell class] forCellReuseIdentifier:kselectCellidentifier];
    
    
    [_userTab reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        AvatorCell *cell = [tableView dequeueReusableCellWithIdentifier:kUserNameCellidentifier];
        cell.nameLable.text = [[JPPD sharedJPPD]valueForKey:@"nickName" inTable:@"UserInfor"].value;
        return cell;

    }else{
       
        PublicCell *cell = [tableView dequeueReusableCellWithIdentifier:kselectCellidentifier];
        
        if (indexPath.section ==1) {
            cell.titleLable.text = @"个人信息";
        }else{
            cell.textLabel.text = @"设置";
        }
        
        return cell;
        
    }
 
    
    
    
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }else{
        return 50;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        UserInfomationVC *userVC = [[UserInfomationVC alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:userVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else if (indexPath.section == 2){
        SetingVC *setVC = [[SetingVC alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:setVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
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
