//
//  resultModel.h
//  JsonModel
//
//  Created by AK on 2017/5/23.
//  Copyright © 2017年 爱康富罗纳金融信息服务（上海）有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface resultModel : NSObject

@property (nonatomic , copy) NSString *ID;
@property (nonatomic , copy) NSString *menuName;
@property (nonatomic , copy) NSString *parentId;
@property (nonatomic , copy) NSString *checkFlag;
@property (nonatomic , copy) NSString *code;
// 因为字段都一样，所以这样用
@property (nonatomic , strong) NSMutableArray *subMenuList;


@end





