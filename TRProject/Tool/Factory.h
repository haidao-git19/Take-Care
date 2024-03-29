//
//  Factory.h
//  TRProject
//
//  Created by jiyingxin on 16/2/17.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Factory : NSObject
+ (void)addBackItemToVC:(UIViewController *)vc;
+ (NSString *)md5:(NSString *)str;

+ (void) addBackItemForSecond:(UIViewController *)vc;
+ (void) addBackItemForFirst:(UIViewController *)vc;
+ (void) addMenuItemToVC:(UIViewController *)vc;
@end
