//
//  TOAddressCell.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOAddressCell.h"

@interface TOAddressCell ()

@property(nonatomic,strong)UIImageView* ivLocation;
@property(nonatomic,strong)UILabel* tvName;
@property(nonatomic,strong)UILabel* tvMobile;
@property(nonatomic,strong)UILabel* tvAddress;
@property(nonatomic,strong)UILabel* tvDefault;
@property(nonatomic,strong)UIButton* btDelete;

@end

@implementation TOAddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.ivLocation];
        [self.ivLocation mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView);
        }];
    }
    return self;
}


- (UIImageView *)ivLocation{
    if(!_ivLocation){
        _ivLocation = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_localblack"]];
            object;
       });
    }
    return _ivLocation;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = to_createLabel_text_color_font(@"姓名", [UIColor whiteColor], 18);
            object;
       });
    }
    return _tvName;
}

- (UILabel *)tvMobile{
    if(!_tvMobile){
        _tvMobile = ({
            UILabel * object = to_createLabel_white(@"**********");
            object;
       });
    }
    return _tvMobile;
}

- (UILabel *)tvAddress{
    if(!_tvAddress){
        _tvAddress = ({
            UILabel * object = to_createLabel_white(@"地址信息");
            object;
       });
    }
    return _tvAddress;
}

- (UILabel *)tvDefault{
    if(!_tvDefault){
        _tvDefault = ({
            UILabel * object = [[UILabel alloc]init];
            object;
       });
    }
    return _tvDefault;
}

- (UIButton *)btDelete{
    if(!_btDelete){
        _btDelete = ({
            UIButton * object = [[UIButton alloc]init];
            object;
       });
    }
    return _btDelete;
}
@end
