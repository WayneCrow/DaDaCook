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

@end

@protocol HomePageHeadDelegate <NSObject>

@optional

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemAtIndex:(NSInteger)index;

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

@end
