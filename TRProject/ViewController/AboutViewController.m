//
//  AboutViewController.m
//  TRProject
//
//  Created by Adrift on 16/3/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "AboutViewController.h"
#import "Factory.h"

@interface AboutViewController ()
@property (nonatomic) UIWebView *webView;
@end

@implementation AboutViewController


+ (AboutViewController *)shareVC{
    static AboutViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"关于我们";
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemForFirst:self];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://love.jingxuetao.com/about.html"]]];
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
