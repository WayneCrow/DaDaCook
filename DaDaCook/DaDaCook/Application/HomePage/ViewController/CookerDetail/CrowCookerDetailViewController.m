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

/** 厨房地图 **/
#import "CrowKitchenMapViewController.h"

@interface CrowCookerDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;
@property (weak, nonatomic) IBOutlet UIButton    *backButton;
@property (weak, nonatomic) IBOutlet UIButton    *likeButton;
@property (weak, nonatomic) IBOutlet UIButton    *shareButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomViewBottomConstraint;
@property (weak, nonatomic) IBOutlet UIButton    *shoppingCartButton;


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
        [weakSelf.view hideHUD];
        [weakSelf.tableView reloadData];
    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self scrollViewDidScroll:self.tableView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.2 animations:^{
        
        _bottomViewBottomConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method(方法)

- (IBAction)clickToBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"KitchenLocation"]) {
        CrowKitchenMapViewController *vc = segue.destinationViewController;
        vc.kitchenName = [self.detailVM kitchenName];
        vc.address     = [self.detailVM kitchenAddress];
        
        vc.distance = [NSString stringWithFormat:@"  %@  ", [[self.detailVM kitchenDistance] substringFromIndex:3]];
        
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake([self.detailVM kitchenLatitude], [self.detailVM kitchenLongitude]);
        vc.kitchenCoordinate = coordinate;
    }
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    }
    if (section == 1) {
        return self.detailVM.foodNumber;
    }
    if (section == 2) {
        return self.detailVM.otherFoodNumber;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /** 厨房信息 **/
    if (indexPath.section == 0) {
        
        if (indexPath.row == 0) {
            CrowCookerDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CookerDeatilCell" forIndexPath:indexPath];
            
            if (!cell) {
                cell = [[CrowCookerDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CrowCookerDetailCell"];
            }
            cell.kitchenName.text = [self.detailVM kitchenName];
            cell.starNumber.text  = [self.detailVM starNumberText];
            cell.cookerInfo.text  = [self.detailVM cookerDetailInfo];
            [cell.kitchenHeadImage setImageWithURL:[self.detailVM kitchenHeadImage] placeholder:[UIImage imageNamed:@"man_lying"]];
            
            return cell;
        }
        if (indexPath.row == 1) {
            CrowCookerAuthInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerAuthInfoCell" forIndexPath:indexPath];
            
            if (!cell.scrollView) {
                cell.scrollView = [[UIScrollView alloc] init];
                cell.scrollView.showsHorizontalScrollIndicator = NO;
                [cell addSubview:cell.scrollView];
                [cell.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.edges.equalTo(cell);
                    make.height.equalTo(80);
                }];
            }
            
            __block UIView *lastView = [UIView new];
            __block NSInteger type = 0;
            
            for (int index = 0; index < self.detailVM.authMsgNumber; index++) {
                
                if (type != [self.detailVM authMsgTypeForIndex:index]) {
                    UIView *maskView = [UIView new];
                    [cell.scrollView addSubview:maskView];
                    [maskView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.centerY.equalTo(0);
                        make.size.equalTo(CGSizeMake(1, 60));
                        make.left.equalTo(lastView.mas_right);
                    }];
                    maskView.backgroundColor = [UIColor grayColor];
                    
                    type = [self.detailVM authMsgTypeForIndex:index];
                    lastView = maskView;
                }

                UIView *view = [UIView new];
                [cell.scrollView addSubview:view];
                [view mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.size.equalTo(CGSizeMake(80, 80));
                    if (index == 0) {
                        make.left.equalTo(20);
                    }
                    else {
                        make.left.equalTo(lastView.mas_right);
                        if (index == self.detailVM.authMsgNumber - 1) {
                            make.right.equalTo(-20);
                        }
                    }
                }];
                
                UIImageView *imageView = [UIImageView new];
                [view addSubview:imageView];
                [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(0);
                    make.centerY.equalTo(-10);
                }];
                [imageView setImageWithURL:[self.detailVM authMsgIconForIndex:index]];
                imageView.contentMode   = UIViewContentModeScaleAspectFill;
                imageView.clipsToBounds = YES;
                
                UILabel *lable = [UILabel new];
                [view addSubview:lable];
                [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.centerX.equalTo(0);
                    make.centerY.equalTo(20);
                }];
                lable.text          = [self.detailVM authMsgTextForIndex:index];
                lable.font          = [UIFont systemFontOfSize:12];
                lable.textAlignment = NSTextAlignmentCenter;
                lable.textColor     = [UIColor grayColor];
                
                lastView = view;
            }
            return cell;
        }
        if (indexPath.row == 2) {
            CrowCookerCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerCommentCell" forIndexPath:indexPath];
            
            if (!cell) {
                cell = [[CrowCookerCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CrowCookerCommentCell"];
            }
            cell.commentNumberLB.text = [self.detailVM totalCommentNumber];
            
            return cell;
        }
        if (indexPath.row == 3) {
            CrowCookerAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerAddressCell" forIndexPath:indexPath];
            
            if (!cell) {
                cell = [[CrowCookerAddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CrowCookerAddressCell"];
            }
            cell.kitchenAddressLB.text  = [self.detailVM kitchenAddress];
            cell.kitchenDistanceLB.text = [self.detailVM kitchenDistance];
            
            return cell;
        }
    }
    
    /** 拿手菜 **/
    if (indexPath.section == 1) {
        CrowCookerFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerFoodCell" forIndexPath:indexPath];
        
        [cell.coverImage setImageWithURL:[self.detailVM foodImageForRow:indexPath.row] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
        cell.foodTitleLB.text     = [self.detailVM foodTitleForRow:indexPath.row];
        cell.foodDetailLB.text    = [self.detailVM foodDetailForRow:indexPath.row];
        cell.foodPriceLB.text     = [self.detailVM foodPriceForRow:indexPath.row];
        cell.eatLeftNumberLB.text = [self.detailVM stockAndEatNumber:indexPath.row];
        
        return cell;
    }
    
    /** 其他菜式 **/
    if (indexPath.section == 2) {
        CrowCookerOtherFoodCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowCookerOtherFoodCell" forIndexPath:indexPath];
        
        [cell.coverImage setImageWithURL:[self.detailVM otherFoodImageForRow:indexPath.row] placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
        cell.foodTitleLB.text     = [self.detailVM otherFoodTitleForRow:indexPath.row];
        if ([self.detailVM otherFoodDetailForRow:indexPath.row].length > 0) {
            cell.foodDetailLB.text = [self.detailVM otherFoodDetailForRow:indexPath.row];
        }
        cell.eatLeftNumberLB.text = [self.detailVM otherFoodstockAndEatNumber:indexPath.row];
        cell.foodPriceLB.text     = [self.detailVM otherFoodPriceForRow:indexPath.row];
        
        return cell;
        
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
    return 0;
}

#pragma mark - LazyLoad (懒加载)

- (CrowCookerDetailViewModel *)detailVM {
	if(_detailVM == nil) {
		_detailVM = [[CrowCookerDetailViewModel alloc] init];
	}
	return _detailVM;
}

@end
