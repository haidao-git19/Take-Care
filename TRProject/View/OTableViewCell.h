//
//  OTableViewCell.h
//  TRProject
//
//  Created by tarena on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *articleAddTime;

@property (weak, nonatomic) IBOutlet UIImageView *attachMent;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;

@end
