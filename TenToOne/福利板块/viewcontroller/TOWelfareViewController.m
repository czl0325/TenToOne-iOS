//
//  TOWelfareViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOWelfareViewController.h"
#import "TOWelfareHeader.h"
#import "TOWalfareContentView.h"

@interface TOWelfareViewController ()

@property(nonatomic,strong)TOWelfareHeader* walfareHeader;
@property(nonatomic,strong)TOWalfareContentView* walfareContent;

@end

@implementation TOWelfareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"福利";
    
    UIButton* btQuestion = to_create_button_image(@"icon_question");
    btQuestion.frame = CGRectMake(0, 0, 30, 30);
    [self addLeftNavigationButtons:@[btQuestion]];
    
    [self.view addSubview:self.walfareHeader];
    [self.walfareHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(10);
        make.right.mas_equalTo(-10);
    }];
    
    [self.view addSubview:self.walfareContent];
    [self.walfareContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.walfareHeader);
        make.bottom.mas_equalTo(-10);
        make.top.mas_equalTo(self.walfareHeader.mas_bottom).offset(10);
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


- (TOWelfareHeader *)walfareHeader{
    if(!_walfareHeader){
        _walfareHeader = ({
            TOWelfareHeader * object = [[TOWelfareHeader alloc]init];
            object;
       });
    }
    return _walfareHeader;
}

- (TOWalfareContentView *)walfareContent{
    if(!_walfareContent){
        _walfareContent = ({
            TOWalfareContentView * object = [[TOWalfareContentView alloc]init];
            object;
       });
    }
    return _walfareContent;
}
@end
