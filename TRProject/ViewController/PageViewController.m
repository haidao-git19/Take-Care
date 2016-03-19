//
//  PageViewController.m
//  TRProject
//
//  Created by tarena on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"
#import "Factory.h"

@interface PageViewController ()

@end

@implementation PageViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"关照";
    [Factory addMenuItemToVC:self];
}

+ (PageViewController *) shareVC{
    static PageViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title= @"关照";
        
        vc.titleColorSelected = [UIColor orangeColor];
        vc.menuBGColor = [UIColor whiteColor];
        vc.menuViewStyle = WMMenuViewStyleLine;
        vc.navi.navigationBar.translucent = NO;
    });
    return  vc;
}

-(NSArray<NSString *> *)titles{
    return  @[@"首页",@"新闻",@"养生",@"美容",@"情感",@"饮食",@"失眠",@"心理",@"中医"];
}

-(NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController{
    return self.titles.count;
}

- (NSString *)menuView:(WMMenuView *)menu titleAtIndex:(NSInteger)index{
    return self.titles[index];
}

-(UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index{
    //0 1 2 18 10 15 11 5 8
    ViewController *vc = [[ViewController alloc] init];
    switch (index) {
        case 0:
        case 1:
        case 2:
            vc.categoryId = index;
            break;
        case 3:
            vc.categoryId = 18;
            break;
        case 4:
            vc.categoryId = 10;
            break;
        case 5:
            vc.categoryId = 15;
            break;
        case 6:
            vc.categoryId = 11;
            break;
        case 7:
            vc.categoryId = 5;
            break;
        case 8:
            vc.categoryId = 8;
            break;
        default:
            break;
    }
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
