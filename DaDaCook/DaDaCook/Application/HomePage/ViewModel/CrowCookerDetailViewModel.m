//
//  CrowCookerDetailViewModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowCookerDetailViewModel.h"

@implementation CrowCookerDetailViewModel

- (void)getDataWithCookerID:(NSInteger)ID completionHandler:(void (^)(NSError *))completionHandler {
    
    __block int total = 4;
    
    [CrowNetManager postCookerDetailFirstPartId:ID compltionHandler:^(CrowHomePageCookerFirstDetailModel *model, NSError *error) {
        
        total--;
        
        if (!error) {
            self.firstList = model.data;
        }
        if (total == 0) {
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    [CrowNetManager postCookerDetailSecondPartId:ID compltionHandler:^(CrowHomePageCookerSecondDetailModel *model, NSError *error) {
        
        total--;
        
        if (!error) {
            self.secondList = model.data;
        }
        if (total == 0) {
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    [CrowNetManager postCookerDetailThirdPartId:ID compltionHandler:^(CrowHomePageCookerThirdDetailModel *model, NSError *error) {
        
        total--;
        
        if (!error) {
            self.thirdList = model.data;
        }
        if (total == 0) {
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    [CrowNetManager postCookerDetailFourthlyPartId:ID compltionHandler:^(CrowHomePageCookerFourthlyDetailModel *model, NSError *error) {
        
        total--;
        
        if (!error) {
            self.fourthList = model.data;
        }
        if (total == 0) {
            !completionHandler ?: completionHandler(error);
        }
    }];
}

/** 第一分区 **/
- (NSString *)LikeNumberForCooker {
    return [NSString stringWithFormat:@"%ld", self.firstList.collect_amount];
}

- (NSURL *)coverImageForCooker {
    return self.firstList.kitchen_image_url.crow_URL;
}

- (NSString *)kitchenName {
    return self.firstList.kitchen_name;
}

- (NSInteger)starNumber {
    return self.firstList.star;
}

- (NSString *)starNumberText {
    return [NSString stringWithFormat:@"%f分", self.firstList.star];
}

- (NSString *)cookerDetailInfo {
    return [NSString stringWithFormat:@"%@ %@", self.firstList.cook_name, self.firstList.native_place];
}

- (NSURL *)kitchenHeadImage {
    return self.firstList.cook_image_url.crow_URL;
}

// 下两条信息放置于 分区二 信息下
- (NSString *)kitchenAddress {
    return self.firstList.address;
}

- (NSString *)kitchenDistance {
    return [NSString stringWithFormat:@"相距：%@", self.firstList.distance];
}

/** 第二分区 **/
- (NSURL *)authMsgIconForIndex:(NSInteger)index {
    return self.secondList.msg[index].icon.crow_URL;
}

- (NSString *)authMsgTextForIndex:(NSInteger)index {
    return self.secondList.msg[index].title;
}

- (NSString *)totalCommentNumber {
    return [NSString stringWithFormat:@"饭友评论(%ld):", self.secondList.comment_num];
}

- (NSString *)commentTextForIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%@(%ld)", self.secondList.comment[index].tag_name, self.secondList.comment[index].tag_count_all];
}

/** 第三分区 **/
// 拿手菜
- (NSURL *)foodImageForRow:(NSInteger)row {
    return self.thirdList.recommends[row].image_url.crow_URL;
}

- (NSString *)foodTitleForRow:(NSInteger)row {
    return self.thirdList.recommends[row].name;
}

- (NSString *)foodDetailForRow:(NSInteger)row {
    return self.thirdList.recommends[row].description;
}

- (NSString *)foodPriceForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%.01ld", self.thirdList.recommends[row].price];
}

- (NSString *)stockAndEatNumber:(NSInteger)row {
    return [NSString stringWithFormat:@"还有%ld份 ︳%ld人品尝过", self.thirdList.recommends[row].stock, self.thirdList.recommends[row].eat_num];
}

// 其他菜品
- (NSURL *)otherFoodImageForRow:(NSInteger)row {
    return self.thirdList.common[row].image_url.crow_URL;
}

- (NSString *)otherFoodTitleForRow:(NSInteger)row {
    return self.thirdList.common[row].name;
}

- (NSString *)otherFoodDetailForRow:(NSInteger)row {
    return self.thirdList.common[row].description;
}

- (NSString *)otherFoodstockAndEatNumber:(NSInteger)row {
    return [NSString stringWithFormat:@"还有%ld份 ︳%ld人品尝过", self.thirdList.common[row].stock, self.thirdList.common[row].eat_num];
}

- (NSString *)otherFoodPriceForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%.01ld", self.thirdList.common[row].price];
}

/** 第四分区 **/
- (NSURL *)commentUserImageForRow:(NSInteger)row {
    return self.fourthList.list[row].avatar_url.crow_URL;
}

- (NSString *)commentUserNameForRow:(NSInteger)row {
    return self.fourthList.list[row].nickname;
}

- (NSInteger)expressStarNumberForRow:(NSInteger)row {
    return self.fourthList.list[row].star;
}

- (NSString *)commentDetailForRow:(NSInteger)row {
    return self.fourthList.list[row].content;
}

- (NSURL *)commentPostImageForRow:(NSInteger)row {
    return self.fourthList.list[row].image_url.crow_URL;
}

- (NSInteger)commentPraiseCountNumberForIndex:(NSInteger)index {
    return self.fourthList.list[index].praise.count;
}

- (NSString *)commentPraiseFoodForRow:(NSInteger)row numberForIndex:(NSInteger)index {
    return self.fourthList.list[row].praise[index].dish_name;
}

- (NSString *)commentCreatTimeForRow:(NSInteger)row {
    return self.fourthList.list[row].create_time;
}

// 家厨回复
- (NSString *)cookerCommentDetailForRow:(NSInteger)row {
    return self.fourthList.list[row].children[0].content;
}

- (NSString *)cookerCommentCreatTimeForRow:(NSInteger)row {
    return self.fourthList.list[row].children[0].create_time;
}

#pragma mark - LazyLoad (懒加载)

- (CrowHomePageCookerFirstDetailDataModel *)firstList {
    if(_firstList == nil) {
        _firstList = [[CrowHomePageCookerFirstDetailDataModel alloc] init];
    }
    return _firstList;
}

- (CrowHomePageCookerSecondDetailDataModel *)secondList {
    if(_secondList == nil) {
        _secondList = [[CrowHomePageCookerSecondDetailDataModel alloc] init];
    }
    return _secondList;
}

- (CrowHomePageCookerThirdDetailDataModel *)thirdList {
    if(_thirdList == nil) {
        _thirdList = [[CrowHomePageCookerThirdDetailDataModel alloc] init];
    }
    return _thirdList;
}

- (CrowHomePageCookerFourthlyDetailDataModel *)fourthList {
    if(_fourthList == nil) {
        _fourthList = [[CrowHomePageCookerFourthlyDetailDataModel alloc] init];
    }
    return _fourthList;
}

@end
