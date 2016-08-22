//
//  CrowHomePageCookerViewModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/22.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageCookerViewModel.h"

@implementation CrowHomePageCookerViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    NSInteger tmpPage = 1;
    
    if (requestMode == RequestModeMore) {
        tmpPage = self.page + tmpPage;
    }
    
    self.dataTask = [CrowNetManager postHomePageCookerDetailPage:tmpPage CompletionHandler:^(CrowHomePageCookerModel *model, NSError *error) {
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            
            [self.dataList addObjectsFromArray:model.data.list];
        }
        !completionHandler ?: completionHandler(error);
    }];
    self.page = tmpPage;
}

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)coverImageForRow:(NSInteger)row {
    return nil;
}

- (BOOL)isNewForRow:(NSInteger)row {
    return self.dataList[row].is_new == 1 ? YES : NO;
}

- (NSURL *)userHeadForRow:(NSInteger)row {
    return self.dataList[row].cook_image_url.crow_URL;
}

- (BOOL)isAuthForRow:(NSInteger)row {
    return nil;
}

- (NSAttributedString *)titleForRow:(NSInteger)row {
    NSAttributedString *kitchenName = [[NSAttributedString alloc] initWithString:self.dataList[row].kitchen_name attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:18]}];
    NSAttributedString *space       = [[NSAttributedString alloc] initWithString:@"  " attributes:nil];
    NSAttributedString *detail      = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@ %@ ", self.dataList[row].distance, self.dataList[row].kitchen_address] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSBackgroundColorAttributeName : kRGBA(240, 240, 240, 1), NSForegroundColorAttributeName : [UIColor lightGrayColor]}];
    
    NSMutableAttributedString *title = [NSMutableAttributedString new];
    [title appendAttributedString:kitchenName];
    [title appendAttributedString:space];
    [title appendAttributedString:detail];
    
    return title;
}

- (NSAttributedString *)detailForRow:(NSInteger)row {
    NSAttributedString *sale  = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"月售%@单", self.dataList[row].month_sale] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor orangeColor]}];
    NSAttributedString *other = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@" · %.1f分 · 人均￥%ld · %@", self.dataList[row].star, self.dataList[row].avg_price, self.dataList[row].native_place] attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor grayColor]}];
    
    NSMutableAttributedString *detail = [NSMutableAttributedString new];
    [detail appendAttributedString:sale];
    [detail appendAttributedString:other];
    
    return detail;
}

- (NSInteger)cellImageNumberForRow:(NSInteger)row {
    return self.dataList[row].detail.count;
}

- (NSURL *)cellImageURLForRow:(NSInteger)row imageNumber:(NSInteger)index {
    return self.dataList[row].detail[index].dish_image_url.crow_URL;
}

#pragma mark - LazyLoad (懒加载)

- (NSInteger)page {
    if(!_page) {
        _page = 0;
    }
    return _page;
}

- (NSMutableArray<CrowHomePageCookerDataListModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<CrowHomePageCookerDataListModel *> alloc] init];
    }
    return _dataList;
}

@end
