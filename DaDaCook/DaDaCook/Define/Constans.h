
//
//  Constans.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#ifndef Constans_h
#define Constans_h

#import "AppDelegate.h"

#define kScreenW ([UIScreen mainScreen].bounds.size.width)
#define kScreenH ([UIScreen mainScreen].bounds.size.height)

#define kRGBA(r, g, b, a) ([UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a])

#define kRemoveLeftSeparator(cell) \
cell.separatorInset = UIEdgeInsetsZero;\
cell.layoutMargins = UIEdgeInsetsZero;\
cell.preservesSuperviewLayoutMargins = NO;\

#define kParmentersWith(dic) \
[dic setObject:@"110100" forKey:@"_cityid"]; \
[dic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"_device"]; \
[dic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"_idfa"]; \
[dic setObject:@"10.0" forKey:@"_osversion"]; \
[dic setObject:@"iOS" forKey:@"_platform"]; \
[dic setObject:@"375*667" forKey:@"_screen"]; \
[dic setObject:@"2016-08-16 08:20:50" forKey:@"_time"]; \
[dic setObject:@"2.9.1" forKey:@"_version"]; \
[dic setObject:@"116.469235297309,39.88134792751736" forKey:@"coordinate"]; \
[dic setObject:@"0" forKey:@"type"]; \
[dic setObject:@"116.469235297309,39.88134792751736" forKey:@"user_coordinate"]; \

#define kParmenters(dic) \
[dic setObject:@"110100" forKey:@"cityid"]; \
[dic setObject:@"1A3FAB1E-0FF5-471D-AE0F-4ED1E5B55DF3" forKey:@"device"]; \
[dic setObject:@"91577D73-DDF9-4151-BB86-AA3596963582" forKey:@"idfa"]; \
[dic setObject:@"10.0" forKey:@"osversion"]; \
[dic setObject:@"iOS" forKey:@"platform"]; \
[dic setObject:@"375*667" forKey:@"_screen"]; \
[dic setObject:@"2016-08-16 08:20:50" forKey:@"time"]; \
[dic setObject:@"2.9.1" forKey:@"version"]; \
[dic setObject:@"116.469235297309,39.88134792751736" forKey:@"coordinate"]; \
[dic setObject:@"0" forKey:@"type"]; \
[dic setObject:@"116.469235297309,39.88134792751736" forKey:@"user_coordinate"]; \

#endif /* Constans_h */
