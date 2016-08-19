//
//  NSObject+CrowParse.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "NSObject+CrowParse.h"

@implementation NSObject (CrowParse)

+ (id)parse:(id)JSON {
    
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    if ([JSON isKindOfClass:[NSDictionary class]] || [JSON isKindOfClass:[NSString class]] || [JSON isKindOfClass:[NSData class]]) {
        return [self modelWithJSON:JSON];
    }
    return JSON;
}

@end
