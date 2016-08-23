//
//  CrowHomePageDetailCell.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/22.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iCarousel.h>

@class CrowHomePageDetailCell;

@protocol HomePageDetailCellDataSource <NSObject>

@required

- (NSInteger)homePageDetailNumberOfItem:(CrowHomePageDetailCell *)cell rowNumber:(NSInteger)row;
- (NSURL *)homePageDetailCell:(CrowHomePageDetailCell *)cell imageURLForIndex:(NSInteger)index;
- (NSString *)homePageDetailCell:(CrowHomePageDetailCell *)cell detailLableForIndex:(NSInteger)index;

@end

@protocol HomePageDetailCellDelegate <NSObject>

@optional

- (void)homePageDetailCell:(CrowHomePageDetailCell *)cell didSelectedItemAtIndex:(NSInteger)index;

@end


@interface CrowHomePageDetailCell : UITableViewCell<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic) id<HomePageDetailCellDataSource> dataSource;
@property (nonatomic) id<HomePageDetailCellDelegate  > delegate;

@property (weak, nonatomic) IBOutlet iCarousel     *ic;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic) NSInteger indexRow;
@property (weak, nonatomic) IBOutlet UIImageView *userHeadIV;
@property (weak, nonatomic) IBOutlet UIImageView *isAuthIV;
@property (weak, nonatomic) IBOutlet UILabel     *titleLB;
@property (weak, nonatomic) IBOutlet UILabel     *detailLB;

- (void)reloadData;

@end
