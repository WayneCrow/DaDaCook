//
//  CrowHomePageViewModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseViewModel.h"

@interface CrowHomePageViewModel : CrowBaseViewModel

@property (nonatomic) NSInteger page;

/** 头部滚动栏 **/
@property (nonatomic) NSInteger headNumber;
- (NSURL *)imageForItem:(NSInteger)item;
- (NSURL *)urlForItem:(NSInteger)item;

@property (nonatomic) NSMutableArray<CrowHomePageHeaderDataListModel *> *headerList;

/** 头部活动栏 **/
@property (nonatomic) NSInteger numberOfControl;
- (NSInteger)type0Number;
- (NSInteger)type1Number;
- (NSURL *)imageURLForItem:(NSInteger)index;
- (NSString *)titleForItem:(NSInteger)index;
- (BOOL)isOnlyImage:(NSInteger)index;

@property (nonatomic) NSMutableArray<CrowHomePageActivtyDataListModel *> *activityList;

/** 厨师列表 **/
@property (nonatomic, readonly) NSInteger rowNumber;
- (BOOL)isNewForRow:(NSInteger)row;
- (NSURL *)userHeadForRow:(NSInteger)row;
- (BOOL)isAuthForRow:(NSInteger)row;
- (NSAttributedString *)titleForRow:(NSInteger)row;
- (NSAttributedString *)detailForRow:(NSInteger)row;
- (NSInteger)cookerIDForRow:(NSInteger)row;

- (NSInteger)cellImageNumberForRow:(NSInteger)row;
- (NSURL *)cellImageURLForRow:(NSInteger)row imageNumber:(NSInteger)index;
- (NSString *)cellDetailForRow:(NSInteger)row imageNumber:(NSInteger)index;

@property (nonatomic) NSMutableArray<CrowHomePageCookerDataListModel *> *cookerDetailList;

@end
