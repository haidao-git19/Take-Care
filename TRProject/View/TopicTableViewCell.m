//
//  TopicTableViewCell.m
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicTableViewCell.h"

@implementation TopicTableViewCell

- (void)awakeFromNib {
    // Initialization code
    [self banner];
    [self button];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

#pragma mark - 懒加载
- (UIImageView *)banner {
    if(_banner == nil) {
        _banner = [[UIImageView alloc] init];
        _banner.contentMode = UIViewContentModeScaleAspectFill;
        _banner.clipsToBounds = YES;
        [self addSubview:_banner];
        [_banner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(0);
            make.bottom.equalTo(0);
        }];
    }
    return _banner;
}

- (UIButton *)button {
    if(_button == nil) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.backgroundColor = [UIColor clearColor];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
    }
    return _button;
}
@end
