 //
//  UserInforManager.m
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import "UserInforManager.h"
#import "AFNetworking.h"
#import "JPPD.h"
#define kTimeOutInterval 8
@implementation UserInforManager

+(UserInforManager *)shareUserInforManager
{
    static UserInforManager *userInfoManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfoManager = [[UserInforManager alloc] init];
        //设置key值数组
    });
    return userInfoManager;

}

//重写初始化方法，保证初始化方法返回同一个地址
- (instancetype)init
{
    return self;
}
#pragma mark - 设置用户属性信息＊＊＊＊＊＊＊＊＊＊
- (void)setupUserPropertiesWithUserInfoDictionary:(id)dictionary
{
    NSLog(@"%@",dictionary);
    for (NSString *key in [dictionary allKeys]) {
        
        
        if ([key isEqualToString:@"hasLogined"]) {
            
        
        self.hasLogined = ([dictionary objectForKey:key]);
        
    }else if ([key isEqualToString:@"companyId"]){
        self.companyId = dictionary[key];
    }else if ([key isEqualToString:@"departmentId"]){
        self.departmentId = dictionary[key];
    }else if ([key isEqualToString:@"departmentName"]){
        self.departmentName = dictionary[key];
    }else if ([key isEqualToString:@"email"]){
        self.email = dictionary[key];
    }else if ([key isEqualToString:@"flag"]){
        self.flag = dictionary[key];
    }else if ([key isEqualToString:@"nickName"]){
        self.nickName = dictionary[key];
    }else if ([key isEqualToString:@"personId"]){
        self.personId = dictionary[key];
    }else if ([key isEqualToString:@"position"]){
        self.position = dictionary[key];
    }else if ([key isEqualToString:@"rongToKen"]){
        self.rongToKen = dictionary[key];
    }else if ([key isEqualToString:@"sex"]){
        self.sex = dictionary[key];
    }else if ([key isEqualToString:@"telephone"]){
        self.telephone = dictionary[key];
    }else if ([key isEqualToString:@"token"]){
        self.token = dictionary[key];
    }else if ([key isEqualToString:@"userCode"]){
        self.userCode = dictionary[key];
    }
    }

}
#pragma mark - 用户登录方法
- (void)loginWithAccount:(NSString *)account password:(NSString *)password completedBlock:(loginResultBlock)completedBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *url = @"http://192.168.1.188/mobile-web/mobile/login.do";
    NSDictionary *parm = @{@"loginName":account,
                           @"loginPassword":password,
                           @"deviceNumber":@"",
                           @"mobileType":@"1"};
    [manager POST:url parameters:parm progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //设置回调结果
        completedBlock(YES,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completedBlock(NO,nil,nil);
    }];

}
#pragma mark - 登出方法
- (void)logoutWithcompletedBlock:(LogoutResultBlock)completedBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    NSString *url = @"http://192.168.1.188/mobile-web/mobile/logout.do";
    NSDictionary *parm = @{@"token":@""};
    [manager POST:url parameters:parm progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //设置回调结果
        completedBlock(YES,responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completedBlock(NO,nil,nil);
    }];

}

#pragma mark - 本地数据持久化方法







@end
