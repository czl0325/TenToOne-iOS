//
//  TOSwitchView.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSwitchView.h"

@interface TOSwitchView()

@property(nonatomic,strong)UILabel* tvTitle;
@property(nonatomic,strong)UISwitch* swOn;

@end

@implementation TOSwitchView

- (instancetype)initWithTitle:(NSString*)title {
    return [self initWithTitle:title showLine:YES];
}

- (instancetype)initWithTitle:(NSString*)title showLine:(BOOL)show {
    if (self == [super initWithFrame:CGRectZero]) {
        self.isOn = YES;
        
        [self addSubview:self.tvTitle];
        [self.tvTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(10);
        }];
        self.tvTitle.text = title;
        
        [self addSubview:self.swOn];
        [self.swOn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(50, 30));
        }];
        self.swOn.on = self.isOn;
        
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

- (void)setIsOn:(BOOL)isOn {
    _isOn = isOn;
    self.swOn.on = isOn;
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

- (UISwitch *)swOn{
    if(!_swOn){
        _swOn = ({
            UISwitch * object = [[UISwitch alloc]init];
            object.tintColor = UIColorFromRGB(0x999999);
            object.onTintColor = MainColor;
            object.thumbTintColor = [UIColor whiteColor];
            object;
       });
    }
    return _swOn;
}

@end
