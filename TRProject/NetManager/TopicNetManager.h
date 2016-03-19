//
//  TopicNetManager.h
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopicModel.h"

@interface TopicNetManager : NSObject

+ (id) getTopicListWithPage:(NSInteger) page completionHanlder:(void (^)(TopicModel *model,NSError *error)) completionHandler;

@end
