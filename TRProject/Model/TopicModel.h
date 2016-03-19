//
//  TopicModel.h
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TopicDataModel;
@interface TopicModel : NSObject

@property (nonatomic, assign) NSInteger result;

@property (nonatomic, strong) NSArray<TopicDataModel *> *data;

@property (nonatomic, copy) NSString *descript;

@end
@interface TopicDataModel : NSObject

@property (nonatomic, copy) NSString *topicName;

@property (nonatomic, assign) NSInteger showTopicName;

@property (nonatomic, assign) NSInteger topicId;

@property (nonatomic, copy) NSString *banner;

@end

