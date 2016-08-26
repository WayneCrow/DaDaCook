//
//  CrowCookerDetailCell.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/24.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrowCookerDetailCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel     *kitchenName;
@property (weak, nonatomic) IBOutlet UILabel     *starNumber;
@property (weak, nonatomic) IBOutlet UILabel     *cookerInfo;
@property (weak, nonatomic) IBOutlet UIImageView *kitchenHeadImage;

@end
