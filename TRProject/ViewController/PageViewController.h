//
//  PageViewController.h
//  TRProject
//
//  Created by tarena on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "WMPageController.h"

@interface PageViewController : WMPageController

@property (nonatomic) UINavigationController *navi;

+ (PageViewController *)shareVC;

@end
