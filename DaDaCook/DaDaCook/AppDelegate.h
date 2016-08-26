//
//  AppDelegate.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/16.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    
    BMKMapManager* _mapManager;
}

@property (strong, nonatomic) UIWindow *window;

@end

#import "AppDelegate+Crow.h"