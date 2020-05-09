//
//  TOMyOrderViewController.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMyOrderViewController.h"
#import "JXCategoryTitleView.h"
#import "JXCategoryListContainerView.h"
#import "TOOrderListViewController.h"
#import "JXCategoryIndicatorLineView.h"

@interface TOMyOrderViewController ()
<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property(nonatomic,strong)JXCategoryTitleView* tlTitle;
@property(nonatomic,strong)JXCategoryListContainerView* listContainerView;

@end

@implementation TOMyOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的订单";
    
    [self.view addSubview:self.tlTitle];
    [self.tlTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.mas_equalTo(40);
    }];
    
    
    [self.view addSubview:self.listContainerView];
    [self.listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.mas_equalTo(self.tlTitle.mas_bottom);
    }];
    self.tlTitle.listContainer = self.listContainerView;
    
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.lineStyle = JXCategoryIndicatorLineStyle_LengthenOffset;
    lineView.indicatorColor = MainColor;
    lineView.indicatorWidth = JXCategoryViewAutomaticDimension;
    self.tlTitle.indicators = @[lineView];
}

//返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return 5;
}
//根据下标index返回对应遵从`JXCategoryListContentViewDelegate`协议的列表实例
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return [[TOOrderListViewController alloc] init];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    self.navigationController.interactivePopGestureRecognizer.enabled = (index == 0);
}

- (JXCategoryTitleView*)tlTitle {
    if(!_tlTitle){
         _tlTitle = ({
             JXCategoryTitleView * object = [[JXCategoryTitleView alloc]init];
             object.backgroundColor = [UIColor whiteColor];
             object.delegate = self;
             object.titles = @[@"全部", @"待付款", @"待发货", @"待收货", @"已完成"];
             object.titleColorGradientEnabled = YES;
             object.titleSelectedColor = MainColor;
             object.titleColor = DefaultTextColor;
             object.titleFont = DefaultFont;
             object;
        });
     }
     return _tlTitle;
}

- (JXCategoryListContainerView*)listContainerView {
    if(!_listContainerView){
         _listContainerView = ({
             JXCategoryListContainerView * object = [[JXCategoryListContainerView alloc]initWithType:JXCategoryListContainerType_ScrollView delegate:self];
             object;
        });
     }
     return _listContainerView;
}

@end
