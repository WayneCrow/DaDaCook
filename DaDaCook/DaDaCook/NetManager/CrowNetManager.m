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
    
    NSDictionary *dic = @{
                          @"_cityid" : @"110100",
                          @"_device" : @"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3",
                            @"_idfa" : @"91577D73-DDF9-4151-BB86-AA3596963582",
                       @"_osversion" : @"10.0",
                        @"_platform" : @"iOS",
                          @"_screen" : @"375*667",
                            @"_time" : @"2016-08-16 08:20:50",
                         @"_version" : @"2.9.1",
                       @"coordinate" : @"116.469235297309,39.88134792751736",
                             @"type" : @"0",
                  @"user_coordinate" : @"116.469235297309,39.88134792751736",
                          };
    
    return [self POST:kHomePageHeaderPath parmenters:dic completionHandler:^(id responseObj, NSError *error) {
        !completionHandler ?: completionHandler([CrowHomePageHeaderModel parse:responseObj], error);
    }];
}


@end
