//
//  OfficeEditeModel.h
//  ZhuNiuZhiHui
//
//  Created by ZhuNiu on 2017/5/22.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
@class SubMenuListModel;

@interface OfficeEditeModel : NSObject
@property (copy,nonatomic) NSString *parentId;
@property (copy,nonatomic) NSString *menuName;
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *checkFlag;
@property (copy,nonatomic) NSString *code;
@property (strong,nonatomic) SubMenuListModel *subMenuList;


@end
