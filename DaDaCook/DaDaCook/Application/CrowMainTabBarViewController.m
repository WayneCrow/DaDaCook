//
//  CrowMainTabBarViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/17.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowMainTabBarViewController.h"

@interface CrowMainTabBarViewController ()

@end

@implementation CrowMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
    id homePageNavi = [[UIStoryboard storyboardWithName:@"HomePage" bundle:nil] instantiateInitialViewController];
    id discoverNavi = [[UIStoryboard storyboardWithName:@"Discover" bundle:nil] instantiateInitialViewController];
    id mineNavi     = [[UIStoryboard storyboardWithName:@"Mine" bundle:nil] instantiateInitialViewController];
    
    self.viewControllers = @[homePageNavi, discoverNavi, mineNavi];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
