//
//  HealthModel.m
//  TRProject
//
//  Created by Adrift on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HealthModel.h"

@implementation HealthModel

+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"descript":@"description"};
}

@end


@implementation HealthDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"group" : [HealthGroupDataModel class], @"info" : [HealthInfoDataModel class], @"bannerList" : [HealthBannerlistDataModel class]};
}

@end


@implementation HealthGroupDataModel

@end


@implementation HealthInfoDataModel

@end


@implementation HealthBannerlistDataModel
+(NSDictionary *)replaceKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


