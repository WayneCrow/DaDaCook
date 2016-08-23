//
//  CrowHomePageCookerThirdDetailModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageCookerThirdDetailModel.h"

@implementation CrowHomePageCookerThirdDetailModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [CrowHomePageCookerThirdDetailDataModel class]};
}

@end


@implementation CrowHomePageCookerThirdDetailDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"recommends" : [CrowHomePageCookerThirdDetailDataCommonModel class],
                 @"common" : [CrowHomePageCookerThirdDetailDataCommonModel class]
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"common" : @"common_dishes"};
}

@end


@implementation CrowHomePageCookerThirdDetailDataCommonModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"des" : @"description"};
}

@end


