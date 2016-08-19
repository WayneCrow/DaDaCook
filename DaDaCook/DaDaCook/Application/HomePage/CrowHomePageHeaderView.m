//
//  CrowHomePageHeaderView.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/17.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageHeaderView.h"

@implementation CrowHomePageHeaderView

// xib上空间初始化会自动进入下方方法 而不是 init
- (void)awakeFromNib {
    NSLog(@"xib 初始化执行");
    
    self.ic.delegate   = self;
    self.ic.dataSource = self;
    
    _ic.scrollSpeed = 0.3;
    
    [NSTimer bk_scheduledTimerWithTimeInterval:2 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
}

#pragma mark - Method(方法)

- (void)reloadData {
    if ([_dataSource respondsToSelector:@selector(homePageHeaderNumberOfItems:)]) {
        self.pageControl.numberOfPages = [_dataSource homePageHeaderNumberOfItems:self];
    }
    [self.ic reloadData];
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(homePageHeaderNumberOfItems:)]) {
        return [_dataSource homePageHeaderNumberOfItems:self];
    }
    return 0;
}

#pragma mark - ic DataSource

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view {
    
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        
        [((UIImageView *)view) setImage:[UIImage imageNamed:@"default_kitchenpic"]];
        
        view.contentMode   = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(homePageHeadView:imageURLForIndex:)]) {
        
        [((UIImageView *)view) setImageWithURL:[_dataSource homePageHeadView:self imageURLForIndex:index] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
    }
    return view;
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value {
    
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    
    _pageControl.currentPage = carousel.currentItemIndex;
}

#pragma mark - ic Delegate

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
    if ([_delegate respondsToSelector:@selector(homePageHeadView:didSelectedItemAtIndex:)]) {
        [_delegate homePageHeadView:self didSelectedItemAtIndex:index];
    }
}

#pragma mark - LazyLoad (懒加载)

// 重写get方法
- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [self viewWithTag:100];
    }
    return _ic;
}

- (UIPageControl *)pageControl {
    if(_pageControl == nil) {
        _pageControl = [self viewWithTag:200];
    }
    return _pageControl;
}

@end
