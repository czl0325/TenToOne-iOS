//
//  TOHomeNavbar.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOHomeNavbar.h"
#import "TORegionView.h"
#import "PopoverView.h"
#import "TOScanViewController.h"

@interface TOHomeNavbar ()

@property(nonatomic,strong)TORegionView* regionView;

@end

@implementation TOHomeNavbar

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = MainColor;
        
        [self addSubview:self.regionView];
        [self.regionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self);
            make.left.mas_equalTo(5);
            make.width.mas_greaterThanOrEqualTo(50);
            make.width.mas_lessThanOrEqualTo(100);
            make.height.mas_equalTo(44);
        }];
        
        WeakSelf;
        UIButton* btMore = to_create_button_backImage(@"icon_more");
        btMore.frame = CGRectMake(0, 0, 132/5.0, 33/5.0);
        [[btMore rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf showMore:x];
        }];
        [self addSubview:btMore];
        [btMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-5);
            make.centerY.mas_equalTo(self.regionView);
            make.size.mas_equalTo(CGSizeMake(132/5.0, 33/5.0));
        }];
        
        UITextField* tfSearch = [UITextField new];
        tfSearch.backgroundColor = [UIColor whiteColor];
        tfSearch.placeholder = @"搜索";
        tfSearch.layer.cornerRadius = 4;
        [tfSearch setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [self addSubview:tfSearch];
        [tfSearch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(btMore.mas_left).offset(-10);
            make.centerY.mas_equalTo(self.regionView);
            make.left.mas_equalTo(self.regionView.mas_right).offset(10);
            make.height.mas_equalTo(34);
        }];
    }
    return self;
}

- (void)showMore:(UIControl*)control {
    PopoverAction *action1 = [PopoverAction actionWithImage:[UIImage imageNamed:@"icon_topup"] title:@"话费充值" handler:^(PopoverAction *action) {
        
    }];
    PopoverAction *action2 = [PopoverAction actionWithImage:[UIImage imageNamed:@"icon_declaration"] title:@"我要报单" handler:^(PopoverAction *action) {
        
    }];
    PopoverAction *action3 = [PopoverAction actionWithImage:[UIImage imageNamed:@"icon_strategy"] title:@"玩法攻略" handler:^(PopoverAction *action) {
        
    }];
    PopoverAction *action4 = [PopoverAction actionWithImage:[UIImage imageNamed:@"icon_scan"] title:@"扫一扫" handler:^(PopoverAction *action) {
        TOScanViewController* vc = [[TOScanViewController alloc]init];
        [topViewController().navigationController pushViewController:vc animated:YES];
    }];
    PopoverView *popoverView = [PopoverView popoverView];
    [popoverView showToView:control withActions:@[action1, action2, action3, action4]];
}

- (TORegionView *)regionView{
    if(!_regionView){
        _regionView = ({
            TORegionView* object = [[TORegionView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
            object;
       });
    }
    return _regionView;
}

@end
