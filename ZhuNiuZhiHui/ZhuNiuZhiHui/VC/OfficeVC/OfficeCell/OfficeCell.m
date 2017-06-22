//
//  OfficeCell.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/22.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "OfficeCell.h"

@implementation OfficeCell

- (UIImageView *)officeImage
{
    if (!_officeImage) {
        self.officeImage = [[UIImageView alloc] init];
        _officeImage.backgroundColor = [UIColor whiteColor];
        _officeImage.image = [UIImage imageNamed:@"行政报告-01"];
        _officeImage.contentMode = UIViewContentModeScaleAspectFit;
        
        
        
        
        [self.contentView addSubview:self.officeImage];
        
    }
    return _officeImage;
}

- (UILabel *)officeLable
{
    if (!_officeLable) {
        self.officeLable = [[UILabel alloc] initWithFrame:CGRectZero];
        _officeLable.font = SYSTEMFONT(12);
        _officeLable.backgroundColor = [UIColor whiteColor];
        _officeLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.officeLable];
    }
    return _officeLable;
}


@end
