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
#import <RESideMenu.h>
#import "LeftTableViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //全局默认配置
    [self setupGlobalConfig];
    [application setStatusBarStyle:UIStatusBarStyleLightContent];
    
    PageViewController *pageVC = [PageViewController shareVC];
    LeftTableViewController *leftVC = [LeftTableViewController shareVC];
    
    RESideMenu *menu = [[RESideMenu alloc] initWithContentViewController:pageVC.navi leftMenuViewController:leftVC rightMenuViewController:nil];
    pageVC.menuViewStyle = WMMenuViewStyleLine;
    
    menu.scaleContentView = NO;
    menu.panGestureEnabled = YES;
    menu.panGestureEnabled = YES;
    menu.panFromEdge = NO;
    menu.scaleMenuView= NO;
    self.window.rootViewController = menu;
    
    return YES;
}

- (void) showSlideMenu{
    
}
@end
