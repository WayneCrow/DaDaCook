//
//  CrowBaseNetworking.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowBaseNetworking.h"

@implementation CrowBaseNetworking

+ (id)GET:(NSString *)path parmenters:(NSDictionary *)parmenters completionHandler:(void (^)(id, NSError *))completionHandler {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    return [manager GET:path parameters:parmenters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
        
        [[NSOperationQueue new] addOperationWithBlock:^{
            [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
            }];
        }];
        
        !completionHandler ?: completionHandler(responseObject, nil);
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[NSOperationQueue new] addOperationWithBlock:^{
            
            NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
            id responseObj = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (responseObj) {
                    !completionHandler ?: completionHandler(responseObj, nil);
                }
                else {
                    !completionHandler ?: completionHandler(nil, error);
                }
            }];
        }];
        
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        NSLog(@"Error = %@", error);
    }];
}

+ (id)POST:(NSString *)path parmenters:(NSDictionary *)parmenters completionHandler:(void (^)(id, NSError *))completionHandler {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    
    return [manager POST:path parameters:parmenters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
        
        [[NSOperationQueue new] addOperationWithBlock:^{
            [NSKeyedArchiver archiveRootObject:responseObject toFile:cachePath];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                
            }];
        }];
        
        !completionHandler ?: completionHandler(responseObject, nil);
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [[NSOperationQueue new] addOperationWithBlock:^{
            
            NSString *cachePath = [docPath stringByAppendingPathComponent:task.currentRequest.URL.absoluteString.md5String];
            id responseObj = [NSKeyedUnarchiver unarchiveObjectWithFile:cachePath];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                if (responseObj) {
                    !completionHandler ?: completionHandler(responseObj, nil);
                }
                else {
                    !completionHandler ?: completionHandler(nil, error);
                }
            }];
        }];
        
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        NSLog(@"Error = %@", error);
    }];
}

@end
