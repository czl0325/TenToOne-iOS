//
//  TOBaseViewController.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOBaseViewController.h"
#import "UIResponder+deliver.h"

@interface TOBaseViewController ()

@end

@implementation TOBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = WindowsBackColor;
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        [self setEdgesForExtendedLayout:UIRectEdgeNone];
    }
}

- (void)addLeftNavigationButtons:(NSArray<UIButton*>*)buttons {
    NSMutableArray* arrayButton = [NSMutableArray new];
    for (UIButton* btn in buttons) {
        if (btn.titleLabel.text.length <= 0 || btn.titleLabel.text == nil) {
            btn.frame = CGRectMake(0, 0, 22, 22);
            UIView *view = [UIView new];
            view.backgroundColor = [UIColor clearColor];
            view.frame = CGRectMake(0, 0, 22, 22);
            [view addSubview:btn];
            [arrayButton addObject:[[UIBarButtonItem alloc] initWithCustomView:view]];
        } else {
            [arrayButton addObject:[[UIBarButtonItem alloc] initWithCustomView:btn]];
        }
    }
    self.navigationItem.leftBarButtonItems = arrayButton;
}

- (void)addRightNavigationButtons:(NSArray<UIButton*>*)buttons {
    NSMutableArray* arrayButton = [NSMutableArray new];
    for (UIButton* btn in buttons) {
        [arrayButton addObject:[[UIBarButtonItem alloc] initWithCustomView:btn]];
    }
    self.navigationItem.rightBarButtonItems = arrayButton;
}

- (BOOL)hidesBottomBarWhenPushed {
    return self.navigationController.viewControllers.count > 1;
}

- (void)action_deliverEventsWithName:(NSString *)eventName parameter:(id)parameter {
    SEL selector = NSSelectorFromString(eventName);
    IMP imp = [self methodForSelector:selector];
    if ([self respondsToSelector:selector]) {
        if (parameter) {
            //[self performSelector:selector withObject:userInfo];
            void (*func) (id, SEL, id) = (void *)imp;
            func(self,selector,parameter);
        } else {
            //[self performSelector:selector];
            void (*func) (id, SEL) = (void *)imp;
            func(self,selector);
        }
    } else {
        // 无法响应，继续传递
        [self.nextResponder action_deliverEventsWithName:eventName parameter:parameter];
    }
}

@end
