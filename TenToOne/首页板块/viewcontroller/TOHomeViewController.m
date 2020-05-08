//
//  TOHomeViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOHomeViewController.h"
#import <QMapKit/QMapKit.h>
#import "TORegionView.h"

@interface TOHomeViewController ()
<QMapViewDelegate, UISearchBarDelegate>

@property(nonatomic,strong)QMapView *mapView;
@property(nonatomic,strong)TORegionView* regionView;


@end

@implementation TOHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UISearchBar *customSearchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
//    customSearchBar.delegate = self;
//    customSearchBar.showsCancelButton = NO;
//    customSearchBar.searchBarStyle = UISearchBarStyleMinimal;
//    customSearchBar.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.titleView = customSearchBar;

    [self addLeftNavigationButtons:@[self.regionView]];
    
    [self.view addSubview:self.mapView];
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    //Dialog().wTypeSet(DialogTypeNaviMenu).wDataSet(@[@{@"name":@"话费充值",@"image":@""},@{@"name":@"我要报单"},@{@"name":@"玩法攻略"},@{@"name":@"扫一扫"}]).wStart();
}

- (TORegionView *)regionView{
    if(!_regionView){
        _regionView = ({
            TORegionView* object = [[TORegionView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
            object;
       });
    }
    return _regionView;
}

- (QMapView *)mapView{
    if(!_mapView){
        _mapView = ({
            QMapView* object = [[QMapView alloc] initWithFrame:self.view.bounds];
            object.delegate = self;
            [object setShowsUserLocation:YES];
            [object setUserTrackingMode:QUserTrackingModeFollowWithHeading];
            object;
       });
    }
    return _mapView;
}

@end
