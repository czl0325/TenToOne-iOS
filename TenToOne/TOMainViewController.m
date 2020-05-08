//
//  TOMainViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOMainViewController.h"
#import "TOTabBarController.h"
#import "TOTabBarController1.h"

@interface TOMainViewController ()

@end

@implementation TOMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TOTabBarController *tabVC = [[TOTabBarController alloc]init];
    UINavigationController* nav = [[UINavigationController alloc]initWithRootViewController:tabVC];
    [self addChildViewController:nav];
    tabVC.view.frame = self.view.frame;
    [self.view addSubview:nav.view];
    [tabVC didMoveToParentViewController:self];
}



@end
