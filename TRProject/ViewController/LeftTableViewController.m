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

@interface LeftTableViewController ()

@end

@implementation LeftTableViewController

#pragma -mark 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
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
            case 1:{
                PageViewController *vc = [PageViewController shareVC];
//                [self.sideMenuViewController setContentViewController:vc.navi];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
            
            case 2:
                //热门专题
                break;
            case 3:{
                LoginViewController *vc = [LoginViewController shareVC];
                [self.sideMenuViewController setContentViewController:vc.navi];
                [self.sideMenuViewController hideMenuViewController];
                break;
            }
             case 4:
                
                break;
            case 5:
                
                break;
            case 6:
                
                break;
            default:
                break;
        }
    }else{
        switch (row) {
            case 0:
                
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
