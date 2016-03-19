//
//  SettingTableViewController.m
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "SettingTableViewController.h"
#import "Factory.h"

@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

+ (SettingTableViewController *)shareVC {
    static SettingTableViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SettingTableViewController"];
        vc.navi = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.title = @"设置";
        vc.navigationController.navigationBar.translucent = YES;
        vc.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    });
    return vc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [Factory addBackItemForFirst:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
