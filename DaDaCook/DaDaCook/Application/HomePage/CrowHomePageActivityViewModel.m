//
//  CrowHomePageActivityViewModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/18.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageActivityViewModel.h"

@implementation CrowHomePageActivityViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    self.dataTask = [CrowNetManager postHomePageActivityCompletionHandler:^(CrowHomePageActivtyModel *model, NSError *error) {
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            
            [model.data.list enumerateObjectsUsingBlock:^(CrowHomePageActivtyDataListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.dataList addObject:obj];
            }];
        }
        !completionHandler ?: completionHandler(error);
    }];
}

#pragma mark - Method(方法)

- (NSInteger)numberOfControl {
    return self.dataList.count;
}

- (NSURL *)imageURLForItem:(NSInteger)index {
    return self.dataList[index].imageUrl.crow_URL;
}

- (NSString *)titleForItem:(NSInteger)index {
    return self.dataList[index].content;
}

- (NSInteger)buttonType:(NSInteger)index {
    return self.dataList[index].type;
}

- (BOOL)isOnlyImage:(NSInteger)index {
    return (self.dataList[index].type == 1) ? YES : NO;
}

#pragma mark - LazyLoad (懒加载)

- (NSMutableArray<CrowHomePageActivtyDataListModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<CrowHomePageActivtyDataListModel *> alloc] init];
    }
    return _dataList;
}

@end
