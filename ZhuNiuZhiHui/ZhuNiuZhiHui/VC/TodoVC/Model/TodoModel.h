//
//  TodoModel.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/19.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodoModel : NSObject

@property (copy,nonatomic) NSString *authType;
@property (copy,nonatomic) NSString *createTime;
@property (copy,nonatomic) NSString *date;
@property (copy,nonatomic) NSString *ID;
@property (copy,nonatomic) NSString *nickName;
@property (copy,nonatomic) NSString *nodeName;
@property (copy,nonatomic) NSString *reviewFlag;
@property (copy,nonatomic) NSString *reviewResult;
@property (copy,nonatomic) NSString *taskId;
@property (copy,nonatomic) NSString *title;
@property (copy,nonatomic) NSString *transferId;
@property (copy,nonatomic) NSString *type;

@end
