//
//  CrowHomePageViewModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageViewModel.h"

@implementation CrowHomePageViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    
    //总请求次数
    __block int total = 3;
    
    [CrowNetManager postHomePageHeaderAdCompletionHandler:^(CrowHomePageHeaderModel *model, NSError *error) {
        
        total--;
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.headerList removeAllObjects];
                [self.headerList addObjectsFromArray:model.data.list];
            }
        }
        if (total == 0) {
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    [CrowNetManager postHomePageActivityCompletionHandler:^(CrowHomePageActivtyModel *model, NSError *error) {
        
        total--;
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.activityList removeAllObjects];
                [model.data.list enumerateObjectsUsingBlock:^(CrowHomePageActivtyDataListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [self.activityList addObject:obj];
                }];
            }
        }
        if (total == 0) {
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    [CrowNetManager postHomePageCookerDetailPage:tmpPage CompletionHandler:^(CrowHomePageCookerModel *model, NSError *error) {
        
        total--;
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.cookerDetailList removeAllObjects];
            }
            [self.cookerDetailList addObjectsFromArray:model.data.list];
        }
        if (total == 0) {
            !completionHandler ?: completionHandler(error);
        }
    }];
    
    _page = tmpPage;
}

/** 头部滚动栏 **/
#pragma mark - Method(方法)

- (NSInteger)headNumber {
    return self.headerList.count;
}

- (NSURL *)imageForItem:(NSInteger)item {
    return self.headerList[item].imageURL.crow_URL;
}

- (NSURL *)urlForItem:(NSInteger)item {
    return self.headerList[item].jumpURL.crow_URL;
}


/** 头部活动栏 **/
#pragma mark - Method(方法)

- (NSInteger)numberOfControl {
    return self.activityList.count;
}

- (NSURL *)imageURLForItem:(NSInteger)index {
    return self.activityList[index].imageUrl.crow_URL;
}

- (NSString *)titleForItem:(NSInteger)index {
    return self.activityList[index].content;
}

- (NSInteger)buttonType:(NSInteger)index {
    return self.activityList[index].type;
}

- (BOOL)isOnlyImage:(NSInteger)index {
    return (self.activityList[index].type == 1) ? YES : NO;
}

/** 厨师列表 **/
#pragma mark - Method(方法)
- (NSInteger)rowNumber {
    return self.cookerDetailList.count;
}

- (BOOL)isNewForRow:(NSInteger)row {
    return self.cookerDetailList[row].is_new == 1 ? YES : NO;
}

- (NSURL *)userHeadForRow:(NSInteger)row {
    return self.cookerDetailList[row].cook_image_url.crow_URL;
}

- (BOOL)isAuthForRow:(NSInteger)row {
    return self.cookerDetailList[row].is_auth == 1 ? YES : NO;
}

- (NSAttributedString *)titleForRow:(NSInteger)row {
    NSAttributedString *kitchenName = [[NSAttributedString alloc] initWithString:self.cookerDetailList[row].kitchen_name attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    NSAttributedString *space       = [[NSAttributedString alloc] initWithString:@"  " attributes:nil];
    NSAttributedString *detail      = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@ %@ ", self.cookerDetailList[row].distance, self.cookerDetailList[row].kitchen_address] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSBackgroundColorAttributeName : kRGBA(240, 240, 240, 1), NSForegroundColorAttributeName : [UIColor lightGrayColor]}];
    
    NSMutableAttributedString *title = [NSMutableAttributedString new];
    [title appendAttributedString:kitchenName];
    [title appendAttributedString:space];
    [title appendAttributedString:detail];
    
    return title;
}

- (NSAttributedString *)detailForRow:(NSInteger)row {
    NSAttributedString *sale  = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"月售%@单", self.cookerDetailList[row].month_sale] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor orangeColor]}];
    NSAttributedString *other = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" · %.1f分 · 人均￥%ld · %@", self.cookerDetailList[row].star, self.cookerDetailList[row].avg_price, self.cookerDetailList[row].native_place] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor grayColor]}];
    
    NSMutableAttributedString *detail = [NSMutableAttributedString new];
    [detail appendAttributedString:sale];
    [detail appendAttributedString:other];
    
    return detail;
}

- (NSInteger)cellImageNumberForRow:(NSInteger)row {
    return self.cookerDetailList[row].detail.count + 1;
}

- (NSURL *)cellImageURLForRow:(NSInteger)row imageNumber:(NSInteger)index {
    if (index == 0) {
        return self.cookerDetailList[row].cover_image_url.crow_URL;
    }
    else {
        return self.cookerDetailList[row].detail[index - 1].dish_image_url.crow_URL;
    }
}

- (NSString *)cellDetailForRow:(NSInteger)row imageNumber:(NSInteger)index {
    if (index == 0) {
        return  nil;
    }
    else {
        return [NSString stringWithFormat:@"  %@ ￥%ld  ", self.cookerDetailList[row].detail[index - 1].dish_name, self.cookerDetailList[row].detail[index - 1].dish_price];
    }
}

- (NSInteger)cookerIDForRow:(NSInteger)row {
    return self.cookerDetailList[row].kitchen_id;
}

#pragma mark - LazyLoad (懒加载)

- (NSMutableArray<CrowHomePageHeaderDataListModel *> *)headerList {
    if(_headerList == nil) {
        _headerList = [[NSMutableArray<CrowHomePageHeaderDataListModel *> alloc] init];
    }
    return _headerList;
}

- (NSMutableArray<CrowHomePageActivtyDataListModel *> *)activityList {
    if(_activityList == nil) {
        _activityList = [[NSMutableArray<CrowHomePageActivtyDataListModel *> alloc] init];
    }
    return _activityList;
}

- (NSMutableArray<CrowHomePageCookerDataListModel *> *)cookerDetailList {
    if(_cookerDetailList == nil) {
        _cookerDetailList = [[NSMutableArray<CrowHomePageCookerDataListModel *> alloc] init];
    }
    return _cookerDetailList;
}

@end
