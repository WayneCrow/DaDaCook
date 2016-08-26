//
//  CrowCookerDetailViewModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseViewModel.h"
#import "CrowHomePageCookerFirstDetailModel.h"
#import "CrowHomePageCookerSecondDetailModel.h"
#import "CrowHomePageCookerThirdDetailModel.h"
#import "CrowHomePageCookerFourthlyDetailModel.h"

@interface CrowCookerDetailViewModel : CrowBaseViewModel

- (void)getDataWithCookerID:(NSInteger)ID completionHandler:(void (^)(NSError *error))completionHandler;

/** 第一分区 **/
- (NSString *)LikeNumberForCooker;
- (NSArray<NSURL *> *)coverImageForCooker;
- (NSString *)kitchenName;
- (NSInteger)starNumber;
- (NSString *)starNumberText;
- (NSString *)cookerDetailInfo;
- (NSURL *)kitchenHeadImage;

// 下两条信息放置于 分区二 信息下
- (NSString *)kitchenAddress;
- (NSString *)kitchenDistance;

// 当前的地理坐标
- (float)kitchenLatitude;
- (float)kitchenLongitude;

/** 第二分区 **/
@property (nonatomic, readonly) NSInteger authMsgNumber;
- (NSInteger)authMsgTypeForIndex:(NSInteger)index;
- (NSURL *)authMsgIconForIndex:(NSInteger)index;
- (NSString *)authMsgTextForIndex:(NSInteger)index;
- (NSString *)totalCommentNumber;
- (NSString *)commentTextForIndex:(NSInteger)index;

/** 第三分区 **/
// 拿手菜
@property (nonatomic, readonly) NSInteger foodNumber;
- (NSURL *)foodImageForRow:(NSInteger)row;
- (NSString *)foodTitleForRow:(NSInteger)row;
- (NSString *)foodDetailForRow:(NSInteger)row;
- (NSString *)foodPriceForRow:(NSInteger)row;
- (NSString *)stockAndEatNumber:(NSInteger)row;

// 其他菜品
@property (nonatomic, readonly) NSInteger otherFoodNumber;
- (NSURL *)otherFoodImageForRow:(NSInteger)row;
- (NSString *)otherFoodTitleForRow:(NSInteger)row;
- (NSString *)otherFoodDetailForRow:(NSInteger)row;
- (NSString *)otherFoodstockAndEatNumber:(NSInteger)row;
- (NSString *)otherFoodPriceForRow:(NSInteger)row;

/** 第四分区 **/
- (NSURL *)commentUserImageForRow:(NSInteger)row;
- (NSString *)commentUserNameForRow:(NSInteger)row;
- (NSInteger)expressStarNumberForRow:(NSInteger)row;
- (NSString *)commentDetailForRow:(NSInteger)row;
- (NSURL *)commentPostImageForRow:(NSInteger)row;
- (NSInteger)commentPraiseCountNumberForIndex:(NSInteger)index;
- (NSString *)commentPraiseFoodForRow:(NSInteger)row numberForIndex:(NSInteger)index;
- (NSString *)commentCreatTimeForRow:(NSInteger)row;

// 家厨回复
- (NSString *)cookerCommentDetailForRow:(NSInteger)row;
- (NSString *)cookerCommentCreatTimeForRow:(NSInteger)row;


@property (nonatomic) CrowHomePageCookerFirstDetailDataModel *firstList;
@property (nonatomic) CrowHomePageCookerSecondDetailDataModel *secondList;
@property (nonatomic) CrowHomePageCookerThirdDetailDataModel *thirdList;
@property (nonatomic) CrowHomePageCookerFourthlyDetailDataModel *fourthList;

@end
