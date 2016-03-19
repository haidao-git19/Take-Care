//
//  TopicListNetManager.m
//  TRProject
//
//  Created by tarena on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicListNetManager.h"
#import "HealthPath.h"
#import "HealthModel.h"

@implementation TopicListNetManager

+ (id)getTopicListWithTopicId:(NSInteger)topicId completionHanlder:(void (^)(id, NSError *))completionHandler{
    
    NSMutableDictionary *param = [NSMutableDictionary new];
    [param setObject:@1 forKey:@"systemType"];
    [param setObject:@"7c73fb38de0ad1ce86d110aa494b40581456852761" forKey:@"token"];
    [param setObject:@(topicId) forKey:@"topicId"];
    [param setObject:@"" forKey:@"userId"];
    [param setObject:@0 forKey:@"sortType"];
    [param setObject:@50 forKey:@"pageSize"];
    [param setObject:@"864516020308748" forKey:@"device"];
    [param setObject:@(0) forKey:@"addTime"];
    return [NSObject POST:kHealthPath parameters:param progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([HealthModel parse:responseObj],error);
    }];
}
@end
