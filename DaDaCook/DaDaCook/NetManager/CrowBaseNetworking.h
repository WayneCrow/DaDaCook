//
//  CrowBaseNetworking.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CrowBaseNetworking : NSObject

+ (id)GET:(NSString *)path parmenters:(NSDictionary *)parmenters completionHandler:(void(^)(id responseObj, NSError *error))completionHandler;

+ (id)POST:(NSString *)path parmenters:(NSDictionary *)parmenters completionHandler:(void(^)(id responseObj, NSError *error))compltionHandler;

@end
