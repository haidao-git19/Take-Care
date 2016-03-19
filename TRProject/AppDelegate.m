//
//  AppDelegate.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+System.h"
#import "HealthNetManager.h"
#import "MessageNetManager.h"
#import "LeftTableViewController.h"
#import "LeftTableViewController.h"
#import "TopicListNetManager.h"

#define kAppKey @"56e00d5de0f55aeb4a000f47"

@interface AppDelegate ()
@end

@implementation AppDelegate

//Appkey: 56e00d5de0f55aeb4a000f47

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window= [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //全局默认配置
    [self setupGlobalConfig];
    
    //0 1 2 18 10 15 11 5 8
//    [HealthNetManager getHealthListWithCategoryId:0 addTime:1443403027 completionHandler:^(id model, NSError *error) {
//        
//        NSLog(@"asssdsdsdsdsd");
//        
//    }];
    
//    return YES;
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    PageViewController *pageVC = [PageViewController shareVC];
    LeftTableViewController *leftVC = [LeftTableViewController shareVC];
    
    _menu = [[RESideMenu alloc] initWithContentViewController:pageVC.navi leftMenuViewController:leftVC rightMenuViewController:nil];
    pageVC.menuViewStyle = WMMenuViewStyleLine;
    
    _menu.scaleContentView = NO;
    _menu.panGestureEnabled = YES;
    _menu.panGestureEnabled = YES;
    _menu.panFromEdge = NO;
    _menu.scaleMenuView= NO;
    self.window.rootViewController = _menu;
    [self.window makeKeyAndVisible];
    
    return YES;
}
-(NSMutableArray *)history {
    if(_history == nil) {
        _history = [[NSMutableArray alloc] init];
    }
    return _history;
}
@end
