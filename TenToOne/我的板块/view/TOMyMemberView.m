//
//  TOMyMemberView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMyMemberView.h"
#import "TOMyTeamViewController.h"

@interface TOMyMemberView ()

@property(nonatomic,strong)UILabel* tvMemberCount;
@property(nonatomic,strong)UILabel* tvEarnings;

@end

@implementation TOMyMemberView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        WeakSelf;
        
        UIButton* btTitle = to_create_button_left(@"我的团队", @"icon_mymember");
        [self addSubview:btTitle];
        [btTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(10);
        }];
        
        UIButton* btLook = to_create_button_Right(@"查看团队", @"icon_arrowright");
        [self addSubview:btLook];
        [btLook mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.top.mas_equalTo(btTitle);
            make.right.mas_equalTo(-20);
        }];
        [[btLook rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            TOMyTeamViewController* vc = [[TOMyTeamViewController alloc]init];
            [weakSelf.viewController.navigationController pushViewController:vc animated:YES];
        }];
        
        UILabel* l1 = to_createLabel_black(@"当前团队人数");
        [self addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.33*0.5);
            make.top.mas_equalTo(btTitle.mas_bottom).offset(25);
        }];
        
        [self addSubview:self.tvMemberCount];
        [self.tvMemberCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(l1);
            make.top.mas_equalTo(l1.mas_bottom).offset(8);
        }];
        
        UILabel* l2 = to_createLabel_black(@"本月团队收益(元)");
        [self addSubview:l2];
        [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.75);
            make.centerY.mas_equalTo(l1);
        }];
        
        [self addSubview:self.tvEarnings];
        [self.tvEarnings mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(l2);
            make.top.mas_equalTo(l2.mas_bottom).offset(8);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.tvMemberCount.mas_bottom).offset(20);
        }];
    }
    return self;
}


- (UILabel *)tvMemberCount{
    if(!_tvMemberCount){
        _tvMemberCount = ({
            UILabel * object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:15];
            object.text = @"0人";
            object.textAlignment = NSTextAlignmentCenter;
            object.textColor = DefaultTextColor;
            object;
       });
    }
    return _tvMemberCount;
}

- (UILabel *)tvEarnings{
    if(!_tvEarnings){
        _tvEarnings = ({
            UILabel * object = [[UILabel alloc]init];
            object.font = [UIFont systemFontOfSize:15];
            object.text = @"0元";
            object.textAlignment = NSTextAlignmentCenter;
            object.textColor = DefaultTextColor;
            object;
       });
    }
    return _tvEarnings;
}
@end
