//
//  SuggestViewController.m
//  TRProject
//
//  Created by Adrift on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SuggestViewController.h"
#import "Factory.h"

@interface SuggestViewController ()
@property (nonatomic) UITextField  *textField;
@property (nonatomic) UITextField *phone;
@property (nonatomic) UILabel *label;
@end

@implementation SuggestViewController

+ (SuggestViewController *)shareVC{
    static SuggestViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.title = @"意见反馈";
        vc.navigationController.navigationBar.translucent = NO;
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return vc;
}

#pragma -mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kRGBA(237, 237, 237, 1.0);
    [Factory addBackItemForFirst:self];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(0, 0, 40, 30);
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button bk_addEventHandler:^(id sender) {
        if ([self.textField.text isEqualToString:@""]) {
            [self.view showWarning:@"请填写意见之后再发送,谢谢配合"];
            return ;
        }
        [NSTimer bk_scheduledTimerWithTimeInterval:2.0 block:^(NSTimer *timer) {
            [self.view showWarning:@"非常感谢您提供给我们的宝贵意见!"];
        } repeats:NO];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item2.width = -15;
    self.navigationItem.rightBarButtonItems = @[item2,item1];
    [self textField];
    [self phone];
    [self label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma -mark 懒加载

- (UITextField  *)textField {
    if(_textField == nil) {
        _textField = [[UITextField  alloc] init];
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.placeholder = @"求意见,给个机会我们为您改进吧.";
        [self.view addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(50);
            make.left.equalTo(30);
            make.right.equalTo(-30);
        }];
    }
    return _textField;
}

- (UITextField *)phone {
	if(_phone == nil) {
		_phone = [[UITextField alloc] init];
        _phone.borderStyle = UITextBorderStyleRoundedRect;
        _phone.placeholder = @"请填写手机号";
        [self.view addSubview:_phone];
        [_phone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.textField.mas_bottom).equalTo(30);
            make.left.equalTo(30);
            make.right.equalTo(-30);
        }];
	}
	return _phone;
}
- (UILabel *)label {
	if(_label == nil) {
		_label = [[UILabel alloc] init];
        _label.text = @"选填,以便我们回复(只有工作人员看到)";
        _label.font = [UIFont systemFontOfSize:14];
        _label.textColor = kRGBA(185, 185, 191, 1.0);
        [self.view addSubview:_label];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.top.equalTo(self.phone.mas_bottom).equalTo(10);
        }];
	}
	return _label;
}

@end
