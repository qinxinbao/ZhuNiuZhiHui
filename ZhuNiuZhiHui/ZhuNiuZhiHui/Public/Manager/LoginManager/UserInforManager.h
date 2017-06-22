//
//  UserInforManager.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/17.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
//登陆结果的回调block
typedef void(^loginResultBlock)(BOOL isSuccess,id responseObject,NSError *error);
//注销结果的回调block
typedef void(^LogoutResultBlock)(BOOL isSuccess,id responseObject,NSError *error);

@interface UserInforManager : NSObject

@property (assign,nonatomic) BOOL hasLogined;//记录登录状态
@property (copy,nonatomic) NSString *account;
@property (copy,nonatomic) NSString *password;

//能从服务器上拿到的数据
@property (copy,nonatomic) NSString *companyId;
@property (copy,nonatomic) NSString *departmentId;
@property (copy,nonatomic) NSString *departmentName;
@property (copy,nonatomic) NSString *email;
@property (copy,nonatomic) NSString *flag;//特殊权限
@property (copy,nonatomic) NSString *userId;//网络请求下来的id字段
@property (copy,nonatomic) NSString *nickName;
@property (copy,nonatomic) NSString *personId;
@property (copy,nonatomic) NSString *position;
@property (copy,nonatomic) NSString *rongToKen;
@property (copy,nonatomic) NSString *sex;
@property (copy,nonatomic) NSString *telephone;
@property (copy,nonatomic) NSString *token;
@property (copy,nonatomic) NSString *userCode;

+(UserInforManager *)shareUserInforManager;
//设置用户登录信息
- (void)setupUserPropertiesWithUserInfoDictionary:dictionary;
//用户登录方法
- (void)loginWithAccount:(NSString *)account password:(NSString *)password completedBlock:(loginResultBlock)completedBlock;

//用户注销方法
- (void)logoutWithcompletedBlock:(LogoutResultBlock)completedBlock;


@end
