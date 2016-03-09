//
//  MessageNetManager.h
//  TRProject
//
//  Created by tarena on 16/3/9.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HealthPath.h"

@interface MessageNetManager : NSObject
+ (void) sendMessageWithPhoneNumber:(NSString *)phoneNumber completionHandler:(void (^)(NSString *description,NSError *error))completionHandler;;
@end
