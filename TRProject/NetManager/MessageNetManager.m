//
//  MessageNetManager.m
//  TRProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "MessageNetManager.h"

@implementation MessageNetManager

+ (void)sendMessageWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void (^)(NSString *,NSError *))completionHandler{
    NSMutableDictionary *param = [NSMutableDictionary new];
    [param setObject:phoneNumber forKey:@"phone"];
    [param setObject:@"864516020308748" forKey:@"device"];
    [param setObject:@"7d1890a3de82bbecfb8985b8e2145e861457502586" forKey:@"token"];

    [NSObject POST:kMessagePath parameters:param progress:nil completionHandler:^(id responseObj, NSError *error) {
            NSDictionary *tempDict = (NSDictionary *)responseObj;
            completionHandler(tempDict[@"description"],error);
    }];
}

@end
