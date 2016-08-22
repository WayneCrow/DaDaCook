//
//  CrowHomePageCookerViewModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/22.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseViewModel.h"

@interface CrowHomePageCookerViewModel : CrowBaseViewModel

@property (nonatomic, readonly) NSInteger rowNumber;
- (NSURL *)coverImageForRow:(NSInteger)row;
- (NSString *)foodDetailForRow:(NSInteger)row;
- (BOOL)isNewForRow:(NSInteger)row;
- (NSURL *)userHeadForRow:(NSInteger)row;
- (BOOL)isAuthForRow:(NSInteger)row;
- (NSAttributedString *)titleForRow:(NSInteger)row;
- (NSAttributedString *)detailForRow:(NSInteger)row;

- (NSInteger)cellImageNumberForRow:(NSInteger)row;
- (NSURL *)cellImageURLForRow:(NSInteger)row imageNumber:(NSInteger)index;
- (NSString *)cellDetailForRow:(NSInteger)row imageNumber:(NSInteger)index;

@property (nonatomic) NSInteger page;
@property (nonatomic) NSMutableArray<CrowHomePageCookerDataListModel *> *dataList;

@end
