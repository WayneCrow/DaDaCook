//
//  CrowKitchenMapViewController.m
//  DaDaCook
//
//  Created by tarena11 on 16/8/26.
//  Copyright © 2016年 Wayne. All rights reserved.
//

#import "CrowKitchenMapViewController.h"

@interface CrowKitchenMapViewController ()

@property (weak, nonatomic) IBOutlet UILabel    *kitchenNameLB;
@property (weak, nonatomic) IBOutlet UILabel    *addressLB;
@property (weak, nonatomic) IBOutlet UILabel    *distanceLB;
@property (weak, nonatomic) IBOutlet BMKMapView *mapView;

@end

@implementation CrowKitchenMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.kitchenNameLB.text = _kitchenName;
    self.addressLB.text     = _address;
    self.distanceLB.text    = _distance;
    
    BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
    CLLocationCoordinate2D coor;
    coor = _kitchenCoordinate;
    annotation.coordinate = coor;
    annotation.title = _kitchenName;
    [_mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method(方法)

- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
