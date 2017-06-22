//
//  AvatorCell.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/19.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "AvatorCell.h"

@implementation AvatorCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.userAvator = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    _userAvator.layer.masksToBounds = YES;
    _userAvator.layer.cornerRadius = 30;
//    _userAvator.backgroundColor = kThemColor;
    _userAvator.image = [UIImage imageNamed:@"个人"];
    [self.contentView addSubview:_userAvator];
    
    self.nameLable = [[UILabel alloc] init];
    [self.contentView addSubview:_nameLable];
    
    [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.contentView).offset(-20);
        make.left.equalTo(_userAvator.mas_right).offset(10);
        make.width.mas_offset(150);
    }];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
