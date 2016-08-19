//
//  CrowNetManager.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowNetManager.h"

@implementation CrowNetManager

/**
 *  首页
 */

// 头部广告
+ (id)postHomePageHeaderAdCompletionHandler:(void (^)(CrowHomePageHeaderModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    kParmentersWith(dic)
    
    return [self POST:kHomePageHeaderPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageHeaderModel parse:responseObj], error);
    }];
}

// 头部活动
+ (id)postHomePageActivityCompletionHandler:(void (^)(CrowHomePageActivtyModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    kParmenters(dic)
    
    return [self POST:kHomePageActivityPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageActivtyModel parse:responseObj], error);
    }];
}

@end
