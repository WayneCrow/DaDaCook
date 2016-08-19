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

@interface CrowHomePageViewController ()<UITableViewDelegate, UITableViewDataSource, HomePageHeadDelegate, HomePageHeadDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
// tableView 的头部视图没有复用问题，可以直接拖入VC
@property (weak, nonatomic) IBOutlet CrowHomePageHeaderView *headerView;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *activityButton;

@property (nonatomic) CrowHomePageHeaderViewModel *headVM;
@property (nonatomic) CrowHomePageActivityViewModel *activityVM;

@end

@implementation CrowHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _headerView.delegate   = self;
    _headerView.dataSource = self;
    
    __weak typeof(self) weakSelf = self;
    
    [self.tableView addHeaderRefresh:^{
        
        [weakSelf.activityVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
            
            [weakSelf.headVM getDataWithMode:RequestModeRefresh completionHandler:^(NSError *error) {
                
                for (int index = 0; index < self.activityVM.numberOfButton; index++) {
                    
                    UIButton* button = [self.activityButton objectAtIndexedSubscript:index];
                    
                    if ([self.activityVM isOnlyImage:index]) {
                        [button setBackgroundImageWithURL:[self.activityVM imageURLForItem:index] forState:UIControlStateNormal placeholder:[UIImage imageNamed:@"default_kitchenpic"]];
                    }
                    else {
                        [button.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.top.equalTo(20);
                            make.centerX.equalTo(0);
                            make.height.equalTo(20);
                        }];
                        [button setImageWithURL:[self.activityVM imageURLForItem:index] forState:UIControlStateNormal placeholder:[UIImage imageNamed:@"defaultimage_small"]];
                        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
                        
                        [button.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                            make.centerX.equalTo(button);
                            make.bottom.equalTo(button.mas_bottom).equalTo(20);
                        }];
                        [button setTitle:[self.activityVM titleForItem:index] forState:UIControlStateNormal];
                        button.titleLabel.textAlignment = NSTextAlignmentCenter;
                        button.titleLabel.font          = [UIFont systemFontOfSize:12];
                        
                        [button layoutButtonWithEdgeInsetsStyle:ButtonEdgeInsetsStyleTop imageTitleSpace:-6];
                    }
                }
                
                [weakSelf.headerView reloadData];
                [weakSelf.tableView endHeaderRefresh];
            }];
        }];
    }];
    
    [self.tableView beginHeaderRefresh];
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

- (CrowHomePageActivityViewModel *)activityVM {
	if(_activityVM == nil) {
		_activityVM = [[CrowHomePageActivityViewModel alloc] init];
	}
	return _activityVM;
}

@end
