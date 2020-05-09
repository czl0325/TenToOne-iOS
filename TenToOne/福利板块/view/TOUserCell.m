//
//  TOUserCell.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOUserCell.h"

@interface TOUserCell()

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvName;

@end

@implementation TOUserCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self.contentView addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(36);
            make.centerX.mas_equalTo(self.contentView);
            make.top.mas_equalTo(0);
        }];
        
        [self.contentView addSubview:self.tvName];
        [self.tvName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.ivAvatar.mas_bottom).offset(5);
        }];
    }
    return self;
}


- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_defaultavatar"]];
            object.layer.cornerRadius = 18;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvName{
    if(!_tvName){
        _tvName = ({
            UILabel * object = to_createLabel_white(@"用户名");
            object;
       });
    }
    return _tvName;
}
@end
