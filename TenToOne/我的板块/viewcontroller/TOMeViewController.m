//
//  TOMeViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMeViewController.h"
#import "TOMeHeaderView.h"
#import "TOMyWalletView.h"
#import "TOMyMemberView.h"
#import "TOMerchantBusinessView.h"

@interface TOMeViewController ()

@property(nonatomic,strong)TOMeHeaderView* headerMe;
@property(nonatomic,strong)TOMyWalletView* walletView;
@property(nonatomic,strong)TOMyMemberView* memberView;
@property(nonatomic,strong)TOMerchantBusinessView* businessView;

@end

@implementation TOMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView* scrollView = [UIScrollView new];
    scrollView.bounces = NO;
    scrollView.backgroundColor = WindowsBackColor;
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [scrollView adjustBehavior];
    
    UIView* contentView = createView([UIColor clearColor]);
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
        make.width.mas_equalTo(scrollView);
    }];
    
    [contentView addSubview:self.headerMe];
    [self.headerMe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
    }];
    
    [contentView addSubview:self.walletView];
    [self.walletView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(contentView);
        make.top.mas_equalTo(self.headerMe.mas_bottom).offset(5);
    }];
    
    [contentView addSubview:self.memberView];
    [self.memberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(contentView);
        make.top.mas_equalTo(self.walletView.mas_bottom).offset(5);
    }];
    
    [contentView addSubview:self.businessView];
    [self.businessView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(contentView);
        make.top.mas_equalTo(self.memberView.mas_bottom).offset(5);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.businessView.mas_bottom).offset(5);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (TOMeHeaderView *)headerMe{
    if(!_headerMe){
        _headerMe = ({
            TOMeHeaderView * object = [[TOMeHeaderView alloc]init];
            object;
       });
    }
    return _headerMe;
}

- (TOMyWalletView *)walletView{
    if(!_walletView){
        _walletView = ({
            TOMyWalletView * object = [[TOMyWalletView alloc]init];
            object;
       });
    }
    return _walletView;
}

- (TOMyMemberView *)memberView{
    if(!_memberView){
        _memberView = ({
            TOMyMemberView * object = [[TOMyMemberView alloc]init];
            object;
       });
    }
    return _memberView;
}

- (TOMerchantBusinessView *)businessView{
    if(!_businessView){
        _businessView = ({
            TOMerchantBusinessView * object = [[TOMerchantBusinessView alloc]init];
            object;
       });
    }
    return _businessView;
}
@end
