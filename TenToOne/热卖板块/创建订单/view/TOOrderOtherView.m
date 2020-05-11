//
//  TOOrderOtherView.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOOrderOtherView.h"
#import "TOInputView.h"

@interface TOOrderOtherView()

@property(nonatomic,strong)TOInputView* vDeduction;
@property(nonatomic,strong)TOInputView* vFreight;
@property(nonatomic,strong)TOInputView* vRemark;

@end

@implementation TOOrderOtherView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        
        [self addSubview:self.vDeduction];
        [self.vDeduction mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.mas_equalTo(self);
            make.height.mas_equalTo(40);
        }];
        
        [self addSubview:self.vFreight];
        [self.vFreight mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.left.right.mas_equalTo(self.vDeduction);
            make.top.mas_equalTo(self.vDeduction.mas_bottom);
        }];
        
        [self addSubview:self.vRemark];
        [self.vRemark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.left.right.mas_equalTo(self.vDeduction);
            make.top.mas_equalTo(self.vFreight.mas_bottom);
        }];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.vRemark.mas_bottom);
        }];
    }
    return self;
}


- (TOInputView *)vDeduction{
    if(!_vDeduction){
        _vDeduction = ({
            TOInputView * object = [[TOInputView alloc]initWithTitle:@"购物券抵扣" placeholder:@"请输入抵扣金额"];
            object;
       });
    }
    return _vDeduction;
}

- (TOInputView *)vFreight{
    if(!_vFreight){
        _vFreight = ({
            TOInputView * object = [[TOInputView alloc]initWithTitle:@"运费" placeholder:@"" detail:@"免运费" canEdit:NO];
            object;
       });
    }
    return _vFreight;
}

- (TOInputView *)vRemark{
    if(!_vRemark){
        _vRemark = ({
            TOInputView * object = [[TOInputView alloc]initWithTitle:@"备注" placeholder:@"请输入您需要备注的内容(最多70个字符)"];
            object;
       });
    }
    return _vRemark;
}
@end
