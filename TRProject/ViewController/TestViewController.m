//
//  TestViewController.m
//  TRProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

+(TestViewController *)shareVC{
    static TestViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"测试";
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
