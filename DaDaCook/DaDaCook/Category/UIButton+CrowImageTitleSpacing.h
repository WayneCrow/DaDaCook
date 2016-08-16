//
//  UIButton+CrowImageTitleSpacing.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ButtonEdgeInsetStyle) {
    ButtonEdgeInsetsStyleTop, // image在上，label在下
    ButtonEdgeInsetsStyleLeft, // image在左，label在右
    ButtonEdgeInsetsStyleBottom, // image在下，label在上
    ButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (ImageTitleSpacing)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(ButtonEdgeInsetStyle)style
                        imageTitleSpace:(CGFloat)space;

@end
