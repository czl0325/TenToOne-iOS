//
//  TOFreeHeader.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOFreeHeader.h"

@interface TOFreeHeader ()

@end

@implementation TOFreeHeader

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UILabel* l1 = to_createLabel_black(@"免单群名");
        [self.contentView addSubview:l1];
        [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*0.5);
            make.centerY.mas_equalTo(self.contentView);
        }];
        UILabel* l2 = to_createLabel_black(@"免单人");
        [self.contentView addSubview:l2];
        [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*1.5);
            make.centerY.mas_equalTo(self.contentView);
        }];
        UILabel* l3 = to_createLabel_black(@"类型");
        [self.contentView addSubview:l3];
        [l3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*0.5+0.9*0.5);
            make.centerY.mas_equalTo(self.contentView);
        }];
        UILabel* l4 = to_createLabel_black(@"时间");
        [self.contentView addSubview:l4];
        [l4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*0.5+0.9*0.75);
            make.centerY.mas_equalTo(self.contentView);
        }];
    }
    return self;
}

@end
