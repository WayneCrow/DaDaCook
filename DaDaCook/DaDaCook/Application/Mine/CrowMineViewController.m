//
//  CrowMineViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/20.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowMineViewController.h"

@interface CrowMineViewController ()<UITableViewDelegate>

@property (nonatomic) UITableView *tableView;
@property (nonatomic) UITableViewController *mineTableVC;

@end

@implementation CrowMineViewController

#pragma mark - LifeCycle (生命周期)

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _mineTableVC = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateViewControllerWithIdentifier:@"MineTableViewController"];
    [self addChildViewController:_mineTableVC];
    
    [self.view addSubview:_mineTableVC.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(-20, 0, 0, 0));
    }];
    self.tableView.delegate = self;
    [self.view sendSubviewToBack:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
        return 76;
    }
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark - LazyLoad (懒加载)

- (UITableView *)tableView {
    return _mineTableVC.tableView;
}

@end
