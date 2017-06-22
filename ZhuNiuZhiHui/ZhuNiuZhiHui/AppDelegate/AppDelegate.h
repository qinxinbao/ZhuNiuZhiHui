//
//  AppDelegate.h
//  ZhuNiuZhiHui
//
//  Created by 秦新宝 on 2017/5/16.
//  Copyright © 2017年 苏州筑牛科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

