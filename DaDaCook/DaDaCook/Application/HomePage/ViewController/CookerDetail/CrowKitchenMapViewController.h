//
//  CrowKitchenMapViewController.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/26.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrowKitchenMapViewController : UIViewController

@property (nonatomic) NSString *kitchenName;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *distance;
@property (nonatomic) CLLocationCoordinate2D kitchenCoordinate;

@end
