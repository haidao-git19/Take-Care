//
//  TopicNetManager.m
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicNetManager.h"
#import "HealthPath.h"

@implementation TopicNetManager

+ (id)getTopicListWithPage:(NSInteger)page completionHanlder:(void (^)(TopicModel *, NSError *))completionHandler{
    
    NSMutableDictionary *dict = [NSMutableDictionary new];
    [dict setObject:@"1" forKey:@"systemType"];
    [dict setObject:@"9e9f2d5fed3cbca1dcbb444458a97fb11457603344&" forKey:@"token"];
    [dict setObject:@(page) forKey:@"curPage"];
    [dict setObject:@"155542738&" forKey:@"userId"];
    [dict setObject:@"50" forKey:@"pageSize"];
    [dict setObject:@"864516020308748" forKey:@"device"];
    
    return [NSObject POST:kTopicPath parameters:dict progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([TopicModel parse:responseObj],error);
    }];
}

@end
