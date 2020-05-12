//
//  TOTitleHeader.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/12.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOTitleHeader.h"

@interface TOTitleHeader ()

@end

@implementation TOTitleHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.tvTitle];
    [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(10);
    }];
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
