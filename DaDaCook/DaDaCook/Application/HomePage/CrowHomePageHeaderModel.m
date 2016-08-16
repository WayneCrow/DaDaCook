//
//  CrowHomePageHeaderModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageHeaderModel.h"

@implementation CrowHomePageHeaderModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [CrowHomePageHeaderDataModel class]};
}

@end


@implementation CrowHomePageHeaderDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list" : [CrowHomePageHeaderDataListModel class]};
}

@end


@implementation CrowHomePageHeaderDataListModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"focusId" : @"focus_id",
             @"jumpURL" : @"jump_url",
            @"imageURL" : @"imageURL",
                 @"des" : @"description",
             };
}

@end
