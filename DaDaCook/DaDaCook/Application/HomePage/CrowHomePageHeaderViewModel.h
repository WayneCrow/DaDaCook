//
//  CrowMainPageHeaderViewModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseViewModel.h"

@interface CrowHomePageHeaderViewModel : CrowBaseViewModel

@property (nonatomic) NSInteger adNumber;
- (NSURL *)imageForItem:(NSInteger)item;
- (NSURL *)urlForItem:(NSInteger)item;

@property (nonatomic) NSMutableArray<CrowHomePageHeaderDataListModel *> *dataList;

@end
