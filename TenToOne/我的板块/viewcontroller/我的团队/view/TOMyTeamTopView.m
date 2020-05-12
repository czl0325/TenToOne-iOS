//
//  TOMyTeamTopView.m
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMyTeamTopView.h"

@interface TOMyTeamTopView()

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvCommission;
@property(nonatomic,strong)UILabel* tvTeamNumber;

@end

@implementation TOMyTeamTopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        UIImageView* back1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back_redtopsmall"]];
        [self addSubview:back1];
        [back1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self);
        }];
        
        UIView* back2 = createView([UIColor whiteColor]);
        back2.layer.cornerRadius = 10;
        [self addSubview:back2];
        [back2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(18);
            make.right.mas_equalTo(-18);
            make.top.mas_equalTo(33);
            make.height.mas_equalTo(120);
        }];
        
        [self addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(66);
            make.top.mas_equalTo(self);
            make.left.mas_equalTo(back2).offset(20);
        }];
        
        [self addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.ivAvatar);
            make.left.mas_equalTo(self.ivAvatar.mas_right).offset(10);
        }];
        
        [self addSubview:self.tvCommission];
        [self.tvCommission mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.25);
            make.top.mas_equalTo(self.ivAvatar.mas_bottom).offset(20);
        }];
        
        UILabel *l1 = to_createLabel_black(@"团队佣金（元）");
        [self addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tvCommission);
            make.top.mas_equalTo(self.tvCommission.mas_bottom).offset(8);
        }];
        
        [self addSubview:self.tvTeamNumber];
        [self.tvTeamNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.mas_right).multipliedBy(0.75);
            make.centerY.mas_equalTo(self.tvCommission);
        }];
        
        UILabel *l2 = to_createLabel_black(@"团队人数");
        [self addSubview:l2];
        [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tvTeamNumber);
            make.top.mas_equalTo(self.tvTeamNumber.mas_bottom).offset(8);
        }];
        
        UIView* line = createView(WindowsBackColor);
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(40);
            make.width.mas_equalTo(2);
            make.top.mas_equalTo(self.tvCommission);
        }];
    }
    return self;
}


- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_defaultavatar"]];
            object.layer.cornerRadius = 33;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = to_createLabel_text_color_font(@"用户名", UIColorFromRGB(0x444444), 16);
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvCommission{
    if(!_tvCommission){
        _tvCommission = ({
            UILabel * object = to_createLabel_text_color_font(@"0.0", UIColorFromRGB(0x444444), 16);
            object;
       });
    }
    return _tvCommission;
}

- (UILabel *)tvTeamNumber{
    if(!_tvTeamNumber){
        _tvTeamNumber = ({
            UILabel * object = to_createLabel_text_color_font(@"0人", UIColorFromRGB(0x444444), 16);
            object;
       });
    }
    return _tvTeamNumber;
}

@end
