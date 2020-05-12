//
//  TOLabelCell.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/12.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOLabelCell.h"

@interface TOLabelCell ()

@end

@implementation TOLabelCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        [self.contentView addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.mas_equalTo(self.contentView);
        }];
    }
    return self;
}


- (UILabel *)tvTitle{
    if(!_tvTitle){
        _tvTitle = ({
            UILabel * object = to_createLabel_black(@"标题");
            object;
       });
    }
    return _tvTitle;
}
@end
