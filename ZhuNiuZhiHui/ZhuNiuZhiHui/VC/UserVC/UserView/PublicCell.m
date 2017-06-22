//
//  PublicCell.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/19.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "PublicCell.h"

@implementation PublicCell

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
    self.titleLable = [[UILabel alloc] init];
//    _titleLable.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_titleLable];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.mas_offset(80);
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
