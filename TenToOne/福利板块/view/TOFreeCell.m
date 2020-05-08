//
//  TOFreeCell.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOFreeCell.h"

@interface TOFreeCell ()

@property(nonatomic,strong)UILabel* tvGroupName;
@property(nonatomic,strong)UILabel* tvLucky;
@property(nonatomic,strong)UIImageView* ivType;
@property(nonatomic,strong)UILabel* tvTime;
@property(nonatomic,strong)UIImageView* ivRed;

@end

@implementation TOFreeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.tvGroupName];
        [self.tvGroupName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*0.5);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.tvLucky];
        [self.tvLucky mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*1.5);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.ivType];
        [self.ivType mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*0.5+0.9*0.5);
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(20);
        }];
        
        [self.contentView addSubview:self.tvTime];
        [self.tvTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.9*0.25*0.5+0.9*0.75);
            make.centerY.mas_equalTo(self.contentView);
        }];
        
        [self.contentView addSubview:self.ivRed];
        [self.ivRed mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self.contentView.mas_right).multipliedBy(0.95);
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(17, 22));
        }];
    }
    return self;
}


- (UILabel *)tvGroupName{
    if(!_tvGroupName){
        _tvGroupName = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.textAlignment = NSTextAlignmentCenter;
            object.text = @"100人消费群";
            object;
       });
    }
    return _tvGroupName;
}

- (UILabel *)tvLucky{
    if(!_tvLucky){
        _tvLucky = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.textAlignment = NSTextAlignmentCenter;
            object.text = @"幸运人";
            object;
       });
    }
    return _tvLucky;
}

- (UIImageView *)ivType{
    if(!_ivType){
        _ivType = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_member"]];
            object.contentMode = UIViewContentModeScaleAspectFit;
            object;
       });
    }
    return _ivType;
}

- (UILabel *)tvTime{
    if(!_tvTime){
        _tvTime = ({
            UILabel * object = [[UILabel alloc]init];
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            object.textAlignment = NSTextAlignmentCenter;
            object.text = @"刚刚";
            object;
       });
    }
    return _tvTime;
}

- (UIImageView *)ivRed{
    if(!_ivRed){
        _ivRed = ({
            UIImageView * object = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_red"]];
            object.contentMode = UIViewContentModeScaleAspectFit;
            object;
       });
    }
    return _ivRed;
}
@end
