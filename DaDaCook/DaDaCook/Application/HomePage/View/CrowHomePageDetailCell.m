//
//  CrowHomePageDetailCell.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/22.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageDetailCell.h"

@implementation CrowHomePageDetailCell

#pragma mark - LifeCycle (生命周期)

- (void)awakeFromNib {
    
    self.ic.delegate   = self;
    self.ic.dataSource = self;
    
    _ic.scrollSpeed            = 0.3;
    _ic.clipsToBounds          = YES;
    _ic.userInteractionEnabled = NO;
    
    [NSTimer bk_timerWithTimeInterval:2 block:^(NSTimer *timer) {
        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
    } repeats:YES];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Method(方法)

- (void)reloadData {
    if ([_dataSource respondsToSelector:@selector(homePageDetailNumberOfItem:rowNumber:)]) {
        self.pageControl.numberOfPages = [_dataSource homePageDetailNumberOfItem:self rowNumber:self.indexRow];
    }
    [self.ic reloadData];
}

#pragma mark - ic DataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    if ([_dataSource respondsToSelector:@selector(homePageDetailNumberOfItem:rowNumber:)]) {
        return [_dataSource homePageDetailNumberOfItem:self rowNumber:self.indexRow];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view {
    
    if (!view) {
        
        view = [[UIView alloc]initWithFrame:carousel.bounds];
        
        UIImageView * image = [[UIImageView alloc] initWithFrame:carousel.bounds];
        [view addSubview:image];
        [image setImage:[UIImage imageNamed:@"default_kitchenpic"]];
        image.tag = 300;
        
        UILabel *foodDetailLB = [UILabel new];
        [view addSubview:foodDetailLB];
        [foodDetailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(0);
            make.height.equalTo(26);
        }];
        foodDetailLB.backgroundColor = kRGBA(0, 0, 0, 0.6);
        foodDetailLB.textColor       = [UIColor whiteColor];
        foodDetailLB.font            = [UIFont systemFontOfSize:14];
        foodDetailLB.tag             = 301;
    }
    
    UIImageView *image = [view viewWithTag:300];
    UILabel *label     = [view viewWithTag:301];
    if ([_dataSource respondsToSelector:@selector(homePageDetailCell:imageURLForIndex:)]) {
        [image setImageWithURL:[_dataSource homePageDetailCell:self imageURLForIndex:index] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
    }
    if ([_dataSource respondsToSelector:@selector(homePageDetailCell:detailLableForIndex:)]) {
        label.text = [_dataSource homePageDetailCell:self detailLableForIndex:index];
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
    if ([_delegate respondsToSelector:@selector(homePageDetailCell:didSelectedItemAtIndex:)]) {
        [_delegate homePageDetailCell:self didSelectedItemAtIndex:index];
    }
}

@end
