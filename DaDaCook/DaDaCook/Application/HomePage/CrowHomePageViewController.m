//
//  CrowHomePageViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/17.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageViewController.h"
#import "CrowHomePageHeaderViewModel.h"
#import "CrowHomePageHeaderView.h"
#import "CrowHomePageActivityViewModel.h"
#import "CrowHomePageCookerViewModel.h"
#import "CrowHomePageDetailCell.h"

@interface CrowHomePageViewController ()<UITableViewDelegate, UITableViewDataSource, HomePageHeadDelegate, HomePageHeadDataSource, HomePageDetailCellDelegate, HomePageDetailCellDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
// tableView 的头部视图没有复用问题，可以直接拖入VC
@property (weak, nonatomic) IBOutlet CrowHomePageHeaderView *headerView;

@property (nonatomic) CrowHomePageHeaderViewModel *headVM;
@property (nonatomic) CrowHomePageActivityViewModel *activityVM;
@property (nonatomic) CrowHomePageCookerViewModel *cookerVM;

@end

@implementation CrowHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"CrowHomePageDetailCell" bundle:nil] forCellReuseIdentifier:@"CrowHomePageDetailCell"];
    
    _headerView.delegate   = self;
    _headerView.dataSource = self;
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addHeaderRefresh:^{
        
        [weakSelf.cookerVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.activityVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                
                [weakSelf.headVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                    
                    [weakSelf.headerView reloadData];
                    [weakSelf.tableView reloadData];
                    [weakSelf.tableView endHeaderRefresh];
                }];
            }];
        }];
    }];
    
    [self.tableView beginHeaderRefresh];
    
    [self.tableView addFootreRefresh:^{
        
        [weakSelf.cookerVM getDataWithMode:RequestModeMore completionHandler:^(NSError *error) {
            
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
    return self.headVM.headNumber;
}

- (NSURL *)homePageHeadView:(CrowHomePageHeaderView *)headView imageURLForIndex:(NSInteger)index {
    return [self.headVM imageForItem:index];
}

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"Click Ad = %ld", index);
}

- (NSURL *)homePageHeadView:(CrowHomePageHeaderView *)headView activityImageURLForIndex:(NSInteger)index {
    return [self.activityVM imageURLForItem:index];
}

- (NSString *)homePageHeadView:(CrowHomePageHeaderView *)headView activityTitleForIndex:(NSInteger)index {
    if (![self.activityVM isOnlyImage:index]) {
        return [self.activityVM titleForItem:index];
    }
    return nil;
}

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemActivityAtIndex:(NSInteger)index {
    NSLog(@"Click Activity = %ld", index);
}

#pragma mark - TableViewDetail DataSource

- (NSInteger)homePageDetailNumberOfItem:(CrowHomePageDetailCell *)cell rowNumber:(NSInteger)row {
    return [self.cookerVM cellImageNumberForRow:row];
}

- (NSURL *)homePageDetailCell:(CrowHomePageDetailCell *)cell imageURLForIndex:(NSInteger)index {
    return [self.cookerVM cellImageURLForRow:cell.indexRow imageNumber:index];
}

- (void)homePageDetailCell:(CrowHomePageDetailCell *)cell didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"index = %ld", index);
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cookerVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CrowHomePageDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CrowHomePageDetailCell" forIndexPath:indexPath];
    
    cell.delegate   = self;
    cell.dataSource = self;
    
    cell.userHeadIV.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [cell.userHeadIV setImageWithURL:[self.cookerVM userHeadForRow:indexPath.row] placeholder:[UIImage imageNamed:@"man_lying"]];
    cell.titleLB.attributedText = [self.cookerVM titleForRow:indexPath.row];
    cell.detailLB.attributedText = [self.cookerVM detailForRow:indexPath.row];
    cell.indexRow = indexPath.row;
    
    [cell reloadData];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - LazyLoad (懒加载)

- (CrowHomePageHeaderViewModel *)headVM {
	if(_headVM == nil) {
		_headVM = [[CrowHomePageHeaderViewModel alloc] init];
	}
	return _headVM;
}

- (CrowHomePageActivityViewModel *)activityVM {
	if(_activityVM == nil) {
		_activityVM = [[CrowHomePageActivityViewModel alloc] init];
	}
	return _activityVM;
}

- (CrowHomePageCookerViewModel *)cookerVM {
	if(_cookerVM == nil) {
		_cookerVM = [[CrowHomePageCookerViewModel alloc] init];
	}
	return _cookerVM;
}

@end
