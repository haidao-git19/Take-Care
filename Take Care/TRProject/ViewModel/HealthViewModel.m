//
//  HealthViewModel.m
//  TRProject
//
//  Created by tarena on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HealthViewModel.h"

@implementation HealthViewModel


- (NSInteger)infoListNumber{
    return  self.infoList.count;
}

- (NSInteger)bannerListNumber{
    return  self.bannerList.count;
}

-(HealthBannerlistDataModel *)bannerModelForIndex:(NSInteger)index{
    return self.bannerList[index];
}

-(NSURL *)bannerImageURLForIndex:(NSInteger)index{
    return [NSURL URLWithString:[self bannerModelForIndex:index].imageUrl];
}

-(NSString *)bannerTitleForIndex:(NSInteger)index{
    return [self bannerModelForIndex:index].title;
}

- (NSURL *)bannerURLForIndex:(NSInteger)index{
    return  [NSURL URLWithString:[self bannerModelForIndex:index].url];
}

- (HealthInfoDataModel *)infoDataModelForRow:(NSInteger)row{
    return self.infoList[row];
}

- (NSInteger)hasManyImagesForRow:(NSInteger)row{
    NSInteger count = [self infoDataModelForRow:row].attachment.count;
    if (count == 0) {
        return 0;
    }else if(count == 1){
        return 1;
    }else{
        return 3;
    }
}

- (NSArray *)infoDataImageURLForRow:(NSInteger)row{
    return [self infoDataModelForRow:row].attachment;
}

-(NSString *)infoDataTitleForRow:(NSInteger)row{
    return  [self infoDataModelForRow:row].title;
}

- (NSString *)infoDataReplyCountForRow:(NSInteger)row{
    NSInteger count = [self infoDataModelForRow:row].replyCount;
    if (count >= 10000) {
        NSInteger tempCount = count / 10000.0;
        NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld万",tempCount];
        return replyCount;
    }else{
        NSString *replyCount = [NSString stringWithFormat:@"阅读 %ld",count];
        return replyCount;
    }
}

-(NSString *)infoDataArticleAddTimeForRow:(NSInteger)row{
    
    NSInteger time = [self infoDataModelForRow:row].articleAddTime;
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}

-(NSURL *)infoDataURLForRow:(NSInteger)row{
    return [NSURL URLWithString:[self infoDataModelForRow:row].newsUrl];
}

- (void) getDataWithRequestModel:(RequestModel)requestModel completionHandler:(void (^)(NSError *))completionHandler{
    switch (requestModel) {
        case RequestModelRefresh: {
            _addTime = 0;
            break;
        }
        case RequestModelMore: {
            break;
        }
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_addTime];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    NSLog(@"请求头:%@",currentDateStr);
    [HealthNetManager getHealthListWithCategoryId:_categoryId addTime:_addTime completionHandler:^(HealthModel *model, NSError *error) {
        if (!error) {
            if (requestModel == RequestModelRefresh) {
                [self.infoList removeAllObjects];
            }
            NSArray *arr = model.data.info;
            [self.infoList addObjectsFromArray:arr];
            NSLog(@"========================%ld===============",self.infoList.count);
            HealthInfoDataModel *model = self.infoList.lastObject;
            _addTime = model.articleAddTime;
            NSLog(@"%@",model.title);
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:_addTime];
            //实例化一个NSDateFormatter对象
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            //用[NSDate date]可以获取系统当前时间
            NSString *currentDateStr = [dateFormatter stringFromDate:date];
            NSLog(@"数据尾:%@",currentDateStr);
            completionHandler(error);
        }
    }];
}

-(instancetype)initWithCategoryId:(NSInteger)categoryId{
    if (self = [super init]) {
        _categoryId   = categoryId;
    }
    return self;
}

-(instancetype)init{
    NSAssert(NO, @"%s 请使用initWithCategoryId进行初始化,否则程序崩溃",__FUNCTION__);
    return nil;
}

- (NSMutableArray *)infoList {
    if(_infoList == nil) {
        _infoList = [[NSMutableArray alloc] init];
    }
    return _infoList;
}

- (NSArray *)bannerList {
    if(_bannerList == nil) {
        _bannerList = [[NSArray alloc] init];
    }
    return _bannerList;
}
@end
