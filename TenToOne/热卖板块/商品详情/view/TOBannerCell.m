//
//  TOBannerCell.m
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOBannerCell.h"

@interface TOBannerCell()

@property(nonatomic,strong)UIImageView* ivBanner;

@end

@implementation TOBannerCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self.contentView addSubview:self.ivBanner];
        [self.ivBanner mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (UIImageView *)ivBanner{
    if(!_ivBanner){
        _ivBanner = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivBanner;
}

@end
