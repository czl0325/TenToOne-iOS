//
//  TOHomeViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOHomeViewController.h"
#import <QMapKit/QMapKit.h>
#import "TOHomeNavbar.h"
#import "TOSendRedViewController.h"

@interface TOHomeViewController ()
<QMapViewDelegate, UISearchBarDelegate>

@property(nonatomic,strong)QMapView *mapView;
@property(nonatomic,strong)TOHomeNavbar* homeNavbar;


@end

@implementation TOHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    WeakSelf;
    
    [self.view addSubview:self.homeNavbar];
    [self.homeNavbar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(64);
    }];

    [self.view addSubview:self.mapView];
    [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.homeNavbar.mas_bottom);
    }];

    UIButton* btSend = to_create_button_backImage(@"icon_sendred");
    [[btSend rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        TOSendRedViewController* vc = [[TOSendRedViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [self.view addSubview:btSend];
    [btSend mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-10);
        make.size.mas_equalTo(65);
    }];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    UIEdgeInsets safeAreaInsets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        safeAreaInsets = self.view.safeAreaInsets;
    }
    CGFloat statusHeight = self.view.window.windowScene.statusBarManager.statusBarFrame.size.height;
    CGRect navRect = self.navigationController.navigationBar.frame;
    NSLog(@"%.2f",statusHeight+navRect.size.height+safeAreaInsets.top);
    [self.homeNavbar mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.mas_equalTo(self.view);
        make.height.mas_equalTo(navRect.size.height+safeAreaInsets.top);
    }];
    [self.view layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (QMapView *)mapView {
    if(!_mapView){
        _mapView = ({
            QMapView* object = [[QMapView alloc] initWithFrame:self.view.bounds];
            object.delegate = self;
            [object setShowsUserLocation:YES];
            object.zoomLevel = 16;
            [object setUserTrackingMode:QUserTrackingModeFollow];
            object;
       });
    }
    return _mapView;
}


- (TOHomeNavbar *)homeNavbar{
    if(!_homeNavbar){
        _homeNavbar = ({
            TOHomeNavbar * object = [[TOHomeNavbar alloc]init];
            object;
       });
    }
    return _homeNavbar;
}
@end
