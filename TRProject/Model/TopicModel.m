//
//  TopicModel.m
//  TRProject
//
//  Created by tarena on 16/3/10.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [TopicDataModel class]};
}

+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"descript":@"description"};
}
@end
@implementation TopicDataModel

@end


