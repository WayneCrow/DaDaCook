//
//  NSString+Crow.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "NSString+Crow.h"

@implementation NSString (Crow)

- (NSURL *)crow_URL {
    return [NSURL URLWithString:self];
}

@end
