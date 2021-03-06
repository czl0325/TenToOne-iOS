//
//  AppDelegate.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "AppDelegate.h"
#import "IQKeyboardManager.h"
#import "PLeakSniffer.h"
#import "TOMainViewController.h"
#import <QMapKit/QMapKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (@available(iOS 13.0, *)) {
      
    } else {
        self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
        self.window.backgroundColor = [UIColor whiteColor];
        TOMainViewController *mainVC = [[TOMainViewController alloc]init];
        self.window.rootViewController = mainVC;
        [self.window makeKeyAndVisible];
    }
    
    //
    
    [self setNavigationBar];
    [QMapServices sharedServices].APIKey = @"ZCZBZ-PNWK4-K4KUJ-XKOBD-BOIW3-OHBWX";
    
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    #if DEBUG
        [[PLeakSniffer sharedInstance] installLeakSniffer];
    #endif
    return YES;
}


#pragma mark - UISceneSession lifecycle
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    if (@available(iOS 13.0, *)) {
        return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
    } else {
        return nil;
    }
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    
}

- (void)setNavigationBar {
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    [[UINavigationBar appearance] setBarTintColor:MainColor];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置导航栏后退按钮颜色
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(-2000, 0) forBarMetrics:UIBarMetricsDefault];
    //不显示'取消''确认'按钮的解决方法:
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:16], NSFontAttributeName, nil]  forState:UIControlStateNormal];
    //去掉导航按钮的黑线
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}




@end
