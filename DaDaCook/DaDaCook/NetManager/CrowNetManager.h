//
//  CrowNetManager.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseNetworking.h"
#import "CrowHomePageHeaderModel.h"

@interface CrowNetManager : CrowBaseNetworking

/**
 *  首页
 */

// 头部广告
+ (id)postHomePageHeaderAdCompletionHandler:(void(^)(CrowHomePageHeaderModel *model, NSError *error))completionHandler;

@end
