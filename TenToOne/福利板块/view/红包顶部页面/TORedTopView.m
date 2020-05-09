//
//  TORedTopView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TORedTopView.h"

@interface TORedTopView ()

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvMoney;

@end

@implementation TORedTopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {

        UIImageView* ivTop = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back_redtop"]];
        [self addSubview:ivTop];
        [ivTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        
        [self addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(60);
            make.top.mas_equalTo(5);
            make.centerX.mas_equalTo(self);
        }];
        
        [self addSubview:self.tvMoney];
        [self.tvMoney mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.ivAvatar.mas_bottom).offset(10);
            make.centerX.mas_equalTo(self);
        }];
        
        UILabel* l1 = to_createLabel_white(@"已存入余额");
        [self addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tvMoney.mas_bottom).offset(10);
            make.centerX.mas_equalTo(self);
        }];
        
        UILabel* l2 = to_createLabel_white(@"恭喜发财，大吉大利");
        [self addSubview:l2];
        [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(l1.mas_bottom).offset(8);
            make.centerX.mas_equalTo(self);
        }];
        
        UILabel* l3 = to_createLabel_white(@"点击加入群聊");
        [self addSubview:l3];
        [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(l2.mas_bottom).offset(8);
            make.centerX.mas_equalTo(self);
        }];
    }
    return self;
}


- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_defaultavatar"]];
            object.layer.cornerRadius = 30;
            object.layer.masksToBounds = YES;
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvMoney{
    if(!_tvMoney){
        _tvMoney = ({
            UILabel * object = to_createLabel_text_color_font(@"￥0.01", UIColorFromRGB(0xF7E412), 40);
            object;
       });
    }
    return _tvMoney;
}
@end
