//
//  TOMeHeaderView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMeHeaderView.h"

@interface TOMeHeaderView ()

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvMobile;
@property(nonatomic,strong)UIButton* btAuth;
@property(nonatomic,strong)UILabel* tvFreeCount;
@property(nonatomic,strong)UILabel* tvConsumeCount;
@property(nonatomic,strong)UILabel* tvFreeAmount;
@property(nonatomic,strong)UILabel* tvRedAmount;
@property(nonatomic,strong)UIButton* btOnAll;
@property(nonatomic,strong)UIButton* btOnPay;
@property(nonatomic,strong)UIButton* btOnSend;
@property(nonatomic,strong)UIButton* btOnReceive;
@property(nonatomic,strong)UIButton* btOnFinish;

@end

@implementation TOMeHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        UIImageView* back = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back_meheader"]];
        [self addSubview:back];
        [back mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.mas_equalTo(self);
            make.height.mas_equalTo(back.mas_width).multipliedBy(476.0/750);
        }];
        
        UIButton* btSetting = [UIButton buttonWithType:UIButtonTypeCustom];
        [btSetting setBackgroundImage:[UIImage imageNamed:@"icon_setting"] forState:UIControlStateNormal];
        [[btSetting rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(__kindof UIControl * _Nullable x) {
            
        }];
        [self addSubview:btSetting];
        [btSetting mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(20);
            make.top.mas_equalTo(30);
        }];
        
        [self addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(56);
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(btSetting.mas_bottom).offset(10);
        }];
        
        [self addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.ivAvatar.mas_right).offset(8);
            make.bottom.mas_equalTo(self.ivAvatar.mas_centerY).offset(-4);
        }];
        
        [self addSubview:self.tvMobile];
        [self.tvMobile mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvName);
            make.top.mas_equalTo(self.ivAvatar.mas_centerY).offset(4);
        }];
        
        [self addSubview:self.btAuth];
        [self.btAuth mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(btSetting);
            make.centerY.mas_equalTo(self.ivAvatar);
        }];
        
        UIView* bottomView = createView([UIColor whiteColor]);
        [self addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(back.mas_bottom).offset(5);
            make.height.mas_equalTo(70);
        }];
        
        [bottomView addSubview:self.btOnAll];
        [self.btOnAll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(bottomView);
            make.centerX.mas_equalTo(bottomView.mas_right).dividedBy(6.0);
            make.size.mas_equalTo(CGSizeMake(50, 70));
        }];
        
        [bottomView addSubview:self.btOnPay];
        [self.btOnPay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(bottomView);
            make.centerX.mas_equalTo(bottomView.mas_right).dividedBy(3.0);
            make.size.mas_equalTo(CGSizeMake(50, 70));
        }];
        
        
        
        [bottomView addSubview:self.btOnSend];
        [self.btOnSend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(bottomView);
            make.centerX.mas_equalTo(bottomView.mas_right).dividedBy(2.0);
            make.size.mas_equalTo(CGSizeMake(50, 70));
        }];
        
        
        [bottomView addSubview:self.btOnReceive];
        [self.btOnReceive mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(bottomView);
            make.centerX.mas_equalTo(bottomView.mas_right).multipliedBy(4/6.0);
            make.size.mas_equalTo(CGSizeMake(50, 70));
        }];
        
        [bottomView addSubview:self.btOnFinish];
        [self.btOnFinish mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(bottomView);
            make.centerX.mas_equalTo(bottomView.mas_right).multipliedBy(5/6.0);
            make.size.mas_equalTo(CGSizeMake(50, 70));
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(bottomView.mas_bottom);
        }];
    }
    return self;
}


- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_defaultavatar"]];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object.layer.cornerRadius = 28;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor whiteColor];
            object.text = @"登录/注册";
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvMobile{
    if(!_tvMobile){
        _tvMobile = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:12];
            object.text = @"****";
            object;
       });
    }
    return _tvMobile;
}

- (UIButton *)btAuth{
    if(!_btAuth){
        _btAuth = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_gou"] forState:UIControlStateHighlighted];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleRight imageTitleSpace:5];
            [object setTitle:@"未认证商家" forState:UIControlStateNormal];
            [object setTitle:@"已认证" forState:UIControlStateHighlighted];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            object;
       });
    }
    return _btAuth;
}

- (UILabel *)tvFreeCount{
    if(!_tvFreeCount){
        _tvFreeCount = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:12];
            object.textAlignment = NSTextAlignmentCenter;
            object;
       });
    }
    return _tvFreeCount;
}

- (UILabel *)tvConsumeCount{
    if(!_tvConsumeCount){
        _tvConsumeCount = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:12];
            object.textAlignment = NSTextAlignmentCenter;
            object;
       });
    }
    return _tvConsumeCount;
}

- (UILabel *)tvFreeAmount{
    if(!_tvFreeAmount){
        _tvFreeAmount = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:12];
            object.textAlignment = NSTextAlignmentCenter;
            object;
       });
    }
    return _tvFreeAmount;
}

- (UILabel *)tvRedAmount{
    if(!_tvRedAmount){
        _tvRedAmount = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:12];
            object.textAlignment = NSTextAlignmentCenter;
            object;
       });
    }
    return _tvRedAmount;
}

- (UIButton *)btOnAll{
    if(!_btOnAll){
        _btOnAll = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_onall"] forState:UIControlStateNormal];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5];
            [object setTitle:@"查看全部" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            object;
       });
    }
    return _btOnAll;
}

- (UIButton *)btOnPay{
    if(!_btOnPay){
        _btOnPay = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_onpay"] forState:UIControlStateNormal];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5];
            [object setTitle:@"待付款" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            object;
       });
    }
    return _btOnPay;
}

- (UIButton *)btOnSend{
    if(!_btOnSend){
        _btOnSend = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_onsend"] forState:UIControlStateNormal];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5];
            [object setTitle:@"待发货" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            object;
       });
    }
    return _btOnSend;
}

- (UIButton *)btOnReceive{
    if(!_btOnReceive){
        _btOnReceive = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_onreceive"] forState:UIControlStateNormal];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5];
            [object setTitle:@"待收货" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            object;
       });
    }
    return _btOnReceive;
}

- (UIButton *)btOnFinish{
    if(!_btOnFinish){
        _btOnFinish = ({
            UIButton * object = [[UIButton alloc]init];
            [object setTitleColor:DefaultTextColor forState:UIControlStateNormal];
            [object setImage:[UIImage imageNamed:@"icon_onfinish"] forState:UIControlStateNormal];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5];
            [object setTitle:@"已完成" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            object;
       });
    }
    return _btOnFinish;
}
@end
