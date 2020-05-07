//
//  TOMeViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMeViewController.h"
#import "TOMeHeaderView.h"

@interface TOMeViewController ()

@property(nonatomic,strong)TOMeHeaderView* headerMe;

@end

@implementation TOMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlack];
    
    UIScrollView* scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [scrollView adjustBehavior];
    
    UIView* contentView = [UIView new];
    [scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(scrollView);
        make.width.mas_equalTo(scrollView);
    }];
    
    [contentView addSubview:self.headerMe];
    [self.headerMe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(contentView);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        
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
@end
