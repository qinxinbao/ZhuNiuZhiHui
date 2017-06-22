//
//  OfficeVC.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "OfficeVC.h"
#import "Macros.h"
#import "OfficeCell.h"
#import "OfficeEditeVC.h"
#import "OfficeModel.h"
#define kAPI @"";
#define kSelectMenuCell @"selectIdentifier"
#define kSelectMenuHeader @"selectMenuHeaderidentifier"

@interface OfficeVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic) NSMutableArray *dataSource;
@property (strong,nonatomic) OfficeModel *model;
@property (strong,nonatomic) UICollectionView *selectMenu;
@property (strong,nonatomic) UILabel *headerLable;
@property (strong,nonatomic) UIView *headerView;
@end

@implementation OfficeVC




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    [self getData];
    
    
    NSLog(@"xiugaile ");
    
    
}
- (void)initUI
{
    self.selectMenu.frame = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height -49 -64);
    
}

- (void)getData
{
    NSString *url = @"menu/userMenuSearchJa";
    NSDictionary *parmeters = @{@"userId":CodeUserId,
                                @"companyId":CodeCompany,
                                @"token":CodeToken
                                };
    
    
    [[NetWorkManager shareNetworkManager] getDataFromUrlWithString:url parmeters:parmeters compltedBlock:^(BOOL isSuccess, id responseObject, NSError *error) {
       
        NSLog(@"responseObject = %@",responseObject);
        if (isSuccess) {
            NSArray *modelArray = responseObject[@"result"];
            NSDictionary *dic = @{@"code":@"all",
                                  @"menuName":@"全部"
                                  };
            NSMutableArray *arr = [NSMutableArray arrayWithArray:modelArray];
            [arr addObject:dic];
            
            NSArray *officeArr = [OfficeModel mj_objectArrayWithKeyValuesArray:arr];
            NSLog(@"%@",officeArr);
            self.dataSource = [NSMutableArray array];
            
            [self.dataSource addObjectsFromArray:officeArr];
            [self.selectMenu reloadData];

            
            
        }else{
            
            
            
            
            
            
            
        }
        
        
        
        
    }];
    
    
    
    
    
    
    
    
}
#pragma mark - UICollectionViewDelegate and  DataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    OfficeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSelectMenuCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.officeImage.backgroundColor = [UIColor whiteColor];
    cell.officeLable.backgroundColor = [UIColor whiteColor];
    OfficeModel *model = [self.dataSource objectAtIndex:indexPath.row];
    cell.officeLable.text = model.menuName;
    
    
    
    if ([model.code isEqualToString: @"project"]) {
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"projectmanagement"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"supplementalcontract"]){
        cell.officeImage.image = [UIImage imageNamed:@"补充合同-01"];
    }else if ([model.code isEqualToString:@"purchase"]){
        cell.officeImage.image = [UIImage imageNamed:@"采购计划-01"];
    }else if ([model.code isEqualToString:@"purchasemanagement"]){
        cell.officeImage.image = [UIImage imageNamed:@"采购单-01"];
    }else if ([model.code isEqualToString:@"materialpact"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"material"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"storage"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"payment"]){
        cell.officeImage.image = [UIImage imageNamed:@"付款申请-01"];
    }else if ([model.code isEqualToString:@"invoice"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"supplier"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"notice"]){
        cell.officeImage.image = [UIImage imageNamed:@"行政报告-01"];
    }else if ([model.code isEqualToString:@"meeting"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"daily"]){
        cell.officeImage.image = [UIImage imageNamed:@"日志管理-01"];
    }else if ([model.code isEqualToString:@"logistics"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"certificate"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"stamp"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"archive"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"personInfo"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"attendance"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"personCertificate"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"vacation"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"businessTrip"]){
        cell.officeImage.image = [UIImage imageNamed:@""];
    }else if ([model.code isEqualToString:@"all"]){
        cell.officeImage.image = [UIImage imageNamed:@"全部-01"];
    }
    
    
    
    
    
    [cell.officeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.contentView).offset(30);
        make.top.equalTo(cell.contentView).offset(10);
        make.right.equalTo(cell.contentView).offset(-30);
        make.bottom.equalTo(cell.contentView).offset (-40);
    }];
    [cell.officeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(cell.contentView);
        make.top.equalTo(cell.officeImage.mas_bottom).offset(10);
    }];
    
    return cell;
    
    
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kSelectMenuHeader forIndexPath:indexPath];
        [self addContent];
        
        [header addSubview:self.headerView];
        
        return header;
        
        
    }
    
    
    
    return nil;
    
}
- (void)addContent
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width, 30)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    
    UILabel *allLable = [[UILabel alloc] init];
    allLable.frame = CGRectMake(0, 0, 50, 30);
    allLable.backgroundColor = [UIColor whiteColor];
    allLable.text = @"全部";
    [headerView addSubview:allLable];
    
    self.headerView = headerView;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    OfficeModel *model = [self.dataSource objectAtIndex:indexPath.row];
    
    if ([model.code isEqualToString:@"all"]) {
        OfficeEditeVC *editeVC = [[OfficeEditeVC alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:editeVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;

    }else{
        
    }
    
}

- (UICollectionView *)selectMenu
{
    if (!_selectMenu) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _selectMenu = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _selectMenu.backgroundColor = kBackGroundColor;
        CGFloat w = (Main_Screen_Width - 3) / 4;
        layout.itemSize = CGSizeMake(w, w);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.headerReferenceSize = CGSizeMake(Main_Screen_Width, 40);
        _selectMenu.contentInset = UIEdgeInsetsMake(1, 0, 0, 0);
        [_selectMenu registerClass:[OfficeCell class] forCellWithReuseIdentifier:kSelectMenuCell];
        [_selectMenu registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSelectMenuHeader];
        
        _selectMenu.delegate = self;
        _selectMenu.dataSource = self;

        
        [self.view addSubview:_selectMenu];
        
        
        
    }
    return _selectMenu;
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
