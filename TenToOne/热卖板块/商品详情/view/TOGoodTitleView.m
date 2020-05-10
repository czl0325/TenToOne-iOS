//
//  TOGoodTitleView.m
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOGoodTitleView.h"

@interface TOGoodTitleView ()

@property(nonatomic,strong)UILabel* tvNewPrice;
@property(nonatomic,strong)UILabel* tvOldPrice;
@property(nonatomic,strong)UILabel* tvLastTime;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvStock;

@end

@implementation TOGoodTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.tvNewPrice];
        [self.tvNewPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(20);
        }];
        
        [self addSubview:self.tvOldPrice];
        [self.tvOldPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvNewPrice.mas_right).offset(5);
            make.baseline.mas_equalTo(self.tvNewPrice);
        }];
        
        [self addSubview:self.tvLastTime];
        [self.tvLastTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.baseline.mas_equalTo(self.tvNewPrice);
        }];
        
        [self addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvNewPrice);
            make.right.mas_equalTo(self.tvLastTime);
            make.top.mas_equalTo(self.tvNewPrice.mas_bottom).offset(15);
        }];
        
        [self addSubview:self.tvStock];
        [self.tvStock mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvNewPrice);
            make.top.mas_equalTo(self.tvName.mas_bottom).offset(15);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.tvStock.mas_bottom).offset(15);
        }];
    }
    return self;
}

- (UILabel *)tvNewPrice{
    if(!_tvNewPrice){
        _tvNewPrice = ({
            UILabel * object = to_createLabel_text_color_font(@"新价格", MainColor, 24);
            object;
       });
    }
    return _tvNewPrice;
}

- (UILabel *)tvOldPrice{
    if(!_tvOldPrice){
        _tvOldPrice = ({
            UILabel * object = to_createLabel_text_color(@"旧价格", UIColorFromRGB(0xFFA19C));
            object;
       });
    }
    return _tvOldPrice;
}

- (UILabel *)tvLastTime{
    if(!_tvLastTime){
        _tvLastTime = ({
            UILabel * object = to_createLabel_text_color(@"剩余时间:00:00:00", MainColor);
            object;
       });
    }
    return _tvLastTime;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = to_createLabel_text_color_font(@"商品标题", DefaultTextColor, 16);
            object.numberOfLines = 0;
            object.textAlignment = NSTextAlignmentLeft;
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvStock{
    if(!_tvStock){
        _tvStock = ({
            UILabel * object = to_createLabel_text_color(@"库存:0", UIColorFromRGB(0x888888));
            object;
       });
    }
    return _tvStock;
}

@end
