//
//  TopicViewModel.m
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicViewModel.h"
#import "TopicNetManager.h"

@implementation TopicViewModel

- (NSInteger)topicNumber{
    
    NSLog(@"topicNumber:***********%ld",self.topicList.count);
    return self.topicList.count;
}

- (TopicDataModel *)modelForRow:(NSInteger)row{
    return self.topicList[row];
}

- (NSURL *)bannerForRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelForRow:row].banner];
}

- (NSString *)topicName:(NSInteger)row{
    return [self modelForRow:row].topicName;
}

- (NSInteger)topicId:(NSInteger)row{
    return [self modelForRow:row].topicId;
}

- (NSInteger)showTopicName:(NSInteger)row{
    return [self modelForRow:row].showTopicName;
}

- (NSInteger)categoryIdForRow:(NSInteger)row{
    return [self modelForRow:row].topicId;
}


-(void)getDataWithRequestMode:(RequestMode)requestMode completionHanle:(void (^)(NSError *error))completionHandle{
    NSInteger tempPage = 1;
    switch (requestMode) {
        case RequestModeRefresh: {
            tempPage = 1;
            break;
        }
        case RequestModeMore: {
            tempPage = _currentPage + 1;
            break;
        }
    }
    [TopicNetManager getTopicListWithPage:tempPage completionHanlder:^(TopicModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.topicList removeAllObjects];
            }
            [self.topicList addObjectsFromArray:model.data];
            _currentPage = tempPage;
        }
        completionHandle(error);
    }];
}

#pragma mark - 懒加载
- (NSMutableArray *)topicList {
    if(_topicList == nil) {
        _topicList = [[NSMutableArray alloc] init];
    }
    return _topicList;
}

@end
