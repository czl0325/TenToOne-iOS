//
//  TOSearchNavbar.m
//  TenToOne
//
//  Created by hqtech on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSearchNavbar.h"
#import "ZLTextField.h"

@interface TOSearchNavbar()

@property(nonatomic,strong)ZLTextField* tfSearch;

@end

@implementation TOSearchNavbar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = MainColor;
        
        WeakSelf;
        UIButton* btCancel = to_create_button_normal(@"取消");
        btCancel.backgroundColor = UIColorFromRGB(0xE7ECF0);
        [btCancel setTitleColor:UIColorFromRGB(0x999999) forState:UIControlStateNormal];
        [[btCancel rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf.viewController.navigationController popViewControllerAnimated:YES];
        }];
        [self addSubview:btCancel];
        [btCancel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(65, 30));
            make.bottom.mas_equalTo(-7);
        }];
        
        [self addSubview:self.tfSearch];
        [self.tfSearch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.height.mas_equalTo(btCancel);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(btCancel.mas_left).offset(-10);
        }];
    }
    return self;
}

- (ZLTextField *)tfSearch{
    if(!_tfSearch){
        _tfSearch = ({
            ZLTextField* object = [[ZLTextField alloc]initWithImageName:@"icon_search" placeholder:@"请输入您想搜索的商户名称关键字"];
            object.backgroundColor = UIColorFromRGB(0xE7ECF0);
            object.textAlignment = NSTextAlignmentLeft;
            object.layer.cornerRadius = 7;
            object.layer.maskedCorners = YES;
            object.font = DefaultFont;
            object;
       });
    }
    return _tfSearch;
}

@end
