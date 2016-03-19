//
//  ServiceViewController.m
//  TRProject
//
//  Created by Adrift on 16/3/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ServiceViewController.h"
#import "Factory.h"

@interface ServiceViewController ()
@property (nonatomic) UIWebView *webView;
@end

@implementation ServiceViewController

+ (ServiceViewController *)shareVC{
    static ServiceViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"服务条款";
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://love.jingxuetao.com/service.html"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UIWebView *)webView {
	if(_webView == nil) {
		_webView = [[UIWebView alloc] init];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _webView;
}

@end
