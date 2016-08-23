//
//  CrowNetManager.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseNetworking.h"

/** 头部信息Model **/
#import "CrowHomePageHeaderModel.h"
#import "CrowHomePageActivtyModel.h"

/** 厨师列表Model **/
#import "CrowHomePageCookerModel.h"

/** 厨师详细信息Model **/
#import "CrowHomePageCookerFirstDetailModel.h"
#import "CrowHomePageCookerSecondDetailModel.h"
#import "CrowHomePageCookerThirdDetailModel.h"
#import "CrowHomePageCookerFourthlyDetailModel.h"

@interface CrowNetManager : CrowBaseNetworking

/** 首页 **/

// 头部广告
+ (id)postHomePageHeaderAdCompletionHandler:(void(^)(CrowHomePageHeaderModel *model, NSError *error))completionHandler;

// 头部活动
+ (id)postHomePageActivityCompletionHandler:(void(^)(CrowHomePageActivtyModel *model, NSError *error))completionHandler;

// 厨师列表信息
+ (id)postHomePageCookerDetailPage:(NSInteger)page CompletionHandler:(void(^)(CrowHomePageCookerModel *model, NSError *error))completionHandler;

// 厨师详情信息
+ (id)postCookerDetailFirstPartId:(NSInteger)ID compltionHandler:(void(^)(CrowHomePageCookerFirstDetailModel *model, NSError *error))completionHandler;
+ (id)postCookerDetailSecondPartId:(NSInteger)ID compltionHandler:(void(^)(CrowHomePageCookerSecondDetailModel *model, NSError *error))completionHandler;
+ (id)postCookerDetailThirdPartId:(NSInteger)ID compltionHandler:(void(^)(CrowHomePageCookerThirdDetailModel *model, NSError *error))completionHandler;
+ (id)postCookerDetailFourthlyPartId:(NSInteger)ID compltionHandler:(void(^)(CrowHomePageCookerFourthlyDetailModel *model, NSError *error))completionHandler;

@end
