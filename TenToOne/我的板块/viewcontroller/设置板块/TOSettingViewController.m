//
//  TOSettingViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSettingViewController.h"

@interface TOSettingViewController ()

@end

@implementation TOSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"设置";
    
    UIView* view1 = createView([UIColor whiteColor]);
    view1.layer.cornerRadius = 5;
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    UIView* view11 = createView([UIColor clearColor]);
    [view1 addSubview:view11];
    [view11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(view1);
        make.height.mas_equalTo(40);
    }];
    
    UILabel* l11 = to_createLabel_black(@"个人资料");
    [view11 addSubview:l11];
    [l11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view11);
        make.left.mas_equalTo(10);
    }];
    
    UIImageView* i11 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_arrowright"]];;
    [view11 addSubview:i11];
    [i11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view11);
        make.right.mas_equalTo(-10);
    }];
    
    UIView* line1 = createView(WindowsBackColor);
    [view1 addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(view1);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(view11.mas_bottom);
    }];
    
    
    UIView* view12 = createView([UIColor clearColor]);
    [view1 addSubview:view12];
    [view12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line1.mas_bottom);
        make.left.right.height.mas_equalTo(view11);
    }];
    
    UILabel* l12 = to_createLabel_black(@"地址管理");
    [view12 addSubview:l12];
    [l12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view12);
        make.left.mas_equalTo(10);
    }];
    
    UIImageView* i12 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_arrowright"]];;
    [view12 addSubview:i12];
    [i12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view12);
        make.right.mas_equalTo(-10);
    }];
    
    UIView* line2 = createView(WindowsBackColor);
    [view1 addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(view1);
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(view12.mas_bottom);
    }];
    
    
    UIView* view13 = createView([UIColor clearColor]);
    [view1 addSubview:view13];
    [view13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line2.mas_bottom);
        make.left.right.height.mas_equalTo(view11);
    }];
    
    UILabel* l13 = to_createLabel_black(@"消息管理");
    [view13 addSubview:l13];
    [l13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view13);
        make.left.mas_equalTo(10);
    }];
    
    UIImageView* i13 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_arrowright"]];;
    [view13 addSubview:i13];
    [i13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view13);
        make.right.mas_equalTo(-10);
    }];
    
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(view13.mas_bottom);
    }];
    
    UIView* view2 = createView([UIColor whiteColor]);
    view2.layer.cornerRadius = 5;
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(view1.mas_bottom).offset(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(40);
    }];
    
    UIView* view21 = createView([UIColor clearColor]);
    [self.view addSubview:view21];
    [view21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view2);
    }];
    
    UILabel* l21 = to_createLabel_black(@"安全管理");
    [view21 addSubview:l21];
    [l21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view21);
        make.left.mas_equalTo(10);
    }];
    
    UIImageView* i21 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_arrowright"]];;
    [view21 addSubview:i21];
    [i21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view21);
        make.right.mas_equalTo(-10);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
