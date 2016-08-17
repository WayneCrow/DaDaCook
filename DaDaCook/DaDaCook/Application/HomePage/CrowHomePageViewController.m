//
//  CrowHomePageViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/17.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowHomePageViewController.h"
#import "CrowHomePageHeaderView.h"

@interface CrowHomePageViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
// tableView 的头部视图没有复用问题，可以直接拖入VC
@property (weak, nonatomic) IBOutlet CrowHomePageHeaderView *headerView;

@end

@implementation CrowHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
