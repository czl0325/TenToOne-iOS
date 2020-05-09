//
//  TOTabBarController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOTabBarController.h"
#import "TOWelfareViewController.h"
#import "TOHotViewController.h"
#import "TOHomeViewController.h"
#import "TOMessageViewController.h"
#import "TOMeViewController.h"

@interface TOTabBarController ()
<UITabBarControllerDelegate, CYLTabBarControllerDelegate>

@end

@implementation TOTabBarController

- (instancetype)init {
    if (self == [super initWithViewControllers:[self viewControllersForTabBar] tabBarItemsAttributes:[self tabBarItemsAttributesForTabBar]]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.delegate = self;
    [self customizeInterface];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
    self.selectedIndex = 2;
}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO];
//}

- (NSArray *)viewControllersForTabBar {
    TOWelfareViewController *vc1 = [[TOWelfareViewController alloc] init];
    CYLBaseNavigationController *nav1 = [[CYLBaseNavigationController alloc]initWithRootViewController:vc1];
    TOHotViewController *vc2 = [[TOHotViewController alloc] init];
    CYLBaseNavigationController *nav2 = [[CYLBaseNavigationController alloc]initWithRootViewController:vc2];
    TOHomeViewController *vc3 = [[TOHomeViewController alloc] init];
    CYLBaseNavigationController *nav3 = [[CYLBaseNavigationController alloc]initWithRootViewController:vc3];
    TOMessageViewController *vc4 = [[TOMessageViewController alloc] init];
    CYLBaseNavigationController *nav4 = [[CYLBaseNavigationController alloc]initWithRootViewController:vc4];
    TOMeViewController *vc5 = [[TOMeViewController alloc] init];
    CYLBaseNavigationController *nav5 = [[CYLBaseNavigationController alloc]initWithRootViewController:vc5];
    NSArray *viewControllers = @[nav1, nav2, nav3, nav4, nav5];
    return viewControllers;
}

- (NSArray *)tabBarItemsAttributesForTabBar {
    NSDictionary *dic1 = @{CYLTabBarItemTitle : @"福利",
    CYLTabBarItemImage : [UIImage imageNamed:@"tab_gift_normal"],
    CYLTabBarItemSelectedImage : @"tab_gift_hl",
    CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)] };
    NSDictionary *dic2 = @{CYLTabBarItemTitle : @"热卖",
    CYLTabBarItemImage : [UIImage imageNamed:@"tab_hot_normal"],
    CYLTabBarItemSelectedImage : @"tab_hot_hl",
    CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)] };
    NSDictionary *dic3 = @{CYLTabBarItemTitle : @"首页",
    CYLTabBarItemImage : [UIImage imageNamed:@"tab_home_normal"],
    CYLTabBarItemSelectedImage : @"tab_home_hl",
    CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)] };
    NSDictionary *dic4 = @{CYLTabBarItemTitle : @"消息",
    CYLTabBarItemImage : [UIImage imageNamed:@"tab_message_normal"],
    CYLTabBarItemSelectedImage : @"tab_message_hl",
    CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)] };
    NSDictionary *dic5 = @{CYLTabBarItemTitle : @"我的",
    CYLTabBarItemImage : [UIImage imageNamed:@"tab_me_normal"],
    CYLTabBarItemSelectedImage : @"tab_me_hl",
    CYLTabBarItemImageInsets: [NSValue valueWithUIEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)] };
    
    NSArray *tabBarItemsAttributes = @[dic1, dic2, dic3, dic4, dic5];
    return tabBarItemsAttributes;
}

- (void)customizeInterface {
   // 普通状态下的文字属性
   NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
   normalAttrs[NSForegroundColorAttributeName] = DefaultTextColor;
   
   // 选中状态下的文字属性
   NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
   selectedAttrs[NSForegroundColorAttributeName] = MainColor;
    
    if (@available(iOS 13.0, *)) {
        UITabBarItemAppearance *inlineLayoutAppearance = [[UITabBarItemAppearance  alloc] init];
        // set the text Attributes
        // 设置文字属性
        [inlineLayoutAppearance.normal setTitleTextAttributes:normalAttrs];
        [inlineLayoutAppearance.selected setTitleTextAttributes:selectedAttrs];

        UITabBarAppearance *standardAppearance = [[UITabBarAppearance alloc] init];
        standardAppearance.stackedLayoutAppearance = inlineLayoutAppearance;
        standardAppearance.backgroundColor = [UIColor cyl_systemBackgroundColor];
        standardAppearance.shadowColor = [UIColor cyl_systemGreenColor];
        self.tabBar.standardAppearance = standardAppearance;
    } else {
        UITabBarItem *tabBar = [UITabBarItem appearance];
        [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    }
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control {
    UIView *animationView;
    if ([control isKindOfClass:[CYLExternPlusButton class]]) {
        UIButton *button = CYLExternPlusButton;
        animationView = button.imageView;
    } else if ([control isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
        for (UIView *subView in control.subviews) {
            if ([subView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                animationView = subView;
            }
        }
    }
    
    [self addScaleAnimationOnView:animationView];
}

//缩放动画
- (void)addScaleAnimationOnView:(UIView *)animationView {
   //需要实现的帧动画，这里根据需求自定义
   CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
   animation.keyPath = @"transform.scale";
   animation.values = @[@1.0,@1.3,@0.9,@1.15,@0.95,@1.02,@1.0];
   animation.duration = 1;
   animation.calculationMode = kCAAnimationCubic;
   [animationView.layer addAnimation:animation forKey:nil];
}

//旋转动画
- (void)addRotateAnimationOnView:(UIView *)animationView {
   [UIView animateWithDuration:0.32 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
       animationView.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 0);
   } completion:nil];
   
   dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       [UIView animateWithDuration:0.70 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.2 options:UIViewAnimationOptionCurveEaseOut animations:^{
           animationView.layer.transform = CATransform3DMakeRotation(2 * M_PI, 0, 1, 0);
       } completion:nil];
   });
}

@end
