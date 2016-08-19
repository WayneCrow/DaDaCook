//
//  CrowHomePageActivityViewModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/18.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseViewModel.h"

typedef NS_ENUM(NSUInteger, ControlType) {
    ControlTypeImageTitle,
    ControlTypeImage,
};

@interface CrowHomePageActivityViewModel : CrowBaseViewModel

@property (nonatomic) NSInteger numberOfControl;
- (NSURL *)imageURLForItem:(NSInteger)index;
- (NSString *)titleForItem:(NSInteger)index;
- (BOOL)isOnlyImage:(NSInteger)index;

@property (nonatomic) NSMutableArray<CrowHomePageActivtyDataListModel *> *dataList;

@end
