//
//  LeftTableViewController.m
//  TRProject
//
//  Created by tarena on 16/3/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LeftTableViewController.h"
#import "PageViewController.h"
#import "SuggestViewController.h"
#import "SettingTableViewController.h"
#import "TopicViewController.h"
#import "AboutViewController.h"
#import "ServiceViewController.h"
#import "HistoryViewController.h"

@interface LeftTableViewController ()

@end

@implementation LeftTableViewController

#pragma -mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
}

+ (instancetype)shareVC{
    static LeftTableViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LeftTableViewController"];
        vc.navi = [[UINavigationController alloc]initWithRootViewController:vc];
        vc.title = @"登陆";
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return vc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma -mark UITableViewDelegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    if (section == 0) {
        switch (row) {
            case 0:{

                break;
            }
            case 1:{
                PageViewController *vc = [PageViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi animated:YES];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
            case 2:{
                
                TopicViewController *vc = [TopicViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi animated:YES
                 ];
                [self.sideMenuViewController hideMenuViewController];

            }
            case 3:{
                HistoryViewController *vc = [HistoryViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
            case 4:{
                SuggestViewController *vc = [SuggestViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            default:
                break;
        }
    }else if(section == 1){
        switch (row) {
            case 0:{
                ServiceViewController *vc = [ServiceViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            case 1:{
            AboutViewController *vc = [AboutViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi animated:YES];
                [self.sideMenuViewController hideMenuViewController];
            }
                break;
            case 2:{
                [kAppdelegate.menu.view showWarning:@"已经更新到最新版本"];
            }
                break;
            default:
                break;
        }
    }
}
@end
