//
//  ViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "HealthViewModel.h"
#import "HealthModel.h"
#import "OTableViewCell.h"
#import "TTableViewCell.h"
#import "NTableViewCell.h"
#import "DetailViewController.h"
#import "iCarousel.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) HealthViewModel *viewModel;
@property (nonatomic) iCarousel *ic;
@property (nonatomic) UIPageControl *pc;
@end

@implementation ViewController

#pragma mark - UITableView Delegate

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *vc = [DetailViewController new];
    vc.webURL = [self.viewModel infoDataURLForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark - UITableViewDataSource Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.viewModel.infoListNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger count = [self.viewModel hasManyImagesForRow:indexPath.row];
    NSArray *images = [self.viewModel infoDataImageURLForRow:indexPath.row];
    if (count==1) {
        OTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OTableViewCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        cell.title.text = [self.viewModel infoDataTitleForRow:row];
        [cell.attachMent setImageWithURL:images[0]];
        cell.replyCount.text = [self.viewModel infoDataReplyCountForRow:row];
        cell.articleAddTime.text = [self.viewModel infoDataArticleAddTimeForRow:row];
        return cell;
    }else if(count == 3){
        TTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TTableViewCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        cell.title.text = [self.viewModel infoDataTitleForRow:row];
        [cell.attachMent1 setImageWithURL:images[0]];
        [cell.attachMent2 setImageWithURL:images[1]];
        [cell.attachMent3 setImageWithURL:images[2]];
        cell.replyCount.text = [self.viewModel infoDataReplyCountForRow:row];
        cell.articleAddTime.text = [self.viewModel infoDataArticleAddTimeForRow:row];
        return cell;
    }else{
        NTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NTableViewCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        cell.title.text = [self.viewModel infoDataTitleForRow:row];
        cell.replyCount.text = [self.viewModel infoDataReplyCountForRow:row];
        cell.articleAddTime.text = [self.viewModel infoDataArticleAddTimeForRow:row];
        return cell;
    }
    return nil;
}

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 懒加载
- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView registerNib:[UINib nibWithNibName:@"OTableViewCell" bundle:nil] forCellReuseIdentifier:@"OTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"TTableViewCell" bundle:nil] forCellReuseIdentifier:@"TTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"NTableViewCell" bundle:nil] forCellReuseIdentifier:@"NTableViewCell"];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        WK(weakSelf);
        [_tableView addHeaderRefresh:^{
            [weakSelf.viewModel getDataWithRequestModel:RequestModelRefresh completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                }
                [weakSelf.tableView endHeaderRefresh];
            }];
        }];
        
        [_tableView addAutoFooterRefresh:^{
            [weakSelf.viewModel getDataWithRequestModel:RequestModelMore completionHandler:^(NSError *error) {
                if (!error) {
                    [weakSelf.tableView reloadData];
                }
                [weakSelf.tableView endFooterRefresh];
            }];
        }];
	}
	return _tableView;
}

- (HealthViewModel *)viewModel {
	if(_viewModel == nil) {
		_viewModel = [[HealthViewModel alloc] initWithCategoryId:_categoryId];
	}
	return _viewModel;
}

- (iCarousel *)ic {
	if(_ic == nil) {
		_ic = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenW, kScreenW * 370 / 750 + 30)];
        _ic.delegate = self;
        _ic.dataSource = self;
        
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor clearColor];
        label.font = [UIFont systemFontOfSize:14];
        [_ic addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(0);
            make.height.equalTo(30);
        }];
        
        _pc = [UIPageControl new];
        _pc.numberOfPages = [self.viewModel bannerListNumber];
        _pc.currentPageIndicatorTintColor = [UIColor orangeColor];
        _pc.pageIndicatorTintColor = [UIColor lightGrayColor];
        [_ic addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(0);
            make.bottom.equalTo(0);
        }];
        
        UIImageView *imageView = [UIImageView new];
        [_ic addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
	}
	return _ic;
}

@end
