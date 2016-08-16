//
//  UIScrollView+CrowRefresh.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "UIScrollView+CrowRefresh.h"

@implementation UIScrollView (CrowRefresh)

- (void)addHeaderRefresh:(void (^)())block {
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}

- (void)addFootreRefresh:(void (^)())block {
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
}

- (void)beginHeaderRefresh {
    [self.mj_header beginRefreshing];
}

- (void)endHeaderRefresh {
    [self.mj_header endRefreshing];
}

- (void)endFooterRefresh {
    [self.mj_header endRefreshing];
}

@end
