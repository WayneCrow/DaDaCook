//
//  CrowHomePageCookerFourthlyDetailModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageCookerFourthlyDetailModel.h"

@implementation CrowHomePageCookerFourthlyDetailModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [CrowHomePageCookerFourthlyDetailDataModel class]};
}

@end


@implementation CrowHomePageCookerFourthlyDetailDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"list" : [CrowHomePageCookerFourthlyDetailDataListModel class]};
}

@end


@implementation CrowHomePageCookerFourthlyDetailDataListModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"order" : [CrowHomePageCookerFourthlyDetailDataListOrderModel class],
           @"express" : [CrowHomePageCookerFourthlyDetailDataListExpressModel class],
            @"praise" : [CrowHomePageCookerFourthlyDetailDataListPraiseModel class]
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"order" : @"order_tag",
           @"express" : @"express_tag"
             };
}

@end


@implementation CrowHomePageCookerFourthlyDetailDataListPraiseModel

@end


@implementation CrowHomePageCookerFourthlyDetailDataListOrderModel

@end


@implementation CrowHomePageCookerFourthlyDetailDataListExpressModel

@end


