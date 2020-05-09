//
//  TOSettingViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSettingViewController.h"
#import "TOMyAddressViewController.h"
#import "TOPushManageViewController.h"

@interface TOSettingViewController ()

@end

@implementation TOSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"设置";
    
    WeakSelf;
    
    UIView* view1 = createView([UIColor whiteColor]);
    view1.layer.cornerRadius = 5;
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    TOTitleView* view11 = [[TOTitleView alloc]initWithTitle:@"个人资料"];
    [view1 addSubview:view11];
    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(view1);
        make.height.mas_equalTo(40);
    }];
    UITapGestureRecognizer* tap1 = [[UITapGestureRecognizer alloc]init];
    [[tap1 rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        TOMyAddressViewController* vc = [[TOMyAddressViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [view11 addGestureRecognizer:tap1];
    
    
    TOTitleView* view12 = [[TOTitleView alloc]initWithTitle:@"地址管理"];
    [view1 addSubview:view12];
    [view12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view11.mas_bottom);
        make.left.right.height.mas_equalTo(view11);
    }];
    UITapGestureRecognizer* tap2 = [[UITapGestureRecognizer alloc]init];
    [[tap2 rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        TOMyAddressViewController* vc = [[TOMyAddressViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [view12 addGestureRecognizer:tap2];
    
    TOTitleView* view13 = [[TOTitleView alloc]initWithTitle:@"消息管理"];
    [view1 addSubview:view13];
    [view13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(view12.mas_bottom);
        make.left.right.height.mas_equalTo(view11);
    }];
    UITapGestureRecognizer* tap3 = [[UITapGestureRecognizer alloc]init];
    [[tap3 rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        TOPushManageViewController* vc = [[TOPushManageViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [view13 addGestureRecognizer:tap3];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view13.mas_bottom);
    }];
    
    UIView* view2 = createView([UIColor whiteColor]);
    view2.layer.cornerRadius = 5;
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(view1.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    
    TOTitleView* view21 = [[TOTitleView alloc]initWithTitle:@"安全管理"];
    [view2 addSubview:view21];
    [view21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view2);
    }];
    UITapGestureRecognizer* tap4 = [[UITapGestureRecognizer alloc]init];
    [[tap4 rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        TOMyAddressViewController* vc = [[TOMyAddressViewController alloc]init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    [view21 addGestureRecognizer:tap4];
}



@end
