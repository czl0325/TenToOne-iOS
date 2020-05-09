//
//  TOTitleView.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOTitleView.h"

@interface TOTitleView ()

@property(nonatomic,strong)UILabel* tvTitle;
@property(nonatomic,strong)UILabel* tvDetail;

@end

@implementation TOTitleView

- (instancetype)initWithTitle:(NSString*)title {
    return [self initWithTitle:title detail:@""];
}

- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail {
    return [self initWithTitle:title detail:@"" showLine:YES];
}

- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail showLine:(BOOL)show {
    return [self initWithTitle:title detail:detail showLine:show showArraw:YES];
}

- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail showLine:(BOOL)show showArraw:(BOOL)show2 {
    if (self == [super initWithFrame:CGRectZero]) {
        [self addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(10);
        }];
        self.tvTitle.text = title;
       
        UIImageView* iv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_arrowright"]];
        [self addSubview:iv];
        [iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.right.mas_equalTo(-10);
        }];
        iv.hidden = !show2;
        
        [self addSubview:self.tvDetail];
        [self.tvDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.right.mas_equalTo(iv.mas_left).offset(-10);
        }];
        self.tvDetail.text = detail;
       
       UIView* line = createView(WindowsBackColor);
       [self addSubview:line];
       [line mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.bottom.right.mas_equalTo(self);
           make.height.mas_equalTo(1);
       }];
        line.hidden = !show;
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

- (UILabel *)tvDetail{
    if(!_tvDetail){
        _tvDetail = ({
            UILabel * object = to_createLabel_black(@"标题");
            object;
       });
    }
    return _tvDetail;
}
@end
