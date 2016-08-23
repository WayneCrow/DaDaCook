//
//  CrowNetManager.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowNetManager.h"

@implementation CrowNetManager

/** 首页 **/

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

// 厨师列表信息
+ (id)postHomePageCookerDetailPage:(NSInteger)page CompletionHandler:(void (^)(CrowHomePageCookerModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:[NSString stringWithFormat:@"%ld", page] forKey:@"page"];
    [dic setObject:@"radius" forKey:@5000];
    
    return [self POST:kHomePageCookerPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageCookerModel parse:responseObj], error);
    }];
}

// 厨师详情信息
+ (id)postCookerDetailFirstPartId:(NSInteger)ID compltionHandler:(void (^)(CrowHomePageCookerFirstDetailModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:[NSString stringWithFormat:@"%ld", ID] forKey:@"kitchen_id"];
    
    return [self POST:kCookerFirstPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageCookerFirstDetailModel parse:responseObj], error);
    }];
}

+ (id)postCookerDetailSecondPartId:(NSInteger)ID compltionHandler:(void (^)(CrowHomePageCookerSecondDetailModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:[NSString stringWithFormat:@"%ld", ID] forKey:@"kitchen_id"];
    
    return [self POST:kCookerSecondPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageCookerSecondDetailModel parse:responseObj], error);
    }];
}

+ (id)postCookerDetailThirdPartId:(NSInteger)ID compltionHandler:(void (^)(CrowHomePageCookerThirdDetailModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:[NSString stringWithFormat:@"%ld", ID] forKey:@"kitchen_id"];
    
    return [self POST:kCookerThirdyPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageCookerThirdDetailModel parse:responseObj], error);
    }];
}

+ (id)postCookerDetailFourthlyPartId:(NSInteger)ID compltionHandler:(void (^)(CrowHomePageCookerFourthlyDetailModel *, NSError *))completionHandler {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:[NSString stringWithFormat:@"%ld", ID] forKey:@"kitchen_id"];
    
    return [self POST:kCookerFourthPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageCookerFourthlyDetailModel parse:responseObj], error);
    }];
}

@end
