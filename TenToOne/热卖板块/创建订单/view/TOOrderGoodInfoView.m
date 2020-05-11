//
//  TOOrderGoodInfoView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOOrderGoodInfoView.h"

@interface  TOOrderGoodInfoView()

@property(nonatomic,strong)UIImageView* ivCover;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvPrice;
@property(nonatomic,strong)UILabel* tvCount;

@end

@implementation TOOrderGoodInfoView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        
        [self addSubview:self.ivCover];
        [self.ivCover mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(80);
            make.top.mas_equalTo(8);
            make.left.mas_equalTo(10);
        }];
        
        [self addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.ivCover);
            make.left.mas_equalTo(self.ivCover.mas_right).offset(10);
            make.right.mas_equalTo(-10);
        }];
        
        UILabel* l1 = to_createLabel_text_color(@"特价商品如需调换请联系商家", MainColor);
        [self addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.ivCover);
            make.left.mas_equalTo(self.tvName);
        }];
        
        [self addSubview:self.tvPrice];
        [self.tvPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(l1.mas_top).offset(-8);
            make.left.mas_equalTo(self.tvName);
        }];
        
        [self addSubview:self.tvCount];
        [self.tvCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.tvPrice.mas_bottom);
            make.right.mas_equalTo(self.tvName);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.ivCover.mas_bottom).offset(8);
        }];
    }
    return self;
}


- (UIImageView *)ivCover{
    if(!_ivCover){
        _ivCover = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object.backgroundColor = UIColorFromRGB(0xcccccc);
            object;
       });
    }
    return _ivCover;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = to_createLabel_black(@"商品标题");
            object.numberOfLines = 0;
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvPrice{
    if(!_tvPrice){
        _tvPrice = ({
            UILabel * object = to_createLabel_text_color(@"￥0", MainColor);
            object;
       });
    }
    return _tvPrice;
}

- (UILabel *)tvCount{
    if(!_tvCount){
        _tvCount = ({
            UILabel * object = to_createLabel_black(@"x 1");
            object;
       });
    }
    return _tvCount;
}
@end
