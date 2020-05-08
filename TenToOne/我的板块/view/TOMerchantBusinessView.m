//
//  TOMerchantBusinessView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMerchantBusinessView.h"

@interface TOMerchantBusinessView ()

@property(nonatomic,strong)UIButton* btMargin;
@property(nonatomic,strong)UIButton* btDeclaration;
@property(nonatomic,strong)UIButton* btShop;
@property(nonatomic,strong)UIButton* btTeam;

@end

@implementation TOMerchantBusinessView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton* btTitle = to_create_button_left(@"商家业务", @"icon_mymember");
        [self addSubview:btTitle];
        [btTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(10);
        }];
        
        [self addSubview:self.btMargin];
        [self.btMargin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.25*0.5);
            make.top.mas_equalTo(btTitle.mas_bottom).offset(20);
        }];
        
        [self addSubview:self.btDeclaration];
        [self.btDeclaration mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.25*1.5);
            make.centerY.mas_equalTo(self.btMargin);
        }];
        
        [self addSubview:self.btShop];
        [self.btShop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.5*1.25);
            make.centerY.mas_equalTo(self.btMargin);
        }];
        
        [self addSubview:self.btTeam];
        [self.btTeam mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.25*0.5+0.75);
            make.centerY.mas_equalTo(self.btMargin);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.btTeam.mas_bottom).offset(20);
        }];
    }
    return self;
}

- (UIButton *)btMargin{
    if(!_btMargin){
        _btMargin = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitle:@"保证金额" forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_margin"] forState:UIControlStateNormal];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            object.titleLabel.font = DefaultFont;
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:10];
            object;
       });
    }
    return _btMargin;
}

- (UIButton *)btDeclaration{
    if(!_btDeclaration){
        _btDeclaration = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitle:@"我要报单" forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_declaration"] forState:UIControlStateNormal];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            object.titleLabel.font = DefaultFont;
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:10];
            object;
       });
    }
    return _btDeclaration;
}

- (UIButton *)btShop{
    if(!_btShop){
        _btShop = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitle:@"我的商城" forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_myshop"] forState:UIControlStateNormal];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            object.titleLabel.font = DefaultFont;
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:10];
            object;
       });
    }
    return _btShop;
}

- (UIButton *)btTeam{
    if(!_btTeam){
        _btTeam = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitle:@"业务团队" forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_myteam"] forState:UIControlStateNormal];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            object.titleLabel.font = DefaultFont;
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:10];
            object;
       });
    }
    return _btTeam;
}
@end
