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
#import "TOSearchViewController.h"

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
            make.width.mas_lessThanOrEqualTo(100);
            make.height.mas_equalTo(44);
        }];
        
        WeakSelf;
        UIButton* btMore = [UIButton buttonWithType:UIButtonTypeCustom];
        [btMore setImage:[UIImage imageNamed:@"icon_more"] forState:UIControlStateNormal];
        [[btMore rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            [weakSelf showMore:x];
        }];
        [self addSubview:btMore];
        [btMore mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.centerY.mas_equalTo(self.regionView);
            make.size.mas_equalTo(44);
        }];
        
        UIButton* btSearch = to_create_button_left(@"搜索关键字", @"icon_search");
        btSearch.backgroundColor = [UIColor whiteColor];
        btSearch.layer.cornerRadius = 4;
        [btSearch setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        btSearch.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        btSearch.titleEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
        [[btSearch rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            TOSearchViewController* vc = [[TOSearchViewController alloc]init];
            [weakSelf.viewController.navigationController pushViewController:vc animated:YES];
        }];
        [self addSubview:btSearch];
        [btSearch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(btMore.mas_left).offset(0);
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
        [self.viewController.navigationController pushViewController:vc animated:YES];
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
