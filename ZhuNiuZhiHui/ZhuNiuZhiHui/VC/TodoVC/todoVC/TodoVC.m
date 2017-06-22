//
//  TodoVC.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "TodoVC.h"
#import "TNCustomSegment.h"
#import "TodoModel.h"
#import "TodoCell.h"
#import "SendCell.h"
#define kTodoCellIdentifier @"TodoCell"
#define kSendCellIdentifier @"SendCell"
@interface TodoVC ()<UITableViewDelegate,UITableViewDataSource,TNCustomSegmentDelegate>
@property (strong,nonatomic) UITableView *todoTable;
@property (nonatomic,assign) NSInteger selectIndex;

@property (strong,nonatomic)NSMutableArray *dataSource;
@end

@implementation TodoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self getData];
    
    [self creatSuviews];
    
    
}
- (void)getData
{
    NSString *token = [NSString stringWithFormat:@"%@",[[JPPD sharedJPPD] valueForKey:@"token" inTable:@"UserInfor"].value];
    NSString *userId = [NSString stringWithFormat:@"%@",[[JPPD sharedJPPD] valueForKey:@"id" inTable:@"UserInfor"].value];
    NSString *url = @"todo/todoSearch";
    NSDictionary *parmeters = @{
                                @"reviewFlag":@"0",
                                @"pageNo":@"1",
                                @"pageCount":@"4",
                                @"userId":userId,
                                @"token":token
                                };

   [[NetWorkManager shareNetworkManager] getDataFromUrlWithString:url parmeters:parmeters compltedBlock:^(BOOL isSuccess, id responseObject, NSError *error) {
       
       NSLog(@"%@",responseObject);
       NSDictionary *dic = responseObject[@"result"];
       
       NSMutableArray *arr = dic[@"rows"];
       NSMutableArray *modelArr = [TodoModel mj_objectArrayWithKeyValuesArray:arr];
       
       
       [self.dataSource addObjectsFromArray:modelArr];
       
       
       [self.todoTable reloadData];
       
   }];
    
    
    
}

- (void)creatSuviews
{
    UIView *selevtView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 40)];
    [self.view addSubview:selevtView];
    NSArray *items = @[@"我收到的",@"我发出的"];
    TNCustomSegment *segment = [[TNCustomSegment alloc]initWithItems:items withFrame:CGRectMake(15, 5, Main_Screen_Width - 30, 30) withSelectedColor:kThemColor withNormolColor:nil withFont:nil];
    segment.delegate = self;
    segment.selectedIndex = 0;
    [selevtView addSubview:segment];
    
    self.todoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, Main_Screen_Width, Main_Screen_Height - 64 - 49 - 40) style:UITableViewStyleGrouped];
    _todoTable.delegate = self;
    _todoTable.dataSource = self;
    [self.view addSubview:_todoTable];
    
    
    [self.todoTable registerClass:[TodoCell class] forCellReuseIdentifier:kTodoCellIdentifier];
    [self.todoTable registerClass:[SendCell class] forCellReuseIdentifier:kSendCellIdentifier];
    
    
}



#pragma mark - TNCustomsegmentDelegate
- (void)segment:(TNCustomSegment *)segment didSelectedIndex:(NSInteger)selectIndex{
    
    self.selectIndex = selectIndex;
    NSLog(@"%ld",selectIndex);
    
    [self.todoTable reloadData];
    
}

#pragma mark - Delegate And DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (self.selectIndex == 0) {
        TodoCell *cell = [tableView dequeueReusableCellWithIdentifier:kTodoCellIdentifier];
        
        TodoModel *model = [self.dataSource objectAtIndex:indexPath.section];

        cell.model = model;
        return cell;
    }else{
        SendCell *cell = [tableView dequeueReusableCellWithIdentifier:kSendCellIdentifier];
        return cell;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;

    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return _dataSource;
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
