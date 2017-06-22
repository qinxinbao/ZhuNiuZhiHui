//
//  OfficeEditeVC.m
//  ZhuNiuZhiHui
//
//  Created by ZhuNiu on 2017/5/22.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "OfficeEditeVC.h"
#import "Macros.h"
#import "OfficeCell.h"
#import "resultModel.h"
#define kSelectMenuCell @"selectIdentifier"
#define kSelectMenuHeader @"selectMenuHeaderidentifier"

@interface OfficeEditeVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (strong,nonatomic) UICollectionView *allSelectMenu;
@property (strong,nonatomic) UIView *headerView;

@property (strong,nonatomic) NSMutableArray *dataSource;
@property (strong,nonatomic) NSMutableDictionary *dicc;

@end

@implementation OfficeEditeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
    [self getData];
    
    
}
- (void)initUI
{
    self.allSelectMenu.frame = CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height - 64);
}
- (void)getData
{
    NSString *url = @"menu/searchJa";
    NSDictionary *parmeters = @{
                                @"userId":CodeUserId,
                                @"companyId":CodeCompany,
                                @"token":CodeToken
                                };
    
    
    NSLog(@"%@",parmeters);
    [[NetWorkManager shareNetworkManager] getDataFromUrlWithString:url parmeters:parmeters compltedBlock:^(BOOL isSuccess, id responseObject, NSError *error) {
       
        
        NSLog(@"%@",responseObject);
        
        NSArray *arr = responseObject[@"result"];
        
        for (NSDictionary *dic in arr) {
            resultModel *model = [resultModel mj_objectWithKeyValues:dic];
            [self.dataSource addObject:model];
            NSLog(@"ID = %@,\n menuName = %@,\nparentId = %@,\n checkFlag = %@ ,\n code = %@,subMenuList = %@" ,model.ID , model.menuName , model.parentId,model.checkFlag,model.code, model.subMenuList);
        }

        
        // 开始拿数据
        // 拿到第二层数据
        NSMutableArray *arrayTwo = [NSMutableArray array];
        for ( resultModel *model in self.dataSource) {
            for (NSDictionary *dic in model.subMenuList) {
                resultModel *model1 = [resultModel mj_objectWithKeyValues:dic];
                [arrayTwo addObject:model1];
                
                
                NSLog(@")))))))))))%ld",arrayTwo.count);
//                NSLog(@"第二层数据 ID = %@,\n menuName = %@,\nparentId = %@,\n checkFlag = %@ ,\n code = %@,subMenuList = %@" ,model.ID , model.menuName , model.parentId,model.checkFlag,model.code, model.subMenuList);
            }
            
            
            
            
        }

        for ( resultModel *model in arrayTwo) {
            
            NSLog(@"ID = %@,\n menuName = %@,\nparentId = %@,\n checkFlag = %@ ,\n code = %@,subMenuList = %@" ,model.ID , model.menuName , model.parentId,model.checkFlag,model.code, model.subMenuList);
        }
        
        
        //开始拿第三层数据(不好意思拿多了😀😀😀)
        NSMutableArray *arrThrow = [NSMutableArray array];
        for ( resultModel *model in arrayTwo) {
            for (NSDictionary *dic in model.subMenuList) {
                resultModel *model2 = [resultModel mj_objectWithKeyValues:dic];
                [arrThrow addObject:model2];
            }
        }
        
        
//        NSLog(@"datasouce.count = %lu , arrTwo.count = %lu , arrthrow.count = %lu" , (unsigned long)self.dataSource.count , (unsigned long)arrayTwo.count ,(unsigned long)arrThrow.count);

        

        
        
        
        
        
        
    }];
    
    
    
    
    
    
    
    NSString *urls = @"menu/saveJa";
    NSDictionary *dic = @{
                          @"userId":CodeUserId,
                          @"menuIdArr":@"1003000,800001,400002,1001000,1130000,1110000,800007",
                          @"companyId":CodeCompany,
                          @"token":CodeToken
                          };
    [[NetWorkManager shareNetworkManager] getDataFromUrlWithString:urls parmeters:dic compltedBlock:^(BOOL isSuccess, id responseObject, NSError *error) {
//        NSLog(@"%@",responseObject);
        
        
    }];
    
    
}



#pragma mark - UICollectionViewDelegate and DataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataSource.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    OfficeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSelectMenuCell forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.officeImage.backgroundColor = [UIColor whiteColor];
    cell.officeLable.backgroundColor = [UIColor whiteColor];
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
    allLable.frame = CGRectMake(20, 0, 50, 30);
    allLable.backgroundColor = [UIColor whiteColor];
    allLable.text = @"全部";
    [headerView addSubview:allLable];
    
    self.headerView = headerView;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    OfficeEditeVC *editeVC = [[OfficeEditeVC alloc] init];
//    self.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:editeVC animated:YES];
//    self.hidesBottomBarWhenPushed = NO;
}

- (UICollectionView *)allSelectMenu
{
    if (!_allSelectMenu) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _allSelectMenu = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _allSelectMenu.backgroundColor = kBackGroundColor;
        CGFloat w = (Main_Screen_Width - 3) / 4;
        layout.itemSize = CGSizeMake(w, w);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        layout.headerReferenceSize = CGSizeMake(Main_Screen_Width, 40);
        _allSelectMenu.contentInset = UIEdgeInsetsMake(1, 0, 0, 0);
        [_allSelectMenu registerClass:[OfficeCell class] forCellWithReuseIdentifier:kSelectMenuCell];
        [_allSelectMenu registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kSelectMenuHeader];
        
        _allSelectMenu.delegate = self;
        _allSelectMenu.dataSource = self;
        
        
        [self.view addSubview:_allSelectMenu];
        
        
        
    }
    return _allSelectMenu;
}


- (NSMutableArray *)dataSource
{
    if (!_dataSource) {
        self.dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (NSMutableDictionary *)dicc
{
    if (!_dicc) {
        self.dicc = [NSMutableDictionary dictionary];
    }
    return _dicc;
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
