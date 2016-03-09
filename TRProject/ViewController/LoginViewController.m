//
//  LoginViewController.m
//  TRProject
//
//  Created by Adrift on 16/3/5.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "Factory.h"

@interface LoginViewController ()
@property (nonatomic) UITextField *username;
@property (nonatomic) UITextField *password;
@property (nonatomic) UIButton *login;
@property (nonatomic) UIButton *regist;

@end

@implementation LoginViewController

+ (LoginViewController *)shareVC{
    static LoginViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.title = @"登录";
        vc.navigationController.navigationBar.translucent = NO;
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return vc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    UIBarButtonItem *item = [[UIBarButtonItem alloc] bk_initWithImage:[UIImage imageNamed:@"icon_drawerleft"] style:UIBarButtonItemStyleBordered handler:^(id sender) {
        
    }];
    self.navigationItem.leftBarButtonItem = item;
    self.view.backgroundColor = kRGBA(247, 247, 247, 1.0);
    [self username];
    [self password];
    [self login];
    [self regist];
    [Factory addBackItemForFirst:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - 懒加载
- (UITextField *)username {
	if(_username == nil) {
		_username = [[UITextField alloc] init];
        _username.placeholder = @"请输入手机号/邮箱/用户名";
        [self.view addSubview:_username];
        [_username mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(50);
            make.left.right.equalTo(30);
        }];
	}
	return _username;
}

- (UITextField *)password {
	if(_password == nil) {
		_password = [[UITextField alloc] init];
        _password.placeholder = @"请输入密码";
        _password.secureTextEntry = YES;
        [self.view addSubview:_password];
        [_password mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.username.mas_bottom).equalTo(15);
            make.left.right.equalTo(30);
        }];
	}
	return _password;
}

- (UIButton *)login {
	if(_login == nil) {
		_login = [UIButton buttonWithType:UIButtonTypeSystem];
        [_login setTitle:@"登陆" forState:UIControlStateNormal];
        [_login setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _login.backgroundColor = kRGBA(255, 122, 150, 1.0);
        [_login setTintColor:[UIColor blackColor]];
        [_login bk_addEventHandler:^(id sender) {
            
            if ([self.username.text isEqualToString:@""]) {
                [self.view showWarning:@"请输入用户名"];
                return ;
            }
            if ([self.password.text isEqualToString:@""]) {
                [self.view showWarning:@"请输入密码"];
                return;
            }
            
            MBProgressHUD *hub = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            [hub hide:YES afterDelay:2.0];
            
            [NSTimer bk_scheduledTimerWithTimeInterval:2.0 block:^(NSTimer *timer) {
                [self.view showWarning:@"用户名或密码错误,请重新输入"];
            } repeats:NO];
            
        } forControlEvents:UIControlEventTouchUpInside];
        _login.layer.cornerRadius = 5;
        [self.view addSubview:_login];
        [_login mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.password.mas_bottom).equalTo(50);
            make.left.equalTo(30);
            make.right.equalTo(self.view.mas_centerX).equalTo(-30);
        }];
	}
	return _login;
}

- (UIButton *)regist {
	if(_regist == nil) {
		_regist = [UIButton buttonWithType:UIButtonTypeSystem];
        [_regist setTitle:@"注册" forState:UIControlStateNormal];
        [_regist setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _regist.backgroundColor = kRGBA(255, 122, 150, 1.0);
        [_regist setTintColor:[UIColor blackColor]];
        [_regist bk_addEventHandler:^(id sender) {
            RegisterViewController *vc = [RegisterViewController new];
            [self.navi pushViewController:vc animated:YES];
        } forControlEvents:UIControlEventTouchUpInside];
        _regist.layer.cornerRadius = 5;
        [self.view addSubview:_regist];
        [_regist mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.password.mas_bottom).equalTo(50);
            make.right.equalTo(-30);
            make.left.equalTo(self.view.mas_centerX).equalTo(30);
        }];
	}
	return _regist;
}

@end
