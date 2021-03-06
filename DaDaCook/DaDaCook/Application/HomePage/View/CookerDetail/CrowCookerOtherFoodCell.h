//
//  CrowCookerOtherFoodCell.h
//  DaDaCook
//
//  Created by tarena11 on 16/8/24.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CrowCookerOtherFoodCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *coverImage;
@property (weak, nonatomic) IBOutlet UILabel     *foodTitleLB;
@property (weak, nonatomic) IBOutlet UILabel     *foodDetailLB;
@property (weak, nonatomic) IBOutlet UILabel     *eatLeftNumberLB;
@property (weak, nonatomic) IBOutlet UILabel     *foodPriceLB;


@end
