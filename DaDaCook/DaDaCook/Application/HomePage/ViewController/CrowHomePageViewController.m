//
//  CrowHomePageViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/17.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageViewController.h"
#import "CrowHomePageViewModel.h"
#import "CrowHomePageHeaderView.h"
#import "CrowHomePageDetailCell.h"
#import "CrowCookerDetailViewController.h"

@interface CrowHomePageViewController ()<UITableViewDelegate, UITableViewDataSource, HomePageHeadDelegate, HomePageHeadDataSource, HomePageDetailCellDelegate, HomePageDetailCellDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
// tableView 的头部视图没有复用问题，可以直接拖入VC
@property (weak, nonatomic) IBOutlet CrowHomePageHeaderView *headerView;

@property (weak, nonatomic) IBOutlet UIView      *navigationBar;
@property (weak, nonatomic) IBOutlet UIView      *bottomMaskView;
@property (weak, nonatomic) IBOutlet UIButton    *activityButton;
@property (weak, nonatomic) IBOutlet UIButton    *searchButton;
@property (weak, nonatomic) IBOutlet UIControl   *searchBar;
@property (weak, nonatomic) IBOutlet UIImageView *locationIV;
@property (weak, nonatomic) IBOutlet UILabel     *locationLB;
@property (weak, nonatomic) IBOutlet UIImageView *locationIconIV;

@property (nonatomic) CrowHomePageViewModel *homePageVM;

@property (nonatomic) NSInteger ID;

@end

@implementation CrowHomePageViewController

#pragma mark - LifeCycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerView.delegate   = self;
    _headerView.dataSource = self;
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addHeaderRefresh:^{
        
        [weakSelf.homePageVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.headerView reloadData];
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFootreRefresh:^{
        
        [weakSelf.homePageVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            
            [weakSelf.tableView reloadData];
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - headView DataSource

- (NSInteger)homePageHeaderNumberOfItems:(CrowHomePageHeaderView *)headView {
    return self.homePageVM.headNumber;
}

- (NSURL *)homePageHeadView:(CrowHomePageHeaderView *)headView imageURLForIndex:(NSInteger)index {
    return [self.homePageVM imageForItem:index];
}

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"Click Ad = %ld", index);
}

- (NSURL *)homePageHeadView:(CrowHomePageHeaderView *)headView activityImageURLForIndex:(NSInteger)index {
    return [self.homePageVM imageURLForItem:index];
}

- (NSString *)homePageHeadView:(CrowHomePageHeaderView *)headView activityTitleForIndex:(NSInteger)index {
    
    if (![self.homePageVM isOnlyImage:index]) {
        return [self.homePageVM titleForItem:index];
    }
    return nil;
}

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemActivityAtIndex:(NSInteger)index {
    NSLog(@"Click Activity = %ld", index);
}

#pragma mark - TableViewDetail DataSource

- (NSInteger)homePageDetailNumberOfItem:(CrowHomePageDetailCell *)cell rowNumber:(NSInteger)row {
    return [self.homePageVM cellImageNumberForRow:row];
}

- (NSURL *)homePageDetailCell:(CrowHomePageDetailCell *)cell imageURLForIndex:(NSInteger)index {
    return [self.homePageVM cellImageURLForRow:cell.indexRow imageNumber:index];
}

- (NSString *)homePageDetailCell:(CrowHomePageDetailCell *)cell detailLableForIndex:(NSInteger)index {
    return [self.homePageVM cellDetailForRow:cell.indexRow imageNumber:index];
}

- (void)homePageDetailCell:(CrowHomePageDetailCell *)cell didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"index = %ld", index);
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homePageVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CrowHomePageDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowHomePageDetailCell" forIndexPath:indexPath];
    
    cell.delegate   = self;
    cell.dataSource = self;
    
    cell.userHeadIV.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [cell.userHeadIV setImageWithURL:[self.homePageVM userHeadForRow:indexPath.row] placeholder:[UIImage imageNamed:@"man_lying"]];
    [self.homePageVM isAuthForRow:indexPath.row] ? (cell.isAuthIV.hidden = NO) : (cell.isAuthIV.hidden = YES);
    cell.titleLB.attributedText = [self.homePageVM titleForRow:indexPath.row];
    cell.detailLB.attributedText = [self.homePageVM detailForRow:indexPath.row];
    
    cell.indexRow = indexPath.row;
    
    [cell reloadData];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"Row = %ld", indexPath.row);
    
    UIStoryboard *storyBoard           = [UIStoryboard storyboardWithName:@"HomePage" bundle:nil];
    CrowCookerDetailViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"CookerDetailVC"];
    vc.ID = [self.homePageVM cookerIDForRow:indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"%f, %f", self.tableView.contentOffset.x, self.tableView.contentOffset.y);
    
    self.navigationBar.alpha  = self.tableView.contentOffset.y / 100;
    self.bottomMaskView.alpha = self.navigationBar.alpha;
    self.activityButton.alpha = (self.tableView.contentOffset.y + 80) / 10 ;
    self.searchButton.alpha   = (self.tableView.contentOffset.y + 80) / 10 ;
    self.searchBar.alpha      = (self.tableView.contentOffset.y + 80) / 10 ;
    
    if (self.navigationBar.alpha <= 0.2) {
        [self.activityButton setImage:[UIImage imageNamed:@"home_activity"] forState:UIControlStateNormal];
        self.activityButton.backgroundColor = kRGBA(0, 0, 0, 0.6);
        
        [self.searchButton setImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
        self.searchButton.backgroundColor = kRGBA(0, 0, 0, 0.6);
        
        [self.locationIV setImage:[UIImage imageNamed:@"home_location"]];
        [self.locationIconIV setImage:[UIImage imageNamed:@"home_transform"]];
        self.locationLB.textColor      = [UIColor whiteColor];
        self.searchBar.backgroundColor = kRGBA(0, 0, 0, 0.6);
    }
    else {
        [self.activityButton setImage:[UIImage imageNamed:@"home_activity_selected"] forState:UIControlStateNormal];
        self.activityButton.backgroundColor = [UIColor clearColor];
        
        [self.searchButton setImage:[UIImage imageNamed:@"home_search_selected"] forState:UIControlStateNormal];
        self.searchButton.backgroundColor = [UIColor clearColor];
        
        [self.locationIV setImage:[UIImage imageNamed:@"home_location_selected"]];
        [self.locationIconIV setImage:[UIImage imageNamed:@"home_transform_seleced"]];
        self.locationLB.textColor      = [UIColor orangeColor];
        self.searchBar.backgroundColor = [UIColor clearColor];
    }
}

#pragma mark - LazyLoad (懒加载)

- (CrowHomePageViewModel *)homePageVM {
	if(_homePageVM == nil) {
		_homePageVM = [[CrowHomePageViewModel alloc] init];
	}
	return _homePageVM;
}

- (NSInteger)ID {
	if(!_ID) {
		_ID = 0;
	}
	return _ID;
}

@end
