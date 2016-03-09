//
//  LeftTableViewController.m
//  TRProject
//
//  Created by tarena on 16/3/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LeftTableViewController.h"
#import "LoginViewController.h"
#import "PageViewController.h"
#import "TestViewController.h"
#import "LoginViewController.h"
#import "UMSocial.h"

@interface LeftTableViewController () <UMSocialUIDelegate>

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
    NSLog(@"*********%ld*******%ld",section,row);
    if (section == 0) {
        switch (row) {
            case 0:{
                LoginViewController *vc = [LoginViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
            case 1:{
                PageViewController *vc = [PageViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi animated:YES];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
            case 2:{
            }
                //热门专题
                break;
            case 3:{
                LoginViewController *vc = [LoginViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
            case 4:{
                LoginViewController *vc = [LoginViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi];
                [self.sideMenuViewController hideMenuViewController];

            }
                break;
            case 5:{
                LoginViewController *vc = [LoginViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
                break;
            case 6:{
                LoginViewController *vc = [LoginViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
            default:
                break;
        }
    }else{
        switch (row) {
            case 0:
                [UMSocialSnsService presentSnsIconSheetView:kAppdelegate.window.rootViewController.view
                                                     appKey:@"56e00d5de0f55aeb4a000f47"
                                                  shareText:@"我正在使用手机App[关照],推荐给你"
                                                 shareImage:[UIImage imageNamed:@"ic_launcher.png"]
                                            shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQQ,nil]
                                                   delegate:self];
                break;
            case 1:
                
                break;
            case 2:
                
                break;
            case 3:
                
                break;
                
            default:
                break;
        }
    }
}
@end
