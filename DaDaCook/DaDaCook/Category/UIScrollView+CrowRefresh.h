//
//  UIScrollView+CrowRefresh.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (CrowRefresh)

- (void)addHeaderRefresh:(void(^)())block;
- (void)addFootreRefresh:(void(^)())block;

- (void)beginHeaderRefresh;
- (void)endHeaderRefresh;

- (void)endFooterRefresh;

@end
