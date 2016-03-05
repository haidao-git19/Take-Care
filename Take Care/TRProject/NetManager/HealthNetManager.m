//
//  HealthNetManager.m
//  TRProject
//
//  Created by Adrift on 16/3/2.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HealthNetManager.h"

@implementation HealthNetManager
+ (id)getHealthListWithCategoryId:(NSInteger)categoryId addTime:(NSInteger)addTime completionHandler:(void (^)(id, NSError *))completionHandler{
    NSMutableDictionary *param = [NSMutableDictionary new];
    [param setObject:@1 forKey:@"systemType"];
    [param setObject:@"7c73fb38de0ad1ce86d110aa494b40581456852761" forKey:@"token"];
    [param setObject:@(categoryId) forKey:@"categoryId"];
    [param setObject:@"" forKey:@"userId"];
    [param setObject:@0 forKey:@"sortType"];
    [param setObject:@50 forKey:@"pageSize"];
    [param setObject:@"864516020308748" forKey:@"device"];
    [param setObject:@(1443724727) forKey:@"addTime"];
    
    NSLog(@"param----->%@",param);
    
    NSLog(@"网络请求层,请求头:%@",@(addTime));
    
    return [NSObject POST:kHealthPath parameters:param progress:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandler([HealthModel parse:responseObj],error);
    }];
}
@end
