//
//  NetWorkManager.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^NetworkRequestBlock)(BOOL isSuccess,id responseObject,NSError *error);
@interface NetWorkManager : NSObject

+(NetWorkManager *)shareNetworkManager;
//公共请求数据方法
- (void)getDataFromUrlWithString:(NSString *)urlString parmeters:(NSDictionary *)parmeters compltedBlock:(NetworkRequestBlock)completedBlock;



@end
