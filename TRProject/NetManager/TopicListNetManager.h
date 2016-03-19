//
//  TopicListNetManager.h
//  TRProject
//
//  Created by tarena on 16/3/11.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopicListNetManager : NSObject

+ (id) getTopicListWithTopicId:(NSInteger) topicId completionHanlder:(void (^)(id model,NSError *error)) completionHandler;

@end
