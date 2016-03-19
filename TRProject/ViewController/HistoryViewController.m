//
//  HistoryViewController.m
//  TRProject
//
//  Created by Adrift on 16/3/15.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HistoryViewController.h"
#import "OTableViewCell.h"
#import "TTableViewCell.h"
#import "NTableViewCell.h"
#import "DetailViewController.h"
#import "HealthModel.h"
#import "Factory.h"

@interface HistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic) UITableView *tableView;
@end

@implementation HistoryViewController

+ (HistoryViewController *)shareVC{
    static HistoryViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [self new];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"我的历史";
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addMenuItemToVC:self];
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITableView Delegate
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *vc = [DetailViewController new];
    HealthInfoDataModel *model = kAppdelegate.history[indexPath.row];
    vc.webURL = [NSURL URLWithString:model.newsUrl];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  kAppdelegate.history.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HealthInfoDataModel *model = kAppdelegate.history[indexPath.row];
    NSInteger count = model.attachment.count;
    if (count == 0) {
        count = 0;
    }else if(count == 1){
        count = 1;
    }else{
        count = 3;
    }
    NSArray *images = model.attachment;
    if (count==1) {
        OTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OTableViewCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        cell.title.text = model.title;
        [cell.attachMent setImageWithURL:images[0]];
        NSInteger count1 = model.replyCount;
        if (count1 >= 10000) {
            NSInteger tempCount = count1 / 10000.0;
            NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld万",tempCount];
            cell.replyCount.text = replyCount;
        }else{
            NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld",count1];
            cell.replyCount.text = replyCount;
        }
        
        NSInteger time = model.articleAddTime;
        NSLog(@"********%lu",time);
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //用[NSDate date]可以获取系统当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:date];
        cell.articleAddTime.text = currentDateStr;
        return cell;
    }else if(count == 3){
        TTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TTableViewCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        HealthInfoDataModel *model = kAppdelegate.history[row];
        cell.title.text = model.title;
        [cell.attachMent1 setImageWithURL:images[0]];
        [cell.attachMent2 setImageWithURL:images[1]];
        [cell.attachMent3 setImageWithURL:images[2]];
        NSInteger count1 = model.replyCount;
        if (count1 >= 10000) {
            NSInteger tempCount = count1 / 10000.0;
            NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld万",tempCount];
            cell.replyCount.text = replyCount;
        }else{
            NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld",count1];
            cell.replyCount.text = replyCount;
        }
        NSInteger time = model.articleAddTime;
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //用[NSDate date]可以获取系统当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:date];
        cell.articleAddTime.text = currentDateStr;        return cell;
    }else{
        NTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NTableViewCell" forIndexPath:indexPath];
        NSInteger row = indexPath.row;
        cell.title.text = model.title;
        NSInteger count1 = model.replyCount;
        if (count1 >= 10000) {
            NSInteger tempCount = count1 / 10000.0;
            NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld万",tempCount];
            cell.replyCount.text = replyCount;
        }else{
            NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld",count1];
            cell.replyCount.text = replyCount;
        }        NSInteger time = model.articleAddTime;
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //用[NSDate date]可以获取系统当前时间
        NSString *currentDateStr = [dateFormatter stringFromDate:date];
        cell.articleAddTime.text = currentDateStr;
        return cell;
    }
    return nil;
}


#pragma -mark 懒加载
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView registerNib:[UINib nibWithNibName:@"OTableViewCell" bundle:nil] forCellReuseIdentifier:@"OTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"TTableViewCell" bundle:nil] forCellReuseIdentifier:@"TTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"NTableViewCell" bundle:nil] forCellReuseIdentifier:@"NTableViewCell"];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.layoutMargins = UIEdgeInsetsZero;
        _tableView.preservesSuperviewLayoutMargins = NO;
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _tableView;
}
@end
