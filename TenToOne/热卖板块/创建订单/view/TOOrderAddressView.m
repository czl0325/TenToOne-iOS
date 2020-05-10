//
//  TOOrderAddressView.m
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOOrderAddressView.h"

@interface TOOrderAddressView()

@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvMobile;
@property(nonatomic,strong)UILabel* tvAddress;
@property(nonatomic,strong)UILabel* tvDefault;

@end

@implementation TOOrderAddressView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        
        UIImageView* iv1 = to_create_imageview(@"icon_localred");
        [self addSubview:iv1];
        [iv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(15);
            make.left.mas_equalTo(8);
            make.size.mas_equalTo(CGSizeMake(31, 40));
        }];
        
        [self addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(iv1);
            make.left.mas_equalTo(iv1.mas_right).offset(10);
        }];
        
        [self addSubview:self.tvMobile];
        [self.tvMobile mas_makeConstraints:^(MASConstraintMaker *make) {
            make.baseline.mas_equalTo(self.tvName);
            make.left.mas_equalTo(self.tvName.mas_right).offset(5);
        }];
        
        UIImageView* iv2 = to_create_imageview(@"icon_arrowright");
        [self addSubview:iv2];
        [iv2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(iv1);
            make.right.mas_equalTo(-8);
            make.size.mas_equalTo(CGSizeMake(7, 12));
        }];
        
        [self addSubview:self.tvAddress];
        [self.tvAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(iv1.mas_bottom).offset(-12);
            make.left.mas_equalTo(self.tvName);
            make.right.mas_equalTo(iv2.mas_left).offset(-10);
        }];
        
        [self addSubview:self.tvDefault];
        [self.tvDefault mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.tvName);
            make.right.mas_equalTo(iv2.mas_left).offset(-10);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.tvAddress.mas_bottom).offset(15);
        }];
    }
    return self;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = to_createLabel_text_color_font(@"姓名", DefaultTextColor, 16);
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvMobile{
    if(!_tvMobile){
        _tvMobile = ({
            UILabel * object = to_createLabel_text_color(@"189****0330", UIColorFromRGB(0x666666));
            object;
       });
    }
    return _tvMobile;
}

- (UILabel *)tvAddress{
    if(!_tvAddress){
        _tvAddress = ({
            UILabel * object = to_createLabel_black(@"详细地址");
            object.textAlignment = NSTextAlignmentLeft;
            object.numberOfLines = 0;
            object;
       });
    }
    return _tvAddress;
}

- (UILabel *)tvDefault{
    if(!_tvDefault){
        _tvDefault = ({
            UILabel * object = to_createLabel_black(@"默认");
            object;
       });
    }
    return _tvDefault;
}

@end
