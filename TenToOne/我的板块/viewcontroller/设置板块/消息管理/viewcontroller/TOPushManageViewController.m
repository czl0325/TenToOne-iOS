//
//  TOPushManageViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOPushManageViewController.h"
#import "TOSwitchView.h"

@interface TOPushManageViewController ()

@end

@implementation TOPushManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"消息提醒";
    
    UIView* view = createView([UIColor whiteColor]);
    view.layer.cornerRadius = 5;
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    TOSwitchView* view1 = [[TOSwitchView alloc]initWithTitle:@"通知提醒"];
    [view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(view);
        make.height.mas_equalTo(40);
    }];
    
    TOSwitchView* view2 = [[TOSwitchView alloc]initWithTitle:@"消息提醒"];
    [view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view1);
        make.top.mas_equalTo(view1.mas_bottom);
    }];
    
    TOSwitchView* view3 = [[TOSwitchView alloc]initWithTitle:@"支付提醒"];
    [view addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view1);
        make.top.mas_equalTo(view2.mas_bottom);
    }];
    
    TOSwitchView* view4 = [[TOSwitchView alloc]initWithTitle:@"交易提醒"];
    [view addSubview:view4];
    [view4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view1);
        make.top.mas_equalTo(view3.mas_bottom);
    }];
    
    TOSwitchView* view5 = [[TOSwitchView alloc]initWithTitle:@"广告提醒" showLine:NO];
    [view addSubview:view5];
    [view5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view1);
        make.top.mas_equalTo(view4.mas_bottom);
    }];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view5.mas_bottom);
    }];
}



@end
