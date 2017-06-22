//
//  SendCell.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/20.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "SendCell.h"

@implementation SendCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubviews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

- (void)addSubviews
{
    
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.creatTime];
    [self.contentView addSubview:self.nodeName];
    [self.contentView addSubview:self.reviewFlag];
    
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.height.mas_offset(30);
        make.width.mas_offset(100);
    }];
    [_creatTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.title.mas_bottom).offset(5);
        make.width.mas_offset(130);
    }];
    [_reviewFlag mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title);
        make.right.equalTo(self.contentView).offset(-10);
        make.width.mas_offset(60);
        make.height.mas_offset(20);
    }];
    self.reviewFlag.image = [UIImage imageNamed:@"shenpizhongzhi"];
    
    [_nodeName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.reviewFlag);
        make.top.bottom.equalTo(self.creatTime);
        make.left.equalTo(self.creatTime.mas_right).offset(0);
    }];
    self.nodeName.text = @"发起人:李大炕";
    self.title.text = @"请假";
    self.creatTime.text = @"2016-6-9 09:08:43";
}

- (UILabel *)title
{
    if (nil == _title) {
        self.title = [[UILabel alloc] init];
        self.title.backgroundColor = [UIColor whiteColor];
        self.title.textAlignment = NSTextAlignmentLeft;
        
        
    }
    return _title;
}

- (UILabel *)creatTime
{
    if (nil == _creatTime) {
        self.creatTime = [[UILabel alloc] init];
        self.creatTime.backgroundColor = [UIColor whiteColor];
        _creatTime.font = SYSTEMFONT(14);
        _creatTime.textAlignment = NSTextAlignmentLeft;
        _creatTime.textColor = kTextColor;
        
    }
    
    return _creatTime;
}
- (UILabel *)nodeName
{
    if (nil == _nodeName) {
        self.nodeName = [[UILabel alloc]init];
        _nodeName.backgroundColor = [UIColor whiteColor];;
        _nodeName.font = SYSTEMFONT(14);
        _nodeName.textAlignment = NSTextAlignmentRight;
        _nodeName.textColor = kTextColor;
        
    }
    return _nodeName;
}
- (UIImageView *)reviewFlag
{
    if (nil == _reviewFlag) {
        self.reviewFlag = [[UIImageView alloc] init];
        _reviewFlag.backgroundColor = [UIColor whiteColor];
        
    }
    return _reviewFlag;
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
