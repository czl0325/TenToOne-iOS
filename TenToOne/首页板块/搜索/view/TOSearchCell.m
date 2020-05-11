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

@end

@implementation TOSearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.ivCover];
        [self.ivCover mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(60);
            make.left.mas_equalTo(10);
            make.centerY.mas_equalTo(self.contentView);
        }];
    }
    return self;
}
@end
