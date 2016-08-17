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

@interface CrowHomePageViewController ()<UITableViewDelegate, UITableViewDataSource, HomePageHeadDelegate, HomePageHeadDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
// tableView 的头部视图没有复用问题，可以直接拖入VC
@property (weak, nonatomic) IBOutlet CrowHomePageHeaderView *headerView;

@property (nonatomic) CrowHomePageHeaderViewModel *headVM;

@end

@implementation CrowHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) weakSelf = self;
    
    
    [self.headVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {

        [weakSelf.headerView reloadData];
    }];
    
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Head DataSource

- (NSInteger)homePageHeaderNumberOfItems:(CrowHomePageHeaderView *)headView {
    
    return self.headVM.adNumber;
}

- (NSURL *)homePageHeadView:(CrowHomePageHeaderView *)headView imageURLForIndex:(NSInteger)index {
    return [self.headVM imageForItem:index];
}

- (void)homePageHeadView:(CrowHomePageHeaderView *)headView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"Click Head");
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 0;
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

@end
