//
//  CrowHomePageHeaderView.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/17.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageHeaderView.h"

@implementation CrowHomePageHeaderView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self ic];
        [self pageControl];
        
        _duration       = 3.0;
        self.autoScroll = YES;
    }
    return self;
}

- (void)setDuration:(NSTimeInterval)duration {
    _duration = duration;
    
    self.autoScroll = _autoScroll;
}

- (void)setAutoScroll:(BOOL)autoScroll {
    
    _autoScroll = autoScroll;
    
    if (autoScroll) {
        [_timer invalidate];
        
        _timer = nil;
        
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:_duration block:^(NSTimer *timer) {
            [self.ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
        } repeats:YES];
    }
}

#pragma mark - Method(方法)

- (void)reloadData {
    [self.ic reloadData];
    
    if ([_dataSource respondsToSelector:@selector(homePageHeaderNumberOfItems:)]) {
        self.pageControl.numberOfPages = [_dataSource homePageHeaderNumberOfItems:self];
    }
    
    self.pageControl.currentPage = _ic.currentItemIndex;
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(homePageHeaderNumberOfItems:)]) {
        return [_dataSource homePageHeaderNumberOfItems:self];
    }
    return 0;
}

#pragma mark - ic Delegate

- (UIView *)carousel:(iCarousel *)carousel placeholderViewAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    if (!view) {
        view = [[UIImageView alloc] initWithFrame:carousel.bounds];
        
        view.contentMode   = UIViewContentModeScaleAspectFill;
        view.clipsToBounds = YES;
    }
    if ([_dataSource respondsToSelector:@selector(homePageHeadView:imageURLForIndex:)]) {
        
        NSURL *imageURL = [_dataSource homePageHeadView:self imageURLForIndex:index];
        [((UIImageView *)view) setImageWithURL:imageURL placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
    }
    else {
        [((UIImageView *)view) setImage:[UIImage imageNamed:@"default_kitchenpic"]];
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
    
    self.pageControl.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    
    if ([_delegate respondsToSelector:@selector(homePageHeadView:didSelectedItemAtIndex:)]) {
        [_delegate homePageHeadView:self didSelectedItemAtIndex:index];
    }
}

#pragma mark - LazyLoad (懒加载)

- (iCarousel *)ic {
    if(_ic == nil) {
        _ic = [[iCarousel alloc] init];
        [self addSubview:_ic];
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        
        _ic.delegate    = self;
        _ic.dataSource  = self;
        _ic.scrollSpeed = 2.0;
    }
    return _ic;
}

- (UIPageControl *)pageControl {
    if(_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
        [self addSubview:_pageControl];
        [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(0);
            make.bottom.equalTo(self.ic.mas_bottom).equalTo(8);
        }];
        
        _pageControl.pageIndicatorTintColor        = [UIColor colorWithRed:240 / 255.0 green:40 / 255.0 blue:40 / 255.0 alpha:1];
        _pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    }
    return _pageControl;
}

@end
