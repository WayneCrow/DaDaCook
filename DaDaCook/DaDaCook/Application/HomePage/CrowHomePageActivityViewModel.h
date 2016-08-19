//
//  CrowHomePageActivityViewModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/18.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseViewModel.h"

typedef NS_ENUM(NSUInteger, ButtonType) {
    ButtonTypeImageTitle,
    ButtonTypeImage,
};

@interface CrowHomePageActivityViewModel : CrowBaseViewModel

@property (nonatomic) NSInteger numberOfButton;
- (NSURL *)imageURLForItem:(NSInteger)index;
- (NSString *)titleForItem:(NSInteger)index;
- (NSInteger)buttonType:(NSInteger)index;
- (BOOL)isOnlyImage:(NSInteger)index;

@property (nonatomic) NSMutableArray<CrowHomePageActivtyDataListModel *> *dataList;

@end
