//
//  SubModel.m
//  ZhuNiuZhiHui
//
//  Created by ZhuNiu on 2017/5/23.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "SubModel.h"

@implementation SubModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"subMenuList" : @"SubModel1"
              };
}

@end

@implementation SubModel1
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"ID":@"id"
             };
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{ @"subMenuList" : @"SubModel2"
              };
}

@end

@implementation SubModel2


@end
