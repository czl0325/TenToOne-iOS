//
//  TOMyWallerViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMyWallerViewController.h"
#import "TOTitleView.h"

@interface TOMyWallerViewController ()

@end

@implementation TOMyWallerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的钱包";
    
    UIView* view1 = createView([UIColor whiteColor]);
    view1.layer.cornerRadius = 5;
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    TOTitleView* view11 = [[TOTitleView alloc]initWithTitle:@"余额" detail:@"￥0" showLine:YES showArraw:YES];
    [view1 addSubview:view11];
    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(view1);
        make.height.mas_equalTo(40);
    }];
    
    TOTitleView* view12 = [[TOTitleView alloc]initWithTitle:@"现金券" detail:@"￥0" showLine:YES showArraw:NO];
    [view1 addSubview:view12];
    [view12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view11);
        make.top.mas_equalTo(view11.mas_bottom);
    }];
    
    TOTitleView* view13 = [[TOTitleView alloc]initWithTitle:@"购物券" detail:@"￥0" showLine:YES showArraw:NO];
    [view1 addSubview:view13];
    [view13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view11);
        make.top.mas_equalTo(view12.mas_bottom);
    }];
    
    TOTitleView* view14 = [[TOTitleView alloc]initWithTitle:@"专用券" detail:@"" showLine:NO showArraw:YES];
    [view1 addSubview:view14];
    [view14 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view11);
        make.top.mas_equalTo(view13.mas_bottom);
    }];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view14.mas_bottom);
    }];
    
    UIView* view2 = createView([UIColor whiteColor]);
    view2.layer.cornerRadius = 5;
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(view1);
        make.top.mas_equalTo(view1.mas_bottom).offset(10);
    }];
    
    TOTitleView* view21 = [[TOTitleView alloc]initWithTitle:@"支付宝" detail:@"已绑定" showLine:YES showArraw:YES];
    [view2 addSubview:view21];
    [view21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(view2);
        make.height.mas_equalTo(40);
    }];
    
    TOTitleView* view22 = [[TOTitleView alloc]initWithTitle:@"微信" detail:@"已绑定" showLine:YES showArraw:YES];
    [view2 addSubview:view22];
    [view22 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view21);
        make.top.mas_equalTo(view21.mas_bottom);
    }];
    
    TOTitleView* view23 = [[TOTitleView alloc]initWithTitle:@"银行卡" detail:@"" showLine:YES showArraw:YES];
    [view2 addSubview:view23];
    [view23 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view21);
        make.top.mas_equalTo(view22.mas_bottom);
    }];
    
    TOTitleView* view24 = [[TOTitleView alloc]initWithTitle:@"保证金" detail:@"￥4000" showLine:NO showArraw:YES];
    [view2 addSubview:view24];
    [view24 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.left.right.mas_equalTo(view21);
        make.top.mas_equalTo(view23.mas_bottom);
    }];
    
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view24.mas_bottom);
    }];
}



@end
