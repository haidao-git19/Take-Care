//
//  HealthViewModel.h
//  TRProject
//
//  Created by tarena on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HealthModel.h"
#import "HealthNetManager.h"

typedef NS_ENUM(NSUInteger, RequestModel) {
    RequestModelRefresh,
    RequestModelMore,
};

@interface HealthViewModel : NSObject

@property (nonatomic) NSMutableArray *infoList;
@property (nonatomic) NSArray *bannerList;

@property (nonatomic) NSInteger infoListNumber;
@property (nonatomic) NSInteger bannerListNumber;

//头部滚动栏需要数据
- (HealthBannerlistDataModel *) bannerModelForIndex:(NSInteger)index;
- (NSURL *)bannerImageURLForIndex:(NSInteger)index;
- (NSString *)bannerTitleForIndex:(NSInteger) index;
- (NSURL *) bannerURLForIndex:(NSInteger) index;

//一张图片需要的数据
- (HealthInfoDataModel *) infoDataModelForRow:(NSInteger) row;

//首先得判断用哪个cell
- (NSInteger) hasManyImagesForRow:(NSInteger) row;


- (NSArray *)infoDataImageURLForRow:(NSInteger) row;
- (NSString *)infoDataTitleForRow:(NSInteger) row;
- (NSString *) infoDataReplyCountForRow:(NSInteger) row;
- (NSString *)infoDataArticleAddTimeForRow:(NSInteger) row;
- (NSURL *)infoDataURLForRow:(NSInteger) row;

- (void) getDataWithRequestModel:(RequestModel)requestModel completionHandler:(void (^)(NSError *error)) completionHandler;

@property (nonatomic) NSInteger categoryId;
@property (nonatomic) NSInteger addTime;

- (instancetype) initWithCategoryId:(NSInteger) categoryId;

@end
