//
//  TOWelfareHeader.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOWelfareHeader.h"

@interface TOWelfareHeader ()

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UIButton* btGender;
@property(nonatomic,strong)UIButton* btLocation;
@property(nonatomic,strong)UILabel* tvFeeRank;
@property(nonatomic,strong)UILabel* tvRedRank;
@property(nonatomic,strong)UILabel* tvFeeAmount;
@property(nonatomic,strong)UILabel* tvRedAmount;

@end

@implementation TOWelfareHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        UIButton* btShare = to_create_button_backImage(@"icon_share");
        [self addSubview:btShare];
        [btShare mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(16, 18));
        }];
        
        [self addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(80);
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-20);
        }];
        
        [self addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.ivAvatar);
            make.left.mas_equalTo(self.ivAvatar.mas_right).offset(10);
        }];
        
        [self addSubview:self.tvFeeRank];
        [self.tvFeeRank mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.ivAvatar);
            make.left.mas_equalTo(self.tvName);
        }];
        
        [self addSubview:self.tvRedRank];
        [self.tvRedRank mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.tvFeeRank);
            make.left.mas_equalTo(self.mas_right).multipliedBy(0.65);
        }];
        
        [self addSubview:self.tvFeeAmount];
        [self.tvFeeAmount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.ivAvatar.mas_bottom).offset(-5);
            make.left.mas_equalTo(self.tvName);
        }];
        
        [self addSubview:self.tvRedAmount];
        [self.tvRedAmount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.tvFeeAmount);
            make.left.mas_equalTo(self.tvRedRank);
        }];
    }
    return self;
}


- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_defaultavatar"]];
            object.layer.cornerRadius = 40;
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = [UIFont systemFontOfSize:18];
            object;
       });
    }
    return _tvName;
}

- (UIButton *)btGender{
    if(!_btGender){
        _btGender = ({
            UIButton * object = [[UIButton alloc]init];
            object;
       });
    }
    return _btGender;
}

- (UIButton *)btLocation{
    if(!_btLocation){
        _btLocation = ({
            UIButton * object = [[UIButton alloc]init];
            object;
       });
    }
    return _btLocation;
}

- (UILabel *)tvFeeRank{
    if(!_tvFeeRank){
        _tvFeeRank = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.text = @"免单排行：";
            object;
       });
    }
    return _tvFeeRank;
}

- (UILabel *)tvRedRank{
    if(!_tvRedRank){
        _tvRedRank = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.text = @"红包排行：";
            object;
       });
    }
    return _tvRedRank;
}

- (UILabel *)tvFeeAmount{
    if(!_tvFeeAmount){
        _tvFeeAmount = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.text = @"已免金额：";
            object;
       });
    }
    return _tvFeeAmount;
}

- (UILabel *)tvRedAmount{
    if(!_tvRedAmount){
        _tvRedAmount = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.text = @"已抢红包：";
            object;
       });
    }
    return _tvRedAmount;
}
@end
