//
//  TOMyWalletView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMyWalletView.h"
#import "TOMyWallerViewController.h"

@interface TOMyWalletView ()

@property(nonatomic,strong)UILabel* tvBalance;
@property(nonatomic,strong)UILabel* tvAmount;
@property(nonatomic,strong)UILabel* tvDeposit;

@end

@implementation TOMyWalletView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        WeakSelf;
        
        UIButton* btTitle = to_create_button_left(@"我的钱包", @"icon_mywallet");
        [self addSubview:btTitle];
        [btTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(10);
        }];
        
        UIButton* btLook = to_create_button_Right(@"查看钱包", @"icon_arrowright");
        [self addSubview:btLook];
        [btLook mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.top.mas_equalTo(btTitle);
            make.right.mas_equalTo(-20);
        }];
        [[btLook rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            TOMyWallerViewController* vc = [[TOMyWallerViewController alloc]init];
            [weakSelf.viewController.navigationController pushViewController:vc animated:YES];
        }];
        
        UILabel* l1 = to_createLabel_black(@"可提现资产");
        [self addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.33*0.5);
            make.top.mas_equalTo(btTitle.mas_bottom).offset(25);
        }];
        
        [self addSubview:self.tvBalance];
        [self.tvBalance mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(l1);
            make.top.mas_equalTo(l1.mas_bottom).offset(8);
        }];
        
        UILabel* l2 = to_createLabel_black(@"总资产（元）");
        [self addSubview:l2];
        [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.33*1.5);
            make.centerY.mas_equalTo(l1);
        }];
        
        [self addSubview:self.tvAmount];
        [self.tvAmount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(l2);
            make.centerY.mas_equalTo(self.tvBalance);
        }];
        
        UILabel* l3 = to_createLabel_black(@"商家保证金（元）");
        [self addSubview:l3];
        [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.33*0.5+0.66);
            make.centerY.mas_equalTo(l1);
        }];
        
        [self addSubview:self.tvDeposit];
        [self.tvDeposit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(l3);
            make.centerY.mas_equalTo(self.tvBalance);
        }];
        
        UIButton* btWithdrawal = to_create_button_normal(@"去提现");
        [self addSubview:btWithdrawal];
        [btWithdrawal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(self.tvBalance.mas_bottom).offset(20);
            make.height.mas_equalTo(40);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(btWithdrawal.mas_bottom).offset(20);
        }];
    }
    return self;
}


- (UILabel *)tvBalance{
    if(!_tvBalance){
        _tvBalance = ({
            UILabel * object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:15];
            object.text = @"0";
            object.textAlignment = NSTextAlignmentCenter;
            object.textColor = DefaultTextColor;
            object;
       });
    }
    return _tvBalance;
}

- (UILabel *)tvAmount{
    if(!_tvAmount){
        _tvAmount = ({
            UILabel * object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:15];
            object.text = @"0";
            object.textAlignment = NSTextAlignmentCenter;
            object.textColor = DefaultTextColor;
            object;
       });
    }
    return _tvAmount;
}

- (UILabel *)tvDeposit{
    if(!_tvDeposit){
        _tvDeposit = ({
            UILabel * object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:15];
            object.text = @"0";
            object.textAlignment = NSTextAlignmentCenter;
            object.textColor = DefaultTextColor;
            object;
       });
    }
    return _tvDeposit;
}
@end
