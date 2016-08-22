//
//  CrowHomePageCookerModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/22.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageCookerModel.h"

@implementation CrowHomePageCookerModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [CrowHomePageCookerDataModel class]};
}

@end


@implementation CrowHomePageCookerDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"prelocate" : [CrowHomePageCookerDataPrelocateModel class],
             @"list" : [CrowHomePageCookerDataListModel class]
             };
}

@end


@implementation CrowHomePageCookerDataPrelocateModel

@end


@implementation CrowHomePageCookerDataListModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"detail" : [CrowHomePageCookerDataListDetailModel class]};
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"detail" : @"recommend_dishes_detail"};
}

@end


@implementation CrowHomePageCookerDataListDetailModel

@end


