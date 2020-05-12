//
//  TOSearchCell.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSearchCell.h"

@interface TOSearchCell()

@property(nonatomic,strong)UIImageView* ivCover;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvSale;
@property(nonatomic,strong)UILabel* tvDistance;
@property(nonatomic,strong)UILabel* tvAddress;
@property(nonatomic,strong)zhImageButton* btGo;

@end

@implementation TOSearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.ivCover];
        [self.ivCover mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(65);
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.ivCover);
            make.left.mas_equalTo(self.ivCover.mas_right).offset(5);
        }];
        
        [self.contentView addSubview:self.tvSale];
        [self.tvSale mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tvName.mas_bottom).offset(0);
            make.left.mas_equalTo(self.tvName);
        }];
        
        [self.contentView addSubview:self.tvDistance];
        [self.tvDistance mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tvSale.mas_bottom).offset(0);
            make.left.mas_equalTo(self.tvName);
        }];
        
        [self.contentView addSubview:self.tvAddress];
        [self.tvAddress mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.ivCover);
            make.left.mas_equalTo(self.tvName);
        }];
        
        [self.contentView addSubview:self.btGo];
        [self.btGo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (UIImageView *)ivCover{
    if(!_ivCover){
        _ivCover = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.backgroundColor = UIColorFromRGB(0XCCCCCC);
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivCover;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = to_createLabel_text_color_font(@"商品名称", MainColor, 16);
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvSale{
    if(!_tvSale){
        _tvSale = ({
            UILabel * object = to_createLabel_text_color(@"已售0", UIColorFromRGB(0x666666));
            object;
       });
    }
    return _tvSale;
}

- (UILabel *)tvDistance{
    if(!_tvDistance){
        _tvDistance = ({
            UILabel * object = to_createLabel_text_color(@"距离0", UIColorFromRGB(0x666666));
            object;
       });
    }
    return _tvDistance;
}

- (UILabel *)tvAddress{
    if(!_tvAddress){
        _tvAddress = ({
            UILabel * object = to_createLabel_text_color(@"详细地址", UIColorFromRGB(0x666666));
            object;
       });
    }
    return _tvAddress;
}

- (zhImageButton *)btGo{
    if(!_btGo){
        _btGo = ({
            zhImageButton * object = [zhImageButton buttonWithType:UIButtonTypeCustom];
            [object setImage:[UIImage imageNamed:@"icon_step"] forState:UIControlStateNormal];
            [object setTitle:@"到这去" forState:UIControlStateNormal];
            [object setTitleColor:MainColor forState:UIControlStateNormal];
            object.titleLabel.font = DefaultFont;
            [object imagePosition:zhImageButtonPositionTop spacing:5];
            object;
       });
    }
    return _btGo;
}
@end
