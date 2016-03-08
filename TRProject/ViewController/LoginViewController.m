//
//  LoginViewController.m
//  TRProject
//
//  Created by Adrift on 16/3/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

+ (LoginViewController *)shareVC{
    static LoginViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"LoginViewController"];
        vc.navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.title = @"登录";
        vc.navigationController.navigationBar.barTintColor = [UIColor brownColor];
    });
    return vc;
}

- (IBAction)login:(id)sender {
    NSLog(@"登录");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"afasdfsf");
    UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_drawerleft"] style:UIBarButtonItemStyleBordered handler:^(id sender) {
        [self.sideMenuViewController presentLeftMenuViewController];
    }];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end