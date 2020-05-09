//
//  TOLoginViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOLoginViewController.h"
#import "ZLTextField.h"
#import "TOVerifyViewController.h"

@interface TOLoginViewController ()

@property(nonatomic,strong)ZLTextField* tfMobile;
@property(nonatomic,strong)UIButton* btNext;

@property(nonatomic,strong)UIButton* btAgree;
@property(nonatomic,strong)UIButton* btQQ;
@property(nonatomic,strong)UIButton* btWechat;
@property(nonatomic,strong)UIButton* btWeibo;

@end

@implementation TOLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView* ivLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_logo"]];
    [self.view addSubview:ivLogo];
    [ivLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(140);
        make.top.mas_equalTo(90);
    }];
    
    [self.view addSubview:self.tfMobile];
    [self.tfMobile mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(ivLogo.mas_bottom).offset(50);
        make.size.mas_equalTo(CGSizeMake(250, 30));
    }];
    
    [self.view addSubview:self.btNext];
    [self.btNext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tfMobile.mas_bottom).offset(40);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(230, 40));
    }];
    
    [self.view addSubview:self.btAgree];
    [self.btAgree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-15);
        make.centerX.mas_equalTo(self.view);
    }];
    
    [self.view addSubview:self.btWechat];
    [self.btWechat mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.btAgree.mas_top).offset(-30);
        make.centerX.mas_equalTo(self.view.mas_right).multipliedBy(0.25);
        make.size.mas_equalTo(35);
    }];
    
    [self.view addSubview:self.btQQ];
    [self.btQQ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.btWechat);
        make.centerX.mas_equalTo(self.view.mas_right).multipliedBy(0.5);
        make.size.mas_equalTo(self.btWechat);
    }];
    
    [self.view addSubview:self.btWeibo];
    [self.btWeibo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.btWechat);
        make.centerX.mas_equalTo(self.view.mas_right).multipliedBy(0.75);
        make.size.mas_equalTo(self.btWechat);
    }];
    
    UILabel *l1 = to_createLabel_black(@"更多登录方式");
    l1.textColor = UIColorFromRGB(0x999999);
    [self.view addSubview:l1];
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.btWechat.mas_top).offset(-40);
    }];
    
    UIView* line1 = createView(UIColorFromRGB(0x999999));
    [self.view addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(l1);
        make.right.mas_equalTo(l1.mas_left).offset(-10);
        make.left.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
    
    UIView* line2 = createView(UIColorFromRGB(0x999999));
    [self.view addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(l1);
        make.left.mas_equalTo(l1.mas_right).offset(10);
        make.right.mas_equalTo(self.view);
        make.height.mas_equalTo(1);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO];
}

- (void)dealloc {
    
}

-(void)textFieldChanged:(ZLTextField *)textField {
    if (textField.text.length == 11) {
        self.btNext.enabled = YES;
    } else {
        self.btNext.enabled = NO;
    }
}

- (ZLTextField *)tfMobile{
    if(!_tfMobile){
        _tfMobile = ({
            ZLTextField * object = [[ZLTextField alloc]init];
            object.drawUnderline = YES;
            object.placeholder = @"请输入手机号码";
            object.font = [UIFont systemFontOfSize:14];
            object.keyboardType = UIKeyboardTypePhonePad;
            [object addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
            object;
       });
    }
    return _tfMobile;
}

- (UIButton *)btNext{
    if(!_btNext){
        _btNext = ({
            UIButton * object = to_create_button_normal(@"下一步");
            [object setBackgroundImage:imageWithColor(MainColor, CGSizeMake(230, 40), 1) forState:UIControlStateNormal];
            [object setBackgroundImage:imageWithColor(UIColorFromRGB(0xFFA19C), CGSizeMake(230, 40), 1) forState:UIControlStateDisabled];
            object.enabled = NO;
            WeakSelf;
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                TOVerifyViewController* vc = [[TOVerifyViewController alloc]init];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            }];
            object;
       });
    }
    return _btNext;
}

- (UIButton *)btAgree{
    if(!_btAgree){
        _btAgree = ({
            UIButton * object = to_create_button_left(@"我已经同意用户协议和隐私政策", @"icon_unselect");
            [object setImage:[UIImage imageNamed:@"icon_select"] forState:UIControlStateSelected];
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                object.selected = !object.selected;
            }];
            object;
       });
    }
    return _btAgree;
}

- (UIButton *)btQQ{
    if(!_btQQ){
        _btQQ = ({
            UIButton * object = to_create_button_backImage(@"icon_qq");
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
            }];
            object;
       });
    }
    return _btQQ;
}

- (UIButton *)btWechat{
    if(!_btWechat){
        _btWechat = ({
            UIButton * object = to_create_button_backImage(@"icon_wechat");
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
            }];
            object;
       });
    }
    return _btWechat;
}

- (UIButton *)btWeibo{
    if(!_btWeibo){
        _btWeibo = ({
            UIButton * object = to_create_button_backImage(@"icon_weibo");
            [[object rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
                
            }];
            object;
       });
    }
    return _btWeibo;
}
@end
