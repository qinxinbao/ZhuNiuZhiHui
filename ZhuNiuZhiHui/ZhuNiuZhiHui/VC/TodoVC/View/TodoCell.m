//
//  TodoCell.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/19.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell
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
    [self.contentView addSubview:self.type];
    [self.contentView addSubview:self.creatTime];
    [self.contentView addSubview:self.nickName];
    [self.contentView addSubview:self.reviewResult];
    
    [_type mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_offset(60);
    }];
    [_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.type);
        make.left.equalTo(self.type.mas_right).offset(10);
        make.height.mas_offset(30);
        make.width.mas_offset(100);
    }];
    [_creatTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.title);
        make.bottom.equalTo(self.type);
        make.top.equalTo(self.title.mas_bottom).offset(5);
        make.width.mas_offset(130);
    }];
    [_reviewResult mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title);
        make.right.equalTo(self.contentView).offset(-10);
        make.width.mas_offset(60);
        make.height.mas_offset(20);
    }];

    
    [_nickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.reviewResult);
        make.top.bottom.equalTo(self.creatTime);
        make.left.equalTo(self.creatTime.mas_right).offset(0);
    }];
}

- (void)setModel:(TodoModel *)model
{
    if (_model != model) {
        _model = model;
    }
    
    _nickName.text = [NSString stringWithFormat:@"发起人:%@",model.nickName];
    _title.text = model.title;
    
    NSString *str = [model.createTime substringToIndex:10];
    
    _creatTime.text = [@"发起时间:" stringByAppendingString:str];
    
    if ([model.reviewResult isEqualToString:@"0"]) {
        _reviewResult.image = [UIImage imageNamed:@"未审批"];
    }else if ([model.reviewResult isEqualToString:@"1"]){
        _reviewResult.image = [UIImage imageNamed:@"同意2"];
    }else if ([model.reviewResult isEqualToString:@"2"]){
        _reviewResult.image = [UIImage imageNamed:@"不同意"];
    }else if ([model.reviewResult isEqualToString:@"3"]){
        _reviewResult.image = [UIImage imageNamed:@"驳回"];
    }else if ([model.reviewResult isEqualToString:@"6"]){
        _reviewResult.image = [UIImage imageNamed:@"shenpizhongzhi"];
    }else if ([model.reviewResult isEqualToString:@"7"]){
        _reviewResult.image = [UIImage imageNamed:@"通知"];
    }
    
    if ([model.type isEqualToString:@"1"]||[model.type isEqualToString:@"2"]||[model.type isEqualToString:@"3"]) {
        _type.text = @"项目";
    }else if ([model.type isEqualToString:@"4"] ||[model.type isEqualToString:@"5"]||[model.type isEqualToString:@"6"]||[model.type isEqualToString:@"7"]){
        _type.text = @"采购";
        
    }else if ([model.type isEqualToString:@"8"]||[model.type isEqualToString:@"8"]){
        _type.text = @"退货";
    }else if ([model.type isEqualToString:@"10"]||[model.type isEqualToString:@"11"]){
        _type.text = @"财务";
    }else if ([model.type isEqualToString:@"12"]){
        _type.text = @"报告";
    }else if ([model.type isEqualToString:@"14"]||[model.type isEqualToString:@"15"]){
        _type.text = @"印章";
    }else if ([model.type isEqualToString:@"16"]){
        _type.text = @"档案";
    }else if ([model.type isEqualToString:@"18"]){
        _type.text = @"证照";
    }else if ([model.type isEqualToString:@"19"]){
        _type.text = @"办公";
    }else if ([model.type isEqualToString:@"20"]){
        _type.text = @"请假";
    }else if ([model.type isEqualToString:@"21"]){
        _type.text = @"出差";
    }else if ([model.type isEqualToString:@"26"]){
        _type.text = @"接待";
    }
    
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
- (UILabel *)type
{
    if (nil == _type) {
        self.type = [[UILabel alloc]init];
        self.type.backgroundColor = [UIColor redColor];
        _type.layer.cornerRadius = 30;
        _type.layer.masksToBounds = YES;
        _type.textAlignment = NSTextAlignmentCenter;
        _type.textColor = [UIColor whiteColor];
        
    }
    return _type;
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
- (UILabel *)nickName
{
    if (nil == _nickName) {
        self.nickName = [[UILabel alloc]init];
        _nickName.backgroundColor = [UIColor whiteColor];;
        _nickName.font = SYSTEMFONT(14);
        _nickName.textAlignment = NSTextAlignmentRight;
        _nickName.textColor = kTextColor;
        
    }
    return _nickName;
}
- (UIImageView *)reviewResult
{
    if (nil == _reviewResult) {
        self.reviewResult = [[UIImageView alloc] init];
        _reviewResult.backgroundColor = [UIColor whiteColor];
        
    }
    return _reviewResult;
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
