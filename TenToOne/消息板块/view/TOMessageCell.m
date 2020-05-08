//
//  TOMessageCell.m
//  TenToOne
//
//  Created by hqtech on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMessageCell.h"

@interface TOMessageCell ()

@property(nonatomic,strong)UIImageView* ivAvatar;
@property(nonatomic,strong)UILabel* tvTitle;
@property(nonatomic,strong)UILabel* tvSummary;
@property(nonatomic,strong)UIImageView* ivMark;
@property(nonatomic,strong)UILabel* tvTime;
@property(nonatomic,strong)UILabel* tvCount;

@end

@implementation TOMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        [self.contentView addSubview:self.ivAvatar];
        [self.ivAvatar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(40);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.ivAvatar.mas_right).offset(10);
            make.bottom.mas_equalTo(self.ivAvatar.mas_centerY);
        }];
        
        [self.contentView addSubview:self.tvSummary];
        [self.tvSummary mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.ivAvatar.mas_right).offset(10);
            make.top.mas_equalTo(self.ivAvatar.mas_centerY).offset(5);
        }];
        
        [self.contentView addSubview:self.tvTime];
        [self.tvTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(self.tvTitle);
        }];
        
        [self.contentView addSubview:self.ivMark];
        [self.ivMark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.tvTime.mas_left).offset(-5);
            make.centerY.mas_equalTo(self.tvTime);
        }];
        
        [self.contentView addSubview:self.tvCount];
        [self.tvCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.tvTime);
            make.centerY.mas_equalTo(self.tvSummary);
            make.size.mas_equalTo(20);
        }];
    }
    return self;
}

- (UIImageView *)ivAvatar{
    if(!_ivAvatar){
        _ivAvatar = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_systemmsg"]];
            object.contentMode = UIViewContentModeScaleAspectFill;
            object;
       });
    }
    return _ivAvatar;
}

- (UILabel *)tvTitle{
    if(!_tvTitle){
        _tvTitle = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"消息标题";
            object.textColor = DefaultTextColor;
            object.font = [UIFont systemFontOfSize:18];
            object;
       });
    }
    return _tvTitle;
}

- (UILabel *)tvSummary{
    if(!_tvSummary){
        _tvSummary = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"消息简介";
            object.textColor = UIColorFromRGB(0x666666);
            object.font = [UIFont systemFontOfSize:12];
            object;
       });
    }
    return _tvSummary;
}

- (UIImageView *)ivMark{
    if(!_ivMark){
        _ivMark = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_bell"]];
            object.contentMode = UIViewContentModeScaleAspectFit;
            object;
       });
    }
    return _ivMark;
}

- (UILabel *)tvTime{
    if(!_tvTime){
        _tvTime = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"时间";
            object.textColor = DefaultTextColor;
            object.font = [UIFont systemFontOfSize:10];
            object;
       });
    }
    return _tvTime;
}

- (UILabel *)tvCount{
    if(!_tvCount){
        _tvCount = ({
            UILabel * object = [[UILabel alloc]init];
            object.text = @"0";
            object.backgroundColor = MainColor;
            object.textColor = [UIColor whiteColor];
            object.font = [UIFont systemFontOfSize:10];
            object.textAlignment = NSTextAlignmentCenter;
            object.layer.cornerRadius = 10;
            object.layer.masksToBounds = YES;
            object;
       });
    }
    return _tvCount;
}

@end
