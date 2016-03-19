//
//  TopicViewController.m
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicViewModel.h"
#import "TopicTableViewCell.h"
#import "ViewController.h"
#import "Factory.h"

@interface TopicViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) TopicViewModel *viewModel;
@end

@implementation TopicViewController

+(TopicViewController *)shareVC{
    static TopicViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"专题";
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
        vc.navigationController.navigationBar.translucent = NO;
    });
    return vc;
}


#pragma mark - UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.topicNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TopicTableViewCell" forIndexPath:indexPath];
    NSInteger row = indexPath.row;
    [cell.banner setImageWithURL:[self.viewModel bannerForRow:row]];
    return cell;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[TopicTableViewCell class] forCellReuseIdentifier:@"TopicTableViewCell"];
        
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        WK(weakSelf);
        [_tableView addHeaderRefresh:^{
            [weakSelf.viewModel getDataWithRequestMode:RequestModeRefresh completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                }
                [weakSelf.tableView endHeaderRefresh];
            }];
        }];
        
        [_tableView addAutoFooterRefresh:^{
            [weakSelf.viewModel getDataWithRequestMode:RequestModeMore completionHanle:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView endRefreshingWithNoMoreData];
                }
            }];
        }];
	}
	return _tableView;
}

- (TopicViewModel *)viewModel {
	if(_viewModel == nil) {
		_viewModel = [[TopicViewModel alloc] init];
	}
	return _viewModel;
}

@end
