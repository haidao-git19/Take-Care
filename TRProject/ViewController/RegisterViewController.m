//
//  RegisterViewController.m
//  TRProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RegisterViewController.h"
#import "MessageNetManager.h"
#import "Factory.h"

@interface RegisterViewController ()
@property (nonatomic) UITextField *phone;
@property (nonatomic) UITextField *code;
@property (nonatomic) UITextField *password;
@property (nonatomic) UIButton *getCode;
@property (nonatomic) UIButton *regist;
@end

@implementation RegisterViewController

-(instancetype)init{
    if (self = [super init]) {
        self.title = @"注册";
        self.navigationController.navigationBar.translucent = NO;
        self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemForSecond:self];
    self.view.backgroundColor = kRGBA(247, 247, 247, 1.0);
    [self phone];
    [self getCode];
    [self code];
    [self password];
    [self regist];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


#pragma mark - 懒加载
- (UITextField *)phone {
	if(_phone == nil) {
		_phone = [[UITextField alloc] init];
        _phone.placeholder = @"请输入手机号";
        [self.view addSubview:_phone];
        [_phone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(50);
            make.left.right.equalTo(30);
        }];
	}
	return _phone;
}

- (UITextField *)code {
	if(_code == nil) {
		_code = [[UITextField alloc] init];
        _code.placeholder = @"请输入验证码";
        [self.view addSubview:_code];
        [_code mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phone.mas_bottom).equalTo(30);
            make.left.equalTo(30);
            make.right.equalTo(self.getCode.mas_left).equalTo(-30);
        }];
	}
	return _code;
}

- (UIButton *)getCode {
    if(_getCode == nil) {
        _getCode = [UIButton buttonWithType:UIButtonTypeSystem];
        _getCode.backgroundColor = [UIColor redColor];
        [_getCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_getCode setTitle:@"获取验证码" forState:UIControlStateNormal];
        _getCode.layer.cornerRadius = 5;
        _getCode.backgroundColor = kRGBA(255, 122, 150, 1.0);
        [_getCode bk_addEventHandler:^(id sender) {
            
            if (self.phone.text.length < 11) {
                [self.view showWarning:@"请输入正确的手机号"];
                return ;
            }
            
            [[NSOperationQueue new] addOperationWithBlock:^{
                [MessageNetManager sendMessageWithPhoneNumber:self.phone.text completionHandler:^(NSString *description, NSError *error) {
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        [self.view showWarning:description];
                    }];
                }];
            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_getCode];
        [_getCode mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(-30);
            make.top.equalTo(self.phone.mas_bottom).equalTo(30);
            make.width.equalTo(100);
        }];
    }
    return _getCode;
}


- (UITextField *)password {
	if(_password == nil) {
		_password = [[UITextField alloc] init];
        _password.secureTextEntry = YES;
        _password.placeholder = @"请输入密码";
        [self.view addSubview:_password];
        [_password mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(30);
            make.top.equalTo(self.code.mas_bottom).equalTo(30);
        }];
	}
	return _password;
}
- (UIButton *)regist {
	if(_regist == nil) {
		_regist = [UIButton buttonWithType:UIButtonTypeSystem];
        [_regist setTitle:@"注册" forState:UIControlStateNormal];
        [_regist setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _regist.backgroundColor = kRGBA(255, 122, 150, 1.0);
        _regist.layer.cornerRadius = 5;
        [self.view addSubview:_regist];
        [_regist mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.password.mas_bottom).equalTo(50);
            make.left.equalTo(30);
            make.right.equalTo(-30);
        }];
        [_regist bk_addEventHandler:^(id sender) {

            if (self.phone.text.length < 11||self.code.text.length < 6) {
                [self.view showWarning:@"手机号或者验证码格式不正确"];
                return ;
            }
            [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
                [self.view showWarning:@"验证码填写不正确"];
            } repeats:NO];
        } forControlEvents:UIControlEventTouchUpInside];
	}
	return _regist;
}

@end
