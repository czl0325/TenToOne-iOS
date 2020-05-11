//
//  TOInputView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOInputView.h"

@interface TOInputView()

@property(nonatomic,strong)UILabel* tvTitle;
@property(nonatomic,strong)UITextField* tfDetail;
@property(nonatomic,strong)UILabel* tvUnit;

@end

@implementation TOInputView

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder {
    return [self initWithTitle:title placeholder:placeholder detail:@""];
}

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder detail:(NSString*)detail {
    return [self initWithTitle:title placeholder:placeholder detail:detail unit:@""];
}

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder detail:(NSString*)detail unit:(NSString*)unit {
    return [self initWithTitle:title placeholder:placeholder detail:detail unit:unit canEdit:YES];
}

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder detail:(NSString*)detail unit:(NSString*)unit canEdit:(BOOL)canEdit {
    return [self initWithTitle:title placeholder:placeholder detail:detail unit:unit canEdit:canEdit showLine:YES];
}

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder detail:(NSString*)detail unit:(NSString*)unit canEdit:(BOOL)canEdit showLine:(BOOL)show {
    if (self == [super initWithFrame:CGRectZero]) {
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.tvTitle];
        self.tvTitle.text = title;
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(10);
            make.width.mas_lessThanOrEqualTo(100);
        }];
        
        [self addSubview:self.tvUnit];
        [self.tvUnit mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.right.mas_equalTo(-10);
        }];
        self.tvUnit.text = unit;
        
        [self addSubview:self.tfDetail];
        self.tfDetail.placeholder = placeholder;
        self.tfDetail.text = detail;
        self.tfDetail.enabled = canEdit;
        [self.tfDetail mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(5);
            make.bottom.mas_equalTo(-5);
            if (self.tvUnit.text.length > 0) {
                make.right.mas_equalTo(self.tvUnit.mas_left).offset(-10);
            } else {
                make.right.mas_equalTo(-10);
            }
            make.left.mas_equalTo(self.tvTitle.mas_right).offset(10);
        }];
        
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

- (void)setKeyboard:(UIKeyboardType)keyboard {
    self.tfDetail.keyboardType = keyboard;
}


- (UILabel *)tvTitle{
    if(!_tvTitle){
        _tvTitle = ({
            UILabel * object = to_createLabel_black(@"标题");
            [object setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
            object;
       });
    }
    return _tvTitle;
}

- (UITextField *)tfDetail{
    if(!_tfDetail){
        _tfDetail = ({
            UITextField * object = [[UITextField alloc]init];
            object.backgroundColor = [UIColor clearColor];
            object.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            object.textAlignment = NSTextAlignmentRight;
            object.textColor = DefaultTextColor;
            object.font = DefaultFont;
            [object setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
            object;
       });
    }
    return _tfDetail;
}

- (UILabel *)tvUnit{
    if(!_tvUnit){
        _tvUnit = ({
            UILabel * object = to_createLabel_black(@"");
            [object setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
            object;
       });
    }
    return _tvUnit;
}


@end
