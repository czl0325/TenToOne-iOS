//
//  TOSendRedHeader.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSendRedHeader.h"
#import "TOInputView.h"
#import "TOTitleView.h"
#import "ZLTextField.h"
#import "TOChooseSendObjectViewController.h"

@interface TOSendRedHeader ()

@property(nonatomic,strong)TOInputView* vMoney;
@property(nonatomic,strong)TOInputView* vCount;
@property(nonatomic,strong)TOTitleView* vObject;
@property(nonatomic,strong)UILabel* tvLocal;
@property(nonatomic,strong)ZLTextField* tfRemark;
@property(nonatomic,strong)ZLTextField* tfUrl;

@end

@implementation TOSendRedHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self addSubview:self.vMoney];
        [self.vMoney mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(40);
            make.top.mas_equalTo(5);
        }];
        
        [self addSubview:self.vCount];
        [self.vCount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.mas_equalTo(self.vMoney);
            make.top.mas_equalTo(self.vMoney.mas_bottom).offset(5);
        }];
        
        [self addSubview:self.vObject];
        [self.vObject mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.mas_equalTo(self.vMoney);
            make.top.mas_equalTo(self.vCount.mas_bottom).offset(5);
        }];
        
        UIView* view1 = createView([UIColor whiteColor]);
        view1.layer.cornerRadius = 5;
        [self addSubview:view1];
        [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.mas_equalTo(self.vMoney);
            make.top.mas_equalTo(self.vObject.mas_bottom).offset(5);
        }];
        
        UIImageView* iv1 = to_create_imageview(@"icon_localredsolid");
        [view1 addSubview:iv1];
        [iv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(view1);
            make.left.mas_equalTo(10);
        }];
        
        [view1 addSubview:self.tvLocal];
        [self.tvLocal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(view1);
            make.left.mas_equalTo(iv1.mas_right).offset(10);
        }];
        
        [self addSubview:self.tfRemark];
        [self.tfRemark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.mas_equalTo(self.vMoney);
            make.top.mas_equalTo(view1.mas_bottom).offset(5);
        }];
        
        [self addSubview:self.tfUrl];
        [self.tfUrl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.height.mas_equalTo(self.vMoney);
            make.top.mas_equalTo(self.tfRemark.mas_bottom).offset(5);
        }];
    }
    return self;
}

- (TOInputView *)vMoney{
    if(!_vMoney){
        _vMoney = ({
            TOInputView* object = [[TOInputView alloc]initWithTitle:@"红包金额" placeholder:@"0.0" detail:@"" unit:@"元"];
            object.layer.cornerRadius = 5;
            [object setKeyboard:UIKeyboardTypeDecimalPad];
            object;
       });
    }
    return _vMoney;
}

- (TOInputView *)vCount{
    if(!_vCount){
        _vCount = ({
            TOInputView* object = [[TOInputView alloc]initWithTitle:@"红包个数" placeholder:@"填写个数" detail:@"" unit:@"个"];
            object.layer.cornerRadius = 5;
            [object setKeyboard:UIKeyboardTypePhonePad];
            object;
       });
    }
    return _vCount;
}

- (TOTitleView *)vObject{
    if(!_vObject){
        _vObject = ({
            TOTitleView* object = [[TOTitleView alloc]initWithTitle:@"选择投放对象" detail:@"全部投放"];
            object.layer.cornerRadius = 5;
            WeakSelf;
            UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]init];
            [[tap rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
                TOChooseSendObjectViewController* vc = [[TOChooseSendObjectViewController alloc]init];
                [weakSelf.viewController.navigationController pushViewController:vc animated:YES];
            }];
            [object addGestureRecognizer:tap];
            object;
       });
    }
    return _vObject;
}

- (UILabel *)tvLocal{
    if(!_tvLocal){
        _tvLocal = ({
            UILabel* object = to_createLabel_text_color(@"福建省-厦门市", MainColor);
            object;
       });
    }
    return _tvLocal;
}

- (ZLTextField *)tfRemark{
    if(!_tfRemark){
        _tfRemark = ({
            ZLTextField* object = [[ZLTextField alloc]initWithTextRight:@"" placeholder:@"请输入你想说的内容最多十二个字符"];
            object.leftWidth = 10;
            object.rightWidth = 10;
            object.backgroundColor = [UIColor whiteColor];
            object.textAlignment = NSTextAlignmentLeft;
            object.layer.cornerRadius = 5;
            object.font = DefaultFont;
            object;
       });
    }
    return _tfRemark;
}

- (ZLTextField *)tfUrl{
    if(!_tfUrl){
        _tfUrl = ({
            ZLTextField* object = [[ZLTextField alloc]initWithTextRight:@"" placeholder:@"请输入广告链接网址"];
            object.leftWidth = 10;
            object.rightWidth = 10;
            object.keyboardType = UIKeyboardTypeURL;
            object.backgroundColor = [UIColor whiteColor];
            object.textAlignment = NSTextAlignmentLeft;
            object.layer.cornerRadius = 5;
            object.font = DefaultFont;
            object;
       });
    }
    return _tfUrl;
}

@end
