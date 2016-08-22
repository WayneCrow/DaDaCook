//
//  CrowBaseViewModel.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};

@interface CrowBaseViewModel : NSObject

@property (nonatomic) NSURLSessionDataTask *dataTask;

- (void)getDataWithMode:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;

@end
