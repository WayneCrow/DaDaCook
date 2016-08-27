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
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    BMKPointAnnotation *userLocation = [[BMKPointAnnotation alloc] init];
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    userLocation.coordinate = CLLocationCoordinate2DMake([userDefaults doubleForKey:kCurrentLatitudeKey], [userDefaults doubleForKey:kCurrentLongitudeKey]);
    
    BMKPointAnnotation *annotation = [[BMKPointAnnotation alloc]init];
    annotation.coordinate = _kitchenCoordinate;
    annotation.title      = _kitchenName;
    
    [_mapView addAnnotations:@[annotation]];
    
    BMKCoordinateRegion region ;//表示范围的结构体
    region.center = _kitchenCoordinate;//中心点
    region.span.latitudeDelta = 0.01;//经度范围（设置为0.1表示显示范围为0.2的纬度范围）
    region.span.longitudeDelta = 0.01;//纬度范围
    //这是一句关键的代码可以让你的地图跟着标注点走
    [_mapView setRegion:region animated:YES];
    //这句代码是添加第一个标注就显示标准的内容
    [_mapView selectAnnotation:annotation animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Method(方法)

- (IBAction)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}

@end
