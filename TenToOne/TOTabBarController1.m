//
//  TOATabBarController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOTabBarController1.h"
#import "TOWelfareViewController.h"
#import "TOHotViewController.h"
#import "TOHomeViewController.h"
#import "TOMessageViewController.h"
#import "TOMeViewController.h"

@interface TOTabBarController1 ()

@end

@implementation TOTabBarController1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.fd_prefersNavigationBarHidden = YES;
    self.viewControllers = [self viewControllersForTabBar];
    [self setItems];
}

- (NSArray *)viewControllersForTabBar {
    TOWelfareViewController *vc1 = [[TOWelfareViewController alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:vc1];
    TOHotViewController *vc2 = [[TOHotViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:vc2];
    TOHomeViewController *vc3 = [[TOHomeViewController alloc] init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:vc3];
    TOMessageViewController *vc4 = [[TOMessageViewController alloc] init];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:vc4];
    TOMeViewController *vc5 = [[TOMeViewController alloc] init];
    UINavigationController *nav5 = [[UINavigationController alloc]initWithRootViewController:vc5];
    NSArray *viewControllers = @[nav1, nav2, nav3, nav4, nav5];
    return viewControllers;
}

-(void)setItems{
    UITabBar *tabbar = self.tabBar;
    
    UITabBarItem *item0 = [tabbar.items objectAtIndex:0];
    item0.title=@"福利";
    item0.selectedImage = [[UIImage imageNamed:@"tab_gift_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item0.image = [[UIImage imageNamed:@"tab_gift_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item1 = [tabbar.items objectAtIndex:1];
    item1.title =@"热卖";
    item1.selectedImage = [[UIImage imageNamed:@"tab_hot_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item1.image = [[UIImage imageNamed:@"tab_hot_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item2 = [tabbar.items objectAtIndex:2];
    item2.title =@"首页";
    item2.selectedImage = [[UIImage imageNamed:@"tab_home_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item2.image = [[UIImage imageNamed:@"tab_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item3 = [tabbar.items objectAtIndex:3];
    item3.title =@"消息";
    item3.selectedImage = [[UIImage imageNamed:@"tab_message_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item3.image = [[UIImage imageNamed:@"tab_message_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *item4 = [tabbar.items objectAtIndex:4];
    item4.title =@"我的";
    item4.selectedImage = [[UIImage imageNamed:@"tab_me_hl"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    item4.image = [[UIImage imageNamed:@"tab_me_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //改变UITabBarItem字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : MainColor} forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : DefaultTextColor} forState:UIControlStateNormal];
    tabbar.tintColor = MainColor;
}

@end
