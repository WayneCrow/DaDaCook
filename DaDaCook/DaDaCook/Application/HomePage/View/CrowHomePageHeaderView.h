//
//  CrowHomePageHeaderView.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/17.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

@class CrowHomePageHeaderView;

@protocol HomePageHeadDataSource <NSObject>

@required

- (NSInteger)homePageHeaderNumberOfItems:(CrowHomePageHeaderView *)headView;
- (NSURL *)homePageHeadView:(CrowHomePageHeaderView *)headView imageURLForIndex:(NSInteger)index;

- (NSURL *)homePageHeadView:(CrowHomePageHeaderView *)headView activityImageURLForIndex:(NSInteger)index;
- (NSString *)homePageHeadView:(CrowHomePageHeaderView *)headView activityTitleForIndex:(NSInteger)index;

@end

@protocol HomePageHeadDelegate <NSObject>

@optional

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemAtIndex:(NSInteger)index;

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemActivityAtIndex:(NSInteger)index;

@end

@interface CrowHomePageHeaderView : UIView<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, weak) id<HomePageHeadDataSource> dataSource;
@property (nonatomic, weak) id<HomePageHeadDelegate  > delegate;

@property (nonatomic) iCarousel     *ic;
@property (nonatomic) UIPageControl *pageControl;

- (void)reloadData;

@property (nonatomic) NSTimer        *timer;
@property (nonatomic) BOOL           autoScroll;
@property (nonatomic) NSTimeInterval duration;

@property (nonatomic) UIView    *activityView;
@property (nonatomic) NSInteger type0Number;
@property (nonatomic) NSInteger type1Number;
@property (nonatomic) BOOL      isHaveTyep1;

@property (nonatomic) NSMutableArray<UIControl *> *headControls;

@end
