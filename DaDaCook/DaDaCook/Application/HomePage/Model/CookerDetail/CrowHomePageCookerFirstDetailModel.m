//
//  CrowHomePageCookerFirstDetailModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageCookerFirstDetailModel.h"

@implementation CrowHomePageCookerFirstDetailModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [CrowHomePageCookerFirstDetailDataModel class]};
}

@end


@implementation CrowHomePageCookerFirstDetailDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"info" : [CrowHomePageCookerFirstDetailDataInfoModel class],
              @"msg" : [CrowHomePageCookerFirstDetailDataMsgModel class]
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"info" : @"busy_info",
              @"msg" : @"auth_msg_list"};
}

@end


@implementation CrowHomePageCookerFirstDetailDataInfoModel

@end


@implementation CrowHomePageCookerFirstDetailDataMsgModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"des" : @"description"};
}

@end


