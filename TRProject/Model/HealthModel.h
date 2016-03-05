//
//  HealthModel.h
//  TRProject
//
//  Created by Adrift on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HealthDataModel,HealthGroupDataModel,HealthInfoDataModel,HealthBannerlistDataModel;
@interface HealthModel : NSObject

@property (nonatomic, assign) NSInteger result;

@property (nonatomic, strong) HealthDataModel *data;

@property (nonatomic, copy) NSString *descript;

@end

@interface HealthDataModel : NSObject

@property (nonatomic, strong) NSArray<HealthGroupDataModel *> *group;

@property (nonatomic, strong) NSArray<HealthInfoDataModel *> *info;

@property (nonatomic, strong) NSArray<HealthBannerlistDataModel *> *bannerList;

@property (nonatomic, copy) NSString *banner;

@end

@interface HealthGroupDataModel : NSObject

@property (nonatomic, assign) NSInteger groupId;

@property (nonatomic, copy) NSString *groupImage;

@property (nonatomic, copy) NSString *groupName;

@property (nonatomic, copy) NSString *groupLeader;

@end

@interface HealthInfoDataModel : NSObject

@property (nonatomic, assign) NSInteger articleId;

@property (nonatomic, assign) NSInteger articleAddTime;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, strong) NSArray *tags;

@property (nonatomic, assign) NSInteger favicons;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger topicId;

@property (nonatomic, assign) NSInteger tips;

@property (nonatomic, copy) NSString *banner;

@property (nonatomic, strong) NSArray<NSString *> *attachment;

@property (nonatomic, assign) NSInteger postId;

@property (nonatomic, assign) NSInteger showTopicName;

@property (nonatomic, copy) NSString *newsUrl;

@property (nonatomic, assign) NSInteger replyCount;

@property (nonatomic, copy) NSString *content;

@end

@interface HealthBannerlistDataModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *shareContent;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *url;

@end

