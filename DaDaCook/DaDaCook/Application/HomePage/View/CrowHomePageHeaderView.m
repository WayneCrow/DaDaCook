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
    
    [self activityView];
    
    [self.headControls enumerateObjectsUsingBlock:^(UIControl * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIImageView *imageView = [obj viewWithTag:201];
        if ([_dataSource respondsToSelector:@selector(homePageHeadView:activityImageURLForIndex:)]) {
            [imageView setImageWithURL:[_dataSource homePageHeadView:self activityImageURLForIndex:idx] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
        }
        
        UILabel *label = [obj viewWithTag:202];
        label.text = nil;
        if ([_dataSource respondsToSelector:@selector(homePageHeadView:activityTitleForIndex:)]) {
            label.text = [_dataSource homePageHeadView:self activityTitleForIndex:idx];
        }
        [obj bk_addEventHandler:^(id sender) {
            if ([_delegate respondsToSelector:@selector(homePageHeadView:didSelectedItemActivityAtIndex:)]) {
                [_delegate homePageHeadView:self didSelectedItemActivityAtIndex:idx];
            }
        } forControlEvents:UIControlEventTouchUpInside];
    }];
}

#pragma mark - ic DataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(homePageHeaderNumberOfItems:)]) {
        return [_dataSource homePageHeaderNumberOfItems:self];
    }
    return 0;
}

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

- (NSInteger)type0Number {
    if(!_type0Number) {
        _type0Number = 0;
    }
    return _type0Number;
}

- (NSInteger)type1Number {
    if(!_type1Number) {
        _type1Number = 0;
    }
    return _type1Number;
}

- (UIView *)activityView {
    if(_activityView == nil) {
        _activityView = [[UIView alloc] init];
        [self addSubview:_activityView];
        [_activityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ic.mas_bottom);
            make.left.right.equalTo(0);
            make.bottom.equalTo(0);
            make.height.greaterThanOrEqualTo(100);
        }];
        
        UIControl *lastControl = nil;
        
        for (int i = 0; i < self.type0Number; i++) {
            UIControl *type0Control = [[UIControl alloc] init];
            [_activityView addSubview:type0Control];
            [type0Control mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(0);
                make.width.equalTo(kScreenW / self.type0Number);
                make.height.equalTo(100);
                if (i == 0) {
                    make.left.equalTo(0);
                }
                else {
                    make.left.equalTo(lastControl.mas_right);
                    if (i == self.type0Number - 1) {
                        make.right.equalTo(0);
                    }
                }
            }];
            type0Control.tag = 2001 + i;
            lastControl      = type0Control;
            [self.headControls addObject:type0Control];
            
            UIImageView *iconIV = [[UIImageView alloc] init];
            [type0Control addSubview:iconIV];
            [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(0);
                make.centerY.equalTo(-10);
                make.size.equalTo(CGSizeMake(50, 50));
            }];
            iconIV.tag           = 201;
            iconIV.contentMode   = UIViewContentModeScaleAspectFill;
            iconIV.clipsToBounds = YES;
            
            UILabel *infoLB = [[UILabel alloc] init];
            [type0Control addSubview:infoLB];
            [infoLB mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(0);
                make.centerY.equalTo(28);
            }];
            infoLB.font      = [UIFont systemFontOfSize:14];
            infoLB.textColor = [UIColor grayColor];
            infoLB.tag       = 202;
        }
        
        if (self.type1Number != 0) {
            
            for (int i = 0; i < self.type1Number; i++) {
                UIControl *type1Control = [[UIControl alloc] init];
                [_activityView addSubview:type1Control];
                [type1Control mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(80);
                    make.width.equalTo(kScreenW / self.type1Number);
                    if (i == 0) {
                        make.top.equalTo(lastControl.mas_bottom);
                        make.left.equalTo(0);
                    }
                    else {
                        make.top.equalTo(lastControl);
                        make.left.equalTo(lastControl.mas_right);
                        if (i == self.type1Number - 1) {
                            make.right.equalTo(0);
                        }
                    }
                }];
                type1Control.tag = 2001 + self.type0Number + i;
                lastControl      = type1Control;
                [self.headControls addObject:type1Control];
                
                UIImageView *infoIV = [[UIImageView alloc] init];
                [type1Control addSubview:infoIV];
                [infoIV mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(UIEdgeInsetsMake(8, 8, 8, 8));
                }];
                infoIV.tag           = 201;
                infoIV.contentMode   = UIViewContentModeScaleAspectFill;
                infoIV.clipsToBounds = YES;
            }
        }
        else {
            self.height = self.height - 80;
        }
    }
    return _activityView;
}

- (NSMutableArray<UIControl *> *)headControls {
    if(_headControls == nil) {
//        _headControls = @[[self viewWithTag:2001], [self viewWithTag:2002], [self viewWithTag:2003], [self viewWithTag:2004], [self viewWithTag:2005], [self viewWithTag:2006]];
        _headControls = [NSMutableArray array];
    }
    return _headControls;
}



@end
