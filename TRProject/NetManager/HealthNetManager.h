//
//  HealthNetManager.h
//  TRProject
//
//  Created by Adrift on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HealthPath.h"
#import "HealthModel.h"

@interface HealthNetManager : NSObject

+ (id)getHealthListWithCategoryId:(NSInteger)categoryId addTime:(NSInteger)addTime completionHandler:kCompetionHandlerBlock;
@end
