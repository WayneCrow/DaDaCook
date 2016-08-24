//
//  CrowCookerDetailViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/24.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowCookerDetailViewController.h"
#import "CrowCookerDetailViewModel.h"
/** 厨师信息 **/
#import "CrowCookerDetailCell.h"
#import "CrowCookerAuthInfoCell.h"
#import "CrowCookerCommentCell.h"
#import "CrowCookerAddressCell.h"
/** 拿手菜 **/
#import "CrowCookerFoodCell.h"
/** 其他菜 **/
#import "CrowCookerOtherFoodCell.h"


@interface CrowCookerDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *likeButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;


@property (nonatomic) CrowCookerDetailViewModel *detailVM;

@end

@implementation CrowCookerDetailViewController

#pragma mark - LifeCycle (生命周期)

- (instancetype)initWithCookerID:(NSInteger)ID
{
    self = [super init];
    if (self) {
        _ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view showHUD];
    
    __weak typeof(self) weakSelf = self;
    
    [self.detailVM getDataWithCookerID:self.ID completionHandler:^(NSError *error) {
        
        [self.likeButton setTitle:[self.detailVM LikeNumberForCooker] forState:UIControlStateNormal];
        
        [weakSelf.tableView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return self.detailVM.foodNumber;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            CrowCookerDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CookerDeatilCell" forIndexPath:indexPath];
            cell.kitchenName.text = [self.detailVM kitchenName];
            cell.starNumber.text  = [self.detailVM starNumberText];
            cell.cookerInfo.text  = [self.detailVM cookerDetailInfo];
            [cell.kitchenHeadImage setImageWithURL:[self.detailVM kitchenHeadImage] placeholder:[UIImage imageNamed:@"man_lying"]];
            
            return cell;
        }
        if (indexPath.row == 1) {
            CrowCookerAuthInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerAuthInfoCell" forIndexPath:indexPath];
            
            cell.scrollView = [[UIScrollView alloc] init];
            [cell addSubview:cell.scrollView];
            [cell.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.equalTo(cell);
                make.height.equalTo(80);
            }];
            
            UIButton *lastButton = [UIButton buttonWithType:UIButtonTypeCustom];
            for (int index = 0; index < self.detailVM.authMsgNumber; index++) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [cell.scrollView addSubview:button];
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.height.equalTo(80);
                    make.width.equalTo(80);
                    if (index == 0) {
                        make.left.equalTo(20);
                    }
                    else {
                        make.left.equalTo(lastButton.mas_right);
                        if (index == self.detailVM.authMsgNumber - 1) {
                            make.right.equalTo(-20);
                        }
                    }
                }];
                [button setImageWithURL:[self.detailVM authMsgIconForIndex:index] forState:UIControlStateNormal placeholder:nil];
                [button setTitle:[self.detailVM authMsgTextForIndex:index] forState:UIControlStateNormal];
                [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont systemFontOfSize:12];
                [button layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:10];
                lastButton = button;
            }
            return cell;
        }
        if (indexPath.row == 2) {
            CrowCookerCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerCommentCell" forIndexPath:indexPath];
            
            cell.commentNumberLB.text = [self.detailVM totalCommentNumber];
            
            return cell;
        }
        if (indexPath.row == 3) {
            CrowCookerAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerAddressCell" forIndexPath:indexPath];
            
            cell.kitchenAddressLB.text  = [self.detailVM kitchenAddress];
            cell.kitchenDistanceLB.text = [self.detailVM kitchenDistance];
            
            return cell;
        }

//        if (indexPath.section == 1) {
//            CrowCookerFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerOtherFoodCell" forIndexPath:indexPath];
//            
//            [cell.coverImage setImageWithURL:[self.detailVM foodImageForRow:indexPath.row] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
//            cell.foodTitleLB.text     = [self.detailVM foodTitleForRow:indexPath.row];
//            cell.foodDetailLB.text    = [self.detailVM foodDetailForRow:indexPath.row];
//            cell.foodPriceLB.text     = [self.detailVM foodPriceForRow:indexPath.row];
//            cell.eatLeftNumberLB.text = [self.detailVM stockAndEatNumber:indexPath.row];
//            
//            return cell;
//        }
        
//        if (indexPath.section == 2) {
//            CrowCookerOtherFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerOtherFoodCell" forIndexPath:indexPath];
//            
//            [cell.coverImage setImageWithURL:[self.detailVM otherFoodImageForRow:indexPath.row] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
//            cell.foodTitleLB.text     = [self.detailVM otherFoodTitleForRow:indexPath.row];
//            cell.foodDetailLB.text    = [self.detailVM otherFoodDetailForRow:indexPath.row];
//            cell.eatLeftNumberLB.text = [self.detailVM otherFoodstockAndEatNumber:indexPath.row];
//            cell.foodPriceLB.text     = [self.detailVM otherFoodPriceForRow:indexPath.row];
//            
//            return cell;
//        }
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 20;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%lf", scrollView.contentOffset.y);
//    NSLog(@"%lf", self.tableView.contentOffset.y);
    
    if (scrollView == self.tableView) {
        CGFloat y = scrollView.contentOffset.y;
        
        if (y <= 0) {
            _topImageView.frame = CGRectMake(0, y, kScreenW, 185 - y);
        }
    }
}

#pragma mark - LazyLoad (懒加载)

- (CrowCookerDetailViewModel *)detailVM {
	if(_detailVM == nil) {
		_detailVM = [[CrowCookerDetailViewModel alloc] init];
	}
	return _detailVM;
}

@end
