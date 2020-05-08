//
//  TOHotCell.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOHotCell.h"

@interface TOHotCell ()

@property(nonatomic,strong)UIImageView* ivCover;
@property(nonatomic,strong)UILabel* tvLastTime;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvNewPrice;
@property(nonatomic,strong)UILabel* tvOldPrice;
@property(nonatomic,strong)UILabel* tvPayCount;

@end

@implementation TOHotCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.cornerRadius = 10;
        self.contentView.layer.masksToBounds = YES;
        
        [self.contentView addSubview:self.ivCover];
        self.ivCover.backgroundColor = [UIColor yellowColor];
        [self.ivCover mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.mas_equalTo(self.contentView);
            make.height.mas_equalTo(100);
        }];
        
        [self.contentView addSubview:self.tvLastTime];
        [self.tvLastTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.mas_equalTo(self.ivCover);
            make.height.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.right.mas_equalTo(-5);
            make.top.mas_equalTo(self.ivCover.mas_bottom).offset(5);
        }];

        [self.contentView addSubview:self.tvNewPrice];
        [self.tvNewPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvName);
            make.top.mas_equalTo(self.tvName.mas_bottom).offset(5);
        }];

        [self.contentView addSubview:self.tvOldPrice];
        [self.tvOldPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvNewPrice.mas_right).offset(5);
            make.baseline.mas_equalTo(self.tvNewPrice);
        }];

        [self.contentView addSubview:self.tvPayCount];
        [self.tvPayCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvName);
            make.top.mas_equalTo(self.tvNewPrice.mas_bottom).offset(5);
            make.bottom.mas_equalTo(-5);
        }];
    }
    return self;
}

- (void)updateHotCell {
    self.tvName.text = @"商品名称";
    self.tvNewPrice.text = @"￥20.00";
    self.tvOldPrice.text = @"￥50.00";
    self.tvPayCount.text = @"5万人购买";
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.tvOldPrice.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle)  range:NSMakeRange(0, self.tvOldPrice.text.length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:MainColor range:NSMakeRange(0, self.tvOldPrice.text.length)];
    [self.tvOldPrice setAttributedText:attri];
}

- (UIImageView *)ivCover{
    if(!_ivCover){
        _ivCover = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivCover;
}

- (UILabel *)tvLastTime{
    if(!_tvLastTime){
        _tvLastTime = ({
            UILabel * object = [[UILabel alloc]init];
            object.backgroundColor = MainColor;
            object.text = @"剩余时间:";
            object.textAlignment = NSTextAlignmentCenter;
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:10];
            object;
       });
    }
    return _tvLastTime;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.numberOfLines = 0;
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvNewPrice{
    if(!_tvNewPrice){
        _tvNewPrice = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = MainColor;
            object.font = [UIFont systemFontOfSize:18];
            object;
       });
    }
    return _tvNewPrice;
}

- (UILabel *)tvOldPrice{
    if(!_tvOldPrice){
        _tvOldPrice = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = UIColorFromRGB(0xFFA19C);
            object.font = [UIFont systemFontOfSize:10];
            object;
       });
    }
    return _tvOldPrice;
}

- (UILabel *)tvPayCount{
    if(!_tvPayCount){
        _tvPayCount = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = UIColorFromRGB(0x999999);
            object.font = [UIFont systemFontOfSize:10];
            object;
       });
    }
    return _tvPayCount;
}
@end
