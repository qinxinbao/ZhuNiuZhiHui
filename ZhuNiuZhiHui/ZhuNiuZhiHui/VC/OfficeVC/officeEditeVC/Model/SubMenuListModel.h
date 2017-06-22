//
//  SubMenuListModel.h
//  ZhuNiuZhiHui
//
//  Created by ZhuNiu on 2017/5/23.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubMenuListModel : NSObject
@property (copy,nonatomic) NSString *checkFlag;
@property (copy,nonatomic) NSString *code;
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *menuName;
@property (copy,nonatomic) NSString *parentId;
@property (strong,nonatomic) NSMutableArray *subMenuList;

@end
