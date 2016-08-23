//
//  CrowHomePageCookerSecondDetailModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageCookerSecondDetailModel.h"

@implementation CrowHomePageCookerSecondDetailModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"data" : [CrowHomePageCookerSecondDetailDataModel class]};
}

@end


@implementation CrowHomePageCookerSecondDetailDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{@"msg" : [CrowHomePageCookerSecondDetailDataMsgModel class],
         @"comment" : [CrowHomePageCookerSecondDetailDataCommentModel class]
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"msg" : @"auth_msg_list",
         @"comment" : @"comment_tag"
             };
}

@end


@implementation CrowHomePageCookerSecondDetailDataMsgModel

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{@"des" : @"description"};
}

@end


@implementation CrowHomePageCookerSecondDetailDataCommentModel

@end

