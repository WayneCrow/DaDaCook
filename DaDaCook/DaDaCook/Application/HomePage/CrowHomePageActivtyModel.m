//
//  CrowHomePageActivtyModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/18.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageActivtyModel.h"

@implementation CrowHomePageActivtyModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [CrowHomePageActivtyDataModel class]};
}

@end


@implementation CrowHomePageActivtyDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list" : [CrowHomePageActivtyDataListModel class]};
}

@end


@implementation CrowHomePageActivtyDataListModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"ID" : @"id"};
}

@end


