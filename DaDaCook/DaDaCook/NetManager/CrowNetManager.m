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
    
    return [self POST:kHomePageHeaderPath parmenters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageHeaderModel parse:responseObj], error);
    }];
}

// 头部活动
+ (id)postHomePageActivityCompletionHandler:(void (^)(CrowHomePageActivtyModel *, NSError *))completionHandler {
    
    return [self POST:kHomePageActivityPath parmenters:nil completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageActivtyModel parse:responseObj], error);
    }];
}

// 厨师信息
+ (id)postHomePageCookerDetailPage:(NSInteger)page CompletionHandler:(void (^)(CrowHomePageCookerModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:[NSString stringWithFormat:@"%ld", page] forKey:@"page"];
    [dic setObject:@"radius" forKey:@5000];
    
    return [self POST:kHomePageCookerPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageCookerModel parse:responseObj], error);
    }];
}

@end
