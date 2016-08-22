//
//  CrowNetManager.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseNetworking.h"
#import "CrowHomePageHeaderModel.h"
#import "CrowHomePageActivtyModel.h"
#import "CrowHomePageCookerModel.h"

@interface CrowNetManager : CrowBaseNetworking

/**
 *  首页
 */

// 头部广告
+ (id)postHomePageHeaderAdCompletionHandler:(void(^)(CrowHomePageHeaderModel *model, NSError *error))completionHandler;

// 头部活动
+ (id)postHomePageActivityCompletionHandler:(void(^)(CrowHomePageActivtyModel *model, NSError *error))completionHandler;

// 厨师内容
+ (id)postHomePageCookerDetailPage:(NSInteger)page CompletionHandler:(void(^)(CrowHomePageCookerModel *model, NSError *error))completionHandler;

@end
