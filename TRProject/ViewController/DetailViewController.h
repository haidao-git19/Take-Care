//
//  DetailViewController.h
//  TRProject
//
//  Created by tarena on 16/3/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (nonatomic) NSURL *webURL;

- (instancetype) initWithURL:(NSURL *) webURL;


@end
