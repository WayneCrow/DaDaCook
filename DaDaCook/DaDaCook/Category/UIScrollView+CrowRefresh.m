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
    
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:block];
    
    header.lastUpdatedTimeLabel.hidden = YES;
    
    CGSize size = header.frame.size;
    size.height = 100;
    header.size = size;
    
    [header.stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(-8);
        make.centerX.equalTo(0);
    }];
    
    [header.gifView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(header.stateLabel);
        make.bottom.equalTo(header.stateLabel.mas_top).equalTo(-8);
        make.size.equalTo(CGSizeMake(40, 40));
    }];
    [header setImages:[self animateImages] forState:MJRefreshStateIdle];
    [header setImages:[self animateImages] forState:MJRefreshStatePulling];
    [header setImages:[self animateImages] forState:MJRefreshStateRefreshing];
    
    [header setTitle:@"小锅小灶·上门审核·健康认证·人保保险" forState:MJRefreshStateIdle];
    [header setTitle:@"小锅小灶·上门审核·健康认证·人保保险" forState:MJRefreshStatePulling];
    [header setTitle:@"小锅小灶·上门审核·健康认证·人保保险" forState:MJRefreshStateRefreshing];
    
    header.stateLabel.textColor = kRGBA(249, 209, 99, 1);
    header.stateLabel.font      = [UIFont systemFontOfSize:12];
    
    self.mj_header = header;
}

- (NSArray<UIImage *> *)animateImages {
    NSArray *imageNames = @[@"pot_00000",
                            @"pot_00001",
                            @"pot_00002",
                            @"pot_00003",
                            @"pot_00004",
                            @"pot_00005",
                            @"pot_00006",
                            @"pot_00007",
                            @"pot_00008",
                            @"pot_00009",
                            @"pot_00010",
                            @"pot_00011",
                            ];
    NSMutableArray *images = [NSMutableArray array];
    [imageNames enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [images addObject:[UIImage imageNamed:obj]];
    }];
    
    return images.copy;
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
