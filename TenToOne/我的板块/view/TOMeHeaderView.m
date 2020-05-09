//
//  TOMeHeaderView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMeHeaderView.h"
#import "TOLoginViewController.h"
#import "TOSettingViewController.h"

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
        WeakSelf;
        
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
            TOSettingViewController* vc = [[TOSettingViewController alloc]init];
            [weakSelf.viewController.navigationController pushViewController:vc animated:YES];
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
        
        [self addSubview:self.tvFreeCount];
        [self.tvFreeCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.25*0.5);
            make.top.mas_equalTo(self.ivAvatar.mas_bottom).offset(20);
        }];
        
        UILabel* l1 = to_createLabel_white(@"免单次数");
        [self addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tvFreeCount);
            make.top.mas_equalTo(self.tvFreeCount.mas_bottom).offset(5);
        }];
        
        [self addSubview:self.tvConsumeCount];
        [self.tvConsumeCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.25*1.5);
            make.centerY.mas_equalTo(self.tvFreeCount);
        }];
        
        UILabel* l2 = to_createLabel_white(@"消费金额");
        [self addSubview:l2];
        [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tvConsumeCount);
            make.centerY.mas_equalTo(l1);
        }];
        
        [self addSubview:self.tvFreeAmount];
        [self.tvFreeAmount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.5+0.25*0.5);
            make.centerY.mas_equalTo(self.tvFreeCount);
        }];
        
        UILabel* l3 = to_createLabel_white(@"免单金额");
        [self addSubview:l3];
        [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tvFreeAmount);
            make.centerY.mas_equalTo(l1);
        }];
        
        [self addSubview:self.tvRedAmount];
        [self.tvRedAmount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.75+0.25*0.5);
            make.centerY.mas_equalTo(self.tvFreeCount);
        }];
        
        UILabel* l4 = to_createLabel_white(@"红包金额");
        [self addSubview:l4];
        [l4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tvRedAmount);
            make.centerY.mas_equalTo(l1);
        }];
        
        UIView* bottomView = createView([UIColor whiteColor]);
        [self addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self);
            make.top.mas_equalTo(back.mas_bottom).offset(5);
            make.height.mas_equalTo(70);
        }];
        
        UIView* v1 = createView([UIColor clearColor]);
        [bottomView addSubview:v1];
        [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(bottomView.mas_width).dividedBy(5.0);
            make.left.top.height.mas_equalTo(bottomView);
        }];
        
        [v1 addSubview:self.btOnAll];
        [self.btOnAll mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.height.mas_equalTo(v1);
        }];
        
        UIView* v2 = createView([UIColor clearColor]);
        [bottomView addSubview:v2];
        [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.top.width.mas_equalTo(v1);
            make.left.mas_equalTo(v1.mas_right);
        }];
        
        [v2 addSubview:self.btOnPay];
        [self.btOnPay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.height.mas_equalTo(v2);
        }];
        
        UIView* v3 = createView([UIColor clearColor]);
        [bottomView addSubview:v3];
        [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.top.width.mas_equalTo(v1);
            make.left.mas_equalTo(v2.mas_right);
        }];
        
        [v3 addSubview:self.btOnSend];
        [self.btOnSend mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.height.mas_equalTo(v3);
        }];
        
        UIView* v4 = createView([UIColor clearColor]);
        [bottomView addSubview:v4];
        [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.top.width.mas_equalTo(v1);
            make.left.mas_equalTo(v3.mas_right);
        }];
        
        [v4 addSubview:self.btOnReceive];
        [self.btOnReceive mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.height.mas_equalTo(v4);
        }];
        
        UIView* v5 = createView([UIColor clearColor]);
        [bottomView addSubview:v5];
        [v5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.top.width.mas_equalTo(v1);
            make.left.mas_equalTo(v4.mas_right);
        }];
        
        [v5 addSubview:self.btOnFinish];
        [self.btOnFinish mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.height.mas_equalTo(v5);
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
            object.userInteractionEnabled = YES;
            WeakSelf;
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]init];
            [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
                if ([TOSingleton sharedInstance].userInfo == nil) {
                    TOLoginViewController* vc = [[TOLoginViewController alloc]init];
                    [weakSelf.viewController.navigationController pushViewController:vc animated:YES];
                }
            }];
            [object addGestureRecognizer:tap];
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
            object.text = @"0次";
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
            object.text = @"0次";
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
            object.text = @"0元";
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
            object.text = @"0元";
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
            [object setTitle:@"查看全部" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:20];
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
            [object setTitle:@"待付款" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:20];
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
            [object setTitle:@"待发货" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:20];
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
            [object setTitle:@"待收货" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:20];
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
            [object setTitle:@"已完成" forState:UIControlStateNormal];
            object.titleLabel.font = [UIFont systemFontOfSize:12];
            [object layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleTop imageTitleSpace:5 small:20];
            object;
       });
    }
    return _btOnFinish;
}
@end
