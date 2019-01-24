//
//  AppDelegate.m
//  FuelSavingAssistant
//
//  Created by 单方良 on 2019/1/10.
//  Copyright © 2019年 Aero. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeFlyViewController.h"
#import "studyViewController.h"
#import "communityViewController.h"
#import "myViewController.h"
#import "DemoMeController.h"
#import <BaiduMapAPI_Base/BMKBaseComponent.h>//引入base相关所有的头文件

@interface AppDelegate ()
@property (nonatomic, strong) BMKMapManager *mapManager; //主引擎类
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    // 要使用百度地图，请先启动BaiduMapManager
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    // 如果要关注网络及授权验证事件，请设定generalDelegate参数
    BOOL ret = [_mapManager start:@"jkZxKK2iRYqCanGV4YPbcjOZuLlwmERL"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    //设置为GCJ02坐标
    [BMKMapManager setCoordinateTypeUsedInBaiduMapSDK: BMK_COORDTYPE_COMMON];
    [self setupViewControllers];
    
    self.window.rootViewController = self.tabBarController;
    return YES;
}

- (void)setupViewControllers {
    UINavigationController *navi0 = [HomeFlyViewController defaultHomeFlyNavi];
    navi0.navigationBar.hidden = YES;
    UINavigationController *navi1 = [studyViewController defaultStudyNavi];
    UINavigationController *navi2 = [communityViewController defaultCommunityNavi];
    UINavigationController *vc3 = [DemoMeController defaultMyNavi];
    CYLTabBarController *tbc = [CYLTabBarController new];
    [self customTabBarForController:tbc];
    [tbc setViewControllers:@[navi0,navi1,navi2,vc3]];
    self.tabBarController = tbc;
    
}

- (void)customTabBarForController:(CYLTabBarController *)tbc {
    NSDictionary *dict0 = @{CYLTabBarItemTitle:@"首页",
                            CYLTabBarItemImage:@"tabbar_home_icon_unselect",
                            CYLTabBarItemSelectedImage:@"tabbar_home_icon_select"};
    NSDictionary *dict1 = @{CYLTabBarItemTitle:@"学习",
                            CYLTabBarItemImage:@"tabbar_GPC_icon_unselect",
                            CYLTabBarItemSelectedImage:@"tabbar_GPC_icon_select"};
    NSDictionary *dict2 = @{CYLTabBarItemTitle:@"社区",
                            CYLTabBarItemImage:@"tabbar_destination_icon_unselect",
                            CYLTabBarItemSelectedImage:@"tabbar_destination_icon_select"};
    NSDictionary *dict3 = @{CYLTabBarItemTitle:@"我的",
                            CYLTabBarItemImage:@"tabbar_aboutMe_icon_unselect",
                            CYLTabBarItemSelectedImage:@"tabbar_aboutMe_icon_select"};
    NSArray *tabBarItemsAttributes = @[dict0,dict1,dict2,dict3];
    tbc.tabBarItemsAttributes = tabBarItemsAttributes;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
