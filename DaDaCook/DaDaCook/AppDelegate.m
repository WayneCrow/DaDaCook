//
//  AppDelegate.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "AppDelegate.h"
#import "CrowNetManager.h"

@import CoreLocation;

@interface AppDelegate ()<CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configApplication:launchOptions];
    [self.locationManager startUpdatingLocation];
    
    return YES;
}

- (CLLocationManager *)locationManager {
    if (!_locationManager) {
        _locationManager          = [CLLocationManager new];
        _locationManager.delegate = self;
        
        if ([_locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [_locationManager requestWhenInUseAuthorization];
        }
    }
    
    return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    if (locations.count > 0) {
        CLLocation *location = locations.firstObject;
        
        CLLocationCoordinate2D coordinate = location.coordinate;
        [[NSUserDefaults standardUserDefaults] setDouble:coordinate.latitude forKey:kCurrentLatitudeKey];
        [[NSUserDefaults standardUserDefaults] setDouble:coordinate.longitude forKey:kCurrentLongitudeKey];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        DDLogInfo(@"%@", location);

        [manager stopUpdatingLocation];
        manager = nil;
    }
}

@end
