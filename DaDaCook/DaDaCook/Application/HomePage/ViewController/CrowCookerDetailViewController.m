//
//  CrowCookerDetailViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/23.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowCookerDetailViewController.h"
#import "CrowCookerDetailViewModel.h"

@interface CrowCookerDetailViewController ()

@property (nonatomic) CrowCookerDetailViewModel *cookerVM;

@end

@implementation CrowCookerDetailViewController

#pragma mark - LifeCycle (生命周期)

- (instancetype)initWithStyle:(UITableViewStyle)style andCookerID:(NSInteger)ID
{
    self = [super initWithStyle:style];
    if (self) {
        _ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    self.tabBarController.tabBar.hidden           = YES;
    
    __weak typeof(self) weakSelf = self;
    
    [self.cookerVM getDataWithCookerID:self.ID completionHandler:^(NSError *error) {
        [weakSelf.tableView reloadData];
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden           = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - LazyLoad (懒加载)

- (CrowCookerDetailViewModel *)cookerVM {
	if(_cookerVM == nil) {
		_cookerVM = [[CrowCookerDetailViewModel alloc] init];
	}
	return _cookerVM;
}

@end
