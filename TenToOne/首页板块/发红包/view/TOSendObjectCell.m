//
//  TOSendObjectCell.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSendObjectCell.h"

@interface TOSendObjectCell()

@end

@implementation TOSendObjectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.left.mas_equalTo(10);
        }];
        
        [self.contentView addSubview:self.ivCheck];
        [self.ivCheck mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(14);
        }];
    }
    return self;
}

- (UILabel *)tvTitle{
    if(!_tvTitle){
        _tvTitle = ({
            UILabel * object = to_createLabel_black(@"");
            object;
       });
    }
    return _tvTitle;
}

- (UIImageView *)ivCheck{
    if(!_ivCheck){
        _ivCheck = ({
            UIImageView * object = to_create_imageview(@"icon_unselect");
            object;
       });
    }
    return _ivCheck;
}

@end
