//
//  CrowCookerDetailViewController.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrowCookerDetailViewController : UITableViewController

- (instancetype)initWithStyle:(UITableViewStyle)style andCookerID:(NSInteger)ID;
@property (nonatomic) NSInteger ID;

@end
