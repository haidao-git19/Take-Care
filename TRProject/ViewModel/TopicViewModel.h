//
//  TopicViewModel.h
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopicModel.h"
#import "NSObject+ViewModel.h"

@interface TopicViewModel : NSObject
@property (nonatomic) NSMutableArray *topicList;

@property (nonatomic) NSInteger topicNumber;

- (TopicDataModel *)modelForRow:(NSInteger) row;

- (NSURL *) bannerForRow:(NSInteger) row;
- (NSString *) topicName:(NSInteger) row;
- (NSInteger) topicId:(NSInteger) row;
- (NSInteger) showTopicName:(NSInteger) row;

- (NSInteger) categoryIdForRow:(NSInteger) row;

@property (nonatomic) NSInteger currentPage;

@end
