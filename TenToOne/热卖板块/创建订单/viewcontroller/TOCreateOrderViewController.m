//
//  TOCreateOrderViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOCreateOrderViewController.h"
#import "TOOrderAddressView.h"
#import "TOOrderGoodInfoView.h"
#import "TOOrderGoodSpacView.h"
#import "TOOrderOtherView.h"

@interface TOCreateOrderViewController ()

@property(nonatomic,strong)UILabel* tvAmount;
@property(nonatomic,strong)TOOrderAddressView* vAddress;
@property(nonatomic,strong)TOOrderGoodInfoView* vGoodInfo;
@property(nonatomic,strong)TOOrderGoodSpacView* vGoodSpac;
@property(nonatomic,strong)TOOrderOtherView* vGoodOther;

@end

@implementation TOCreateOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"创建订单";
    
    
    UIView* bottomView = createView([UIColor whiteColor]);
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(50);
    }];
    
    UILabel* lb1 = to_createLabel_text_color_font(@"实付款:", DefaultTextColor, 16);
    [bottomView addSubview:lb1];
    [lb1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bottomView);
        make.left.mas_equalTo(25);
    }];
    
    [bottomView addSubview:self.tvAmount];
    [self.tvAmount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(lb1);
        make.left.mas_equalTo(lb1.mas_right);
    }];
    
    UIButton* btConfirm = to_create_button_normal(@"提交订单");
    btConfirm.layer.cornerRadius = 5;
    [bottomView addSubview:btConfirm];
    [btConfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(lb1);
        make.right.mas_equalTo(-10);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    UIScrollView* scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(bottomView.mas_top);
    }];
    
    UIView* contentView = createView([UIColor clearColor]);
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
        make.width.mas_equalTo(scrollView);
    }];
    
    [contentView addSubview:self.vAddress];
    [self.vAddress mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(5);
        make.right.mas_equalTo(-5);
    }];
    
    [contentView addSubview:self.vGoodInfo];
    [self.vGoodInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.vAddress);
        make.top.mas_equalTo(self.vAddress.mas_bottom).offset(5);
    }];
    
    [contentView addSubview:self.vGoodSpac];
    [self.vGoodSpac mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.mas_equalTo(self.vAddress);
        make.top.mas_equalTo(self.vGoodInfo.mas_bottom).offset(5);
    }];
    
    [contentView addSubview:self.vGoodOther];
     [self.vGoodOther mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.left.mas_equalTo(self.vAddress);
         make.top.mas_equalTo(self.vGoodSpac.mas_bottom).offset(5);
     }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.vGoodOther.mas_bottom).offset(10);
    }];
}

- (UILabel *)tvAmount{
    if(!_tvAmount){
        _tvAmount = ({
            UILabel * object = to_createLabel_text_color_font(@"￥0元", MainColor, 16);
            object;
       });
    }
    return _tvAmount;
}

- (TOOrderAddressView *)vAddress{
    if(!_vAddress){
        _vAddress = ({
            TOOrderAddressView * object = [[TOOrderAddressView alloc]initWithFrame:CGRectZero];
            object;
       });
    }
    return _vAddress;
}


- (TOOrderGoodInfoView *)vGoodInfo{
    if(!_vGoodInfo){
        _vGoodInfo = ({
            TOOrderGoodInfoView * object = [[TOOrderGoodInfoView alloc]init];
            object;
       });
    }
    return _vGoodInfo;
}

- (TOOrderGoodSpacView *)vGoodSpac{
    if(!_vGoodSpac){
        _vGoodSpac = ({
            TOOrderGoodSpacView * object = [[TOOrderGoodSpacView alloc]init];
            object;
       });
    }
    return _vGoodSpac;
}

- (TOOrderOtherView *)vGoodOther{
    if(!_vGoodOther){
        _vGoodOther = ({
            TOOrderOtherView * object = [[TOOrderOtherView alloc]init];
            object;
       });
    }
    return _vGoodOther;
}
@end
