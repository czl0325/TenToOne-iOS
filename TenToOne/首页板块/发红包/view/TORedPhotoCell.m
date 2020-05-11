//
//  TORedPhotoCell.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TORedPhotoCell.h"

@interface TORedPhotoCell ()

@property(nonatomic,strong)UIImageView* ivPhoto;

@end

@implementation TORedPhotoCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = YES;
        
        [self.contentView addSubview:self.ivPhoto];
        [self.ivPhoto mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

- (void)setImageForPhoto:(UIImage *)imageForPhoto {
    _imageForPhoto = imageForPhoto;
    self.ivPhoto.image = imageForPhoto;
    if ([imageForPhoto isEqual:[UIImage imageNamed:@"icon_addblack"]]) {
        self.ivPhoto.contentMode = UIViewContentModeCenter;
    } else {
        self.ivPhoto.contentMode = UIViewContentModeScaleAspectFill;
    }
}

- (UIImageView *)ivPhoto{
    if(!_ivPhoto){
        _ivPhoto = ({
            UIImageView * object = [[UIImageView alloc]init];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivPhoto;
}

@end
