//
//  TORegionView.m
//  TenToOne
//
//  Created by hqtech on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TORegionView.h"

@interface TORegionView ()

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvRegion;
@property(nonatomic,strong)UILabel* tvIdentity;

@end

@implementation TORegionView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(35);
            make.left.centerY.mas_equalTo(self);
        }];
        
        [self addSubview:self.tvRegion];
        [self.tvRegion mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.ivAvatar.mas_right).offset(5);
            make.top.mas_equalTo(self.ivAvatar);
        }];
        
        [self addSubview:self.tvIdentity];
        [self.tvIdentity mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.tvRegion);
            make.bottom.mas_equalTo(self.ivAvatar);
        }];
    }
    return self;
}

- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_defaultavatar"]];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvRegion{
    if(!_tvRegion){
        _tvRegion = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"福州";
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:16];
            object;
       });
    }
    return _tvRegion;
}

- (UILabel *)tvIdentity{
    if(!_tvIdentity){
        _tvIdentity = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"代理";
            object.textColor = [UIColor whiteColor];
            object.font = DefaultFont;
            object;
       });
    }
    return _tvIdentity;
}
@end
