//
//  TOVerifyViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOVerifyViewController.h"
#import "CRBoxInputView.h"

@interface TOVerifyViewController ()

@property(nonatomic,strong)CRBoxInputView* codeInputView;

@property(nonatomic,copy)NSString* mobile;

@end

@implementation TOVerifyViewController

- (instancetype)initWithMobile:(NSString*)mobile {
    if (self == [super init]) {
        self.mobile = mobile;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel* l1 = to_createLabel_text_color_font(@"请输入验证码", [UIColor blackColor], 23);
    [self.view addSubview:l1];
    [l1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(100);
    }];
    
    UILabel* l2 = to_createLabel_text_color_font([NSString stringWithFormat:@"我们已向 %@发送短\n信，请查看短信并输入验证码",self.mobile], UIColorFromRGB(0x666666), 18);
    l2.numberOfLines = 2;
    l2.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:l2];
    [l2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(l1.mas_bottom).offset(20);
    }];
    
    [self.view addSubview:self.codeInputView];
    [self.codeInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(l2.mas_bottom).offset(30);
        make.size.mas_equalTo(CGSizeMake(300, 50));
    }];
    
    UIButton* bt1 = to_create_button_left(@"我已经同意用户协议和隐私政策", @"icon_select");
    [self.view addSubview:bt1];
    [bt1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-20);
    }];
    
    WeakSelf;
    UIButton* btBack = to_create_button_image(@"icon_backalpha");
    [[btBack rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:btBack];
    [btBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(40);
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(30);
    }];
}

- (void)login {
    [MBProgressHUD showActivityMessageInView:@"登录中..."];
    [TOWebManager loginBySms:self.mobile code:self.codeInputView.textValue success:^(id  _Nonnull data) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSString * _Nonnull message) {
        
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


- (CRBoxInputView *)codeInputView{
    if(!_codeInputView){
        _codeInputView = ({
            CRBoxInputCellProperty *cellProperty = [CRBoxInputCellProperty new];
            cellProperty.cellCursorColor = [UIColor blackColor];
            cellProperty.cellCursorWidth = 1;
            cellProperty.cellCursorHeight = 30;
            cellProperty.cornerRadius = 0;
            cellProperty.borderWidth = 0;
            cellProperty.cellFont = [UIFont systemFontOfSize:24];
            cellProperty.cellTextColor = [UIColor blackColor];
            cellProperty.cellBgColorNormal = [UIColor clearColor];
            cellProperty.cellBgColorSelected = [UIColor clearColor];
            cellProperty.cellBgColorFilled = [UIColor clearColor];
            cellProperty.showLine = YES; //必需
            WeakSelf;
            cellProperty.customLineViewBlock = ^CRLineView * _Nonnull{
                CRLineView *lineView = [CRLineView new];
                lineView.underlineColorNormal = [UIColor colorWithWhite:0.7 alpha:1];
                lineView.underlineColorSelected = [UIColor blackColor];
                lineView.underlineColorFilled = [UIColor colorWithWhite:0.7 alpha:1];
                [lineView.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(2);
                    make.left.right.bottom.mas_equalTo(0);
                }];
                return lineView;
            };
            CRBoxInputView * object = [[CRBoxInputView alloc]initWithCodeLength:4];
            object.customCellProperty = cellProperty;
            object.mainCollectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
            object.boxFlowLayout.itemSize = CGSizeMake(50, 50);
            [object loadAndPrepareViewWithBeginEdit:YES];
            object.textDidChangeblock = ^(NSString *text, BOOL isFinished) {
                if (isFinished) {
                    [weakSelf login];
                }
            };
            object;
       });
    }
    return _codeInputView;
}
@end
