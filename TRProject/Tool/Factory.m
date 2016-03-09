//
//  Factory.m
//  TRProject
//
//  Created by jiyingxin on 16/2/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "Factory.h"
#import <CommonCrypto/CommonDigest.h>
#import "PageViewController.h"

@implementation Factory
+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (void)addBackItemToVC:(UIViewController *)vc{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 50, 25);
    [btn setTitle:@"返回" forState:UIControlStateNormal];
    [btn bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor lightGrayColor];
    //把视图的边角变为圆形, cornerRadius圆角半径
    btn.layer.cornerRadius = 4;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //弹簧控件, 修复边距
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceItem.width = -15;
    vc.navigationItem.leftBarButtonItems = @[spaceItem,backItem];
}

+ (void) addBackItemForFirst:(UIViewController *)vc{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 25, 25);
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setImage:[UIImage imageNamed:@"icn_head_back_normal"] forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id sender) {
        
        PageViewController *vc = [PageViewController shareVC];
        [vc.sideMenuViewController setContentViewController:vc.navi animated:YES];
        [vc.sideMenuViewController hideMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item2.width = -10;
    vc.navigationItem.leftBarButtonItems = @[item2,item1];
}

+ (void) addBackItemForSecond:(UIViewController *)vc{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 25, 25);
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setImage:[UIImage imageNamed:@"icn_head_back_normal"] forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id sender) {
        [vc.navigationController popViewControllerAnimated:YES];
        //        PageViewController *vc = [PageViewController shareVC];
        //        [vc.sideMenuViewController setContentViewController:vc.navi animated:YES];
        //        [vc.sideMenuViewController hideMenuViewController];
    } forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:button];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item2.width = -10;
    vc.navigationItem.leftBarButtonItems = @[item2,item1];
}


@end
