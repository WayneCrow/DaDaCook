//
//  AppDelegate+Crow.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (Crow)

- (void)configApplication:(NSDictionary *)options;
@property (nonatomic, readonly, getter=isOnline) BOOL online;

@end
