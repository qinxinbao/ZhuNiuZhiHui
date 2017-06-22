//
//  NetWorkManager.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "NetWorkManager.h"
#import "AFNetworking.h"
#import "Macros.h"
#define kTimeOutInterval 8
@implementation NetWorkManager

+ (NetWorkManager *)shareNetworkManager
{
    static NetWorkManager *netWorkManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        netWorkManager = [[NetWorkManager alloc] init];
    });
    return netWorkManager;
}
//重写初始化方法
- (instancetype)init
{
    return self;
}

#pragma mark - 请求公共数据类
-(void)getDataFromUrlWithString:(NSString *)urlString parmeters:(NSDictionary *)parmeters compltedBlock:(NetworkRequestBlock)completedBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *url = [[kTextPublickURL stringByAppendingString:urlString] stringByAppendingString:@".do"];
//    NSDictionary *parm = [self ddAdditionalParameters:parameters];
    [manager POST:url parameters:parmeters progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //设置回调结果
        completedBlock(YES,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completedBlock(NO,nil,nil);
    }];
    
    
    
    
    
}



@end
