//
//  DetailViewController.m
//  TRProject
//
//  Created by tarena on 16/3/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIWebViewDelegate>
@property (nonatomic) UIWebView *webView;
@end

@implementation DetailViewController

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"err %@", error);
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

#pragma mark - UIWebViewDelegate Delegate

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];

    //左上角添加自定义返回按钮
    [Factory addBackItemToVC:self];
    
    //判断网络状态
    if (!kAppdelegate.isOnLine) {
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"无网络,稍后再试";
        [hud hide:YES afterDelay:1.5];
        return;
    }
    [self.webView loadRequest:[NSURLRequest requestWithURL:_webURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 懒加载
- (instancetype)initWithURL:(NSURL *)webURL{
    if (self = [super init]) {
        _webURL = webURL;
    }
    return self;
}

- (UIWebView *)webView {
	if(_webView == nil) {
		_webView = [[UIWebView alloc] init];
        [self.view addSubview:_webView];
        _webView.delegate = self;
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
	}
	return _webView;
}

@end
