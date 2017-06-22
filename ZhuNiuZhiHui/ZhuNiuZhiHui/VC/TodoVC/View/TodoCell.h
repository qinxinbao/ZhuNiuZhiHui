//
//  TodoCell.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/19.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TodoModel.h"
@interface TodoCell : UITableViewCell

@property (strong,nonatomic)UILabel *title;
@property (strong,nonatomic)UIImageView *reviewResult;
@property (strong,nonatomic)UILabel *creatTime;
@property (strong,nonatomic)UILabel *nickName;
@property (strong,nonatomic)UILabel *type;
@property (strong,nonatomic) TodoModel *model;

- (void)setModel:(TodoModel *)model;



@end
