//
//  NTableViewCell.h
//  TRProject
//
//  Created by Adrift on 16/3/3.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *articleAddTime;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;

@end
