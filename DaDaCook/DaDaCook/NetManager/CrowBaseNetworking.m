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
    
    // 拼接参数
    NSMutableDictionary *param = [NSMutableDictionary new];
    // 传入特殊参数
    [param addEntriesFromDictionary:parmenters];
    // 传入共同参数
    [param addEntriesFromDictionary:[self commonParams]];
    
    return [manager POST:path parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
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

+ (NSMutableDictionary *)commonParams {
    NSMutableDictionary *paramDic = [NSMutableDictionary new];
    
    // 经纬度字符串
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *coordinateStr = [NSString stringWithFormat:@"%f,%f", [userDefaults doubleForKey:kCurrentLongitudeKey], [userDefaults doubleForKey:kCurrentLatitudeKey]];
    
    // 为了让无法无该业务的地区显示，使用假经纬度
    coordinateStr = @"116.469235297309,39.88134792751736";
    
    // 当前时间 stringWithFormat 是YYKit 提供便捷日期格式化方法
    NSString *timeStr = [[NSDate date] stringWithFormat:@"YYYY-MM-dd HH:mm:ss"];
    
    // 屏幕尺寸
    CGSize size = [UIScreen mainScreen].bounds.size;
    NSString *sizeStr = [NSString stringWithFormat:@"%.0f*%.0f", size.width, size.height];
    
    [paramDic setObject:@"110100" forKey:@"_cityid"];
    [paramDic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"_device"];
    [paramDic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"_idfa"];
    [paramDic setObject:[UIDevice currentDevice].systemVersion forKey:@"_osversion"];
    [paramDic setObject:@"iOS" forKey:@"_platform"];
    [paramDic setObject:sizeStr forKey:@"_screen"];
    [paramDic setObject:timeStr forKey:@"_time"];
    [paramDic setObject:@"2.9.1" forKey:@"_version"];
    [paramDic setObject:coordinateStr forKey:@"coordinate"];
    [paramDic setObject:@"0" forKey:@"type"];
    [paramDic setObject:coordinateStr forKey:@"user_coordinate"];
    
    //key不带下划线前缀的_
    [paramDic setObject:@"110100" forKey:@"cityid"];
    [paramDic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"device"];
    [paramDic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"idfa"];
    [paramDic setObject:[UIDevice currentDevice].systemVersion forKey:@"osversion"];
    [paramDic setObject:@"iOS" forKey:@"platform"];
    [paramDic setObject:sizeStr forKey:@"screen"];
    [paramDic setObject:timeStr forKey:@"time"];
    [paramDic setObject:@"2.9.1" forKey:@"version"];
    
    return paramDic;
}

@end
