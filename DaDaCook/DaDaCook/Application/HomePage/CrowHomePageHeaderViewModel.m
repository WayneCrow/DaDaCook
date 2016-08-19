//
//  CrowMainPageHeaderViewModel.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageHeaderViewModel.h"

@implementation CrowHomePageHeaderViewModel

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler {
    
    self.dataTask = [CrowNetManager postHomePageHeaderAdCompletionHandler:^(CrowHomePageHeaderModel *model, NSError *error) {
        
        if (!error) {
            
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            
            [self.dataList addObjectsFromArray:model.data.list];
        }
        !completionHandler ?: completionHandler(error);
    }];
}

#pragma mark - Method(方法)

- (NSInteger)headNumber {
    return self.dataList.count;
}

- (NSURL *)imageForItem:(NSInteger)item {
    return self.dataList[item].imageURL.crow_URL;
}

- (NSURL *)urlForItem:(NSInteger)item {
    return self.dataList[item].jumpURL.crow_URL;
}

#pragma mark - LazyLoad (懒加载) 

- (NSMutableArray<CrowHomePageHeaderDataListModel *> *)dataList {
    if(_dataList == nil) {
        _dataList = [[NSMutableArray<CrowHomePageHeaderDataListModel *> alloc] init];
    }
    return _dataList;
}

@end
