//
//  CrowHomePageCookerThirdDetailModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CrowHomePageCookerThirdDetailDataModel,CrowHomePageCookerThirdDetailDataCommonModel;

@interface CrowHomePageCookerThirdDetailModel : NSObject

@property (nonatomic, copy  ) NSString  *msg;
@property (nonatomic, strong) CrowHomePageCookerThirdDetailDataModel *data;
@property (nonatomic, assign) NSInteger code;

@end


@interface CrowHomePageCookerThirdDetailDataModel : NSObject

@property (nonatomic, copy  ) NSString *pkg_description;
@property (nonatomic, strong) NSArray  *pkg_tags;
@property (nonatomic, strong) NSArray  *packages;
@property (nonatomic, copy  ) NSString *cook_name;
@property (nonatomic, strong) NSArray  *set_meal;
@property (nonatomic, strong) NSArray<CrowHomePageCookerThirdDetailDataCommonModel *> *recommends;
// common_dishes -> common
@property (nonatomic, strong) NSArray<CrowHomePageCookerThirdDetailDataCommonModel *> *common;

@end


@interface CrowHomePageCookerThirdDetailDataCommonModel : NSObject

@property (nonatomic, copy  ) NSString  *image_url;
// description -> des
@property (nonatomic, copy  ) NSString  *des;
@property (nonatomic, assign) NSInteger new_dish;
@property (nonatomic, assign) NSInteger dish_id;
@property (nonatomic, assign) NSInteger set_meal;
@property (nonatomic, assign) NSInteger volume;
@property (nonatomic, strong) NSArray<NSString  *> *tags;
@property (nonatomic, assign) NSInteger eat_num;
@property (nonatomic, assign) NSInteger taste;
@property (nonatomic, copy  ) NSString  *kitchen_id;
@property (nonatomic, assign) NSInteger stock;
@property (nonatomic, assign) NSInteger tmr_stock;
@property (nonatomic, copy  ) NSString  *name;
@property (nonatomic, assign) NSInteger staple_type;
@property (nonatomic, copy  ) NSString  *type;
@property (nonatomic, copy  ) NSString  *toast;
@property (nonatomic, assign) NSInteger tmr_only;
@property (nonatomic, assign) NSInteger is_recommend;
@property (nonatomic, assign) NSInteger has_staple;
@property (nonatomic, assign) NSInteger staple_num;
@property (nonatomic, assign) NSInteger staple_price;
@property (nonatomic, copy  ) NSString  *thumbnail_image_url;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, copy  ) NSString  *staple_name;
@property (nonatomic, assign) NSInteger is_shelves;

@end

