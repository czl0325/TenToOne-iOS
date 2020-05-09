//
//  TOOrderCell.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOOrderCell.h"

@interface TOOrderCell ()

@property(nonatomic,strong)UILabel* tvType;
@property(nonatomic,strong)UILabel* tvStatus;
@property(nonatomic,strong)UIImageView* ivCover;
@property(nonatomic,strong)UILabel* tvTitle;
@property(nonatomic,strong)UILabel* tvLocal;
@property(nonatomic,strong)UILabel* tvReceiver;
@property(nonatomic,strong)UILabel* tvPrice;
@property(nonatomic,strong)UILabel* tvFree;
@property(nonatomic,strong)UILabel* tvTotal;

@end

@implementation TOOrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = WindowsBackColor;
        
        UIView* backView = createView([UIColor whiteColor]);
        backView.layer.cornerRadius = 5;
        [self.contentView addSubview:backView];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView).insets(UIEdgeInsetsMake(5, 10, 5, 10));
        }];
        
        [backView addSubview:self.tvType];
        [self.tvType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(15);
        }];
        
        [backView addSubview:self.tvStatus];
        [self.tvStatus mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(self.tvType);
        }];
        
        [backView addSubview:self.ivCover];
        [self.ivCover mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvType);
            make.top.mas_equalTo(self.tvType.mas_bottom).offset(10);
            make.size.mas_equalTo(85);
        }];
        
        [backView addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.ivCover.mas_right).offset(10);
            make.top.mas_equalTo(self.ivCover);
        }];
        
        UIImageView* ivLocal = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_localblack"]];
        [backView addSubview:ivLocal];
        [ivLocal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.tvTitle.mas_bottom).offset(8);
            make.left.mas_equalTo(self.tvTitle);
            make.size.mas_equalTo(CGSizeMake(15, 18));
        }];
        
        [backView addSubview:self.tvLocal];
        [self.tvLocal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(ivLocal.mas_right).offset(5);
            make.centerY.mas_equalTo(ivLocal);
        }];
        
        [backView addSubview:self.tvReceiver];
        [self.tvReceiver mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvTitle);
            make.top.mas_equalTo(ivLocal.mas_bottom).offset(10);
        }];
        
        [backView addSubview:self.tvPrice];
        [self.tvPrice mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.tvStatus);
            make.centerY.mas_equalTo(self.tvReceiver);
        }];
        
        [backView addSubview:self.tvFree];
        [self.tvFree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvTitle);
            make.top.mas_equalTo(self.tvReceiver.mas_bottom).offset(8);
        }];
        
        [backView addSubview:self.tvTotal];
        [self.tvTotal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.tvStatus);
            make.centerY.mas_equalTo(self.tvFree);
        }];
        [backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.tvTotal.mas_bottom).offset(8);
        }];
    }
    return self;
}

- (UILabel *)tvType{
    if(!_tvType){
        _tvType = ({
            UILabel * object = to_createLabel_text_color_font(@"购买订单", [UIColor blackColor], 14);
            object;
       });
    }
    return _tvType;
}

- (UILabel *)tvStatus{
    if(!_tvStatus){
        _tvStatus = ({
            UILabel * object = to_createLabel_text_color_font(@"已完成", MainColor, 12);
            object;
       });
    }
    return _tvStatus;
}

- (UIImageView *)ivCover{
    if(!_ivCover){
        _ivCover = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.backgroundColor = UIColorFromRGB(0x999999);
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivCover;
}

- (UILabel *)tvTitle{
    if(!_tvTitle){
        _tvTitle = ({
            UILabel * object = to_createLabel_text_color_font(@"商品标题", MainColor, 14);
            object;
       });
    }
    return _tvTitle;
}

- (UILabel *)tvLocal{
    if(!_tvLocal){
        _tvLocal = ({
            UILabel * object = to_createLabel_text_color_font(@"收件地址", DefaultTextColor, 14);
            object;
       });
    }
    return _tvLocal;
}

- (UILabel *)tvReceiver{
    if(!_tvReceiver){
        _tvReceiver = ({
            UILabel * object = to_createLabel_text_color_font(@"收件人", UIColorFromRGB(0x666666), 12);
            object;
       });
    }
    return _tvReceiver;
}

- (UILabel *)tvPrice {
    if(!_tvPrice){
        _tvPrice = ({
            UILabel * object = to_createLabel_black(@"￥200 x 1");
            object;
       });
    }
    return _tvPrice;
}

- (UILabel *)tvFree {
    if(!_tvFree){
        _tvFree = ({
            UILabel * object = to_createLabel_text_color_font(@"已中免单 100元", UIColorFromRGB(0x24A0E0), 12);
            object;
       });
    }
    return _tvFree;
}

- (UILabel *)tvTotal {
    if(!_tvTotal){
        _tvTotal = ({
            UILabel * object = to_createLabel_text_color_font(@"实付：0元", MainColor, 14);
            object;
       });
    }
    return _tvTotal;
}

@end
