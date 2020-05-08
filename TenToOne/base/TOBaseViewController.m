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

- (void)addLeftNavigationButtons:(NSArray<UIView*>*)views {
    NSMutableArray* arrayButton = [NSMutableArray new];
    for (UIView* view in views) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton*)view;
            if (btn.titleLabel.text.length <= 0 || btn.titleLabel.text == nil) {
                btn.frame = CGRectMake(0, 0, 22, 22);
                UIView *v = [UIView new];
                v.backgroundColor = [UIColor clearColor];
                v.frame = CGRectMake(0, 0, 22, 22);
                [v addSubview:btn];
                [arrayButton addObject:[[UIBarButtonItem alloc] initWithCustomView:v]];
                continue;
            }
        }
        [arrayButton addObject:[[UIBarButtonItem alloc] initWithCustomView:view]];
    }
    self.navigationItem.leftBarButtonItems = arrayButton;
}

- (void)addRightNavigationButtons:(NSArray<UIView*>*)views {
    NSMutableArray* arrayButton = [NSMutableArray new];
    for (UIView* view in views) {
        if ([view isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton*)view;
            if (btn.titleLabel.text.length <= 0 || btn.titleLabel.text == nil) {
                btn.frame = CGRectMake(0, 0, 22, 22);
                UIView *v = [UIView new];
                v.backgroundColor = [UIColor clearColor];
                v.frame = CGRectMake(0, 0, 22, 22);
                [v addSubview:btn];
                [arrayButton addObject:[[UIBarButtonItem alloc] initWithCustomView:v]];
                continue;
            }
        }
        [arrayButton addObject:[[UIBarButtonItem alloc] initWithCustomView:view]];
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

-(void)viewDidLayoutSubviews{
    if (SystemVersion.floatValue < 11.0)
        return;
    UINavigationItem * item=self.navigationItem;
    NSArray * array=item.leftBarButtonItems;
    if (array&&array.count!=0){
        UIBarButtonItem * buttonItem=array[0];
        UIView * view =[[[buttonItem.customView superview] superview] superview];
        NSArray * arrayConstraint=view.constraints;
        for (NSLayoutConstraint * constant in arrayConstraint) {
            if (fabs(constant.constant)==16) {
                constant.constant=0;
            }
        }
    }
 
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (SystemVersion.floatValue < 11.0)
          return;
    UINavigationItem * item=self.navigationItem;
    NSArray * array=item.leftBarButtonItems;
    if (array&&array.count!=0){
        UIBarButtonItem * buttonItem=array[0];
        UIView * view =[[[buttonItem.customView superview] superview] superview];
        NSArray * arrayConstraint=view.constraints;
        for (NSLayoutConstraint * constant in arrayConstraint) {
            if (fabs(constant.constant)==16) {
                constant.constant=0;
            }
        }
    }
    
}

//防止侧滑出现问题
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (SystemVersion.floatValue < 11.0)
        return;
    UINavigationItem * item=self.navigationItem;
    NSArray * array = item.leftBarButtonItems;
    if (array && array.count!=0){
        UIBarButtonItem * buttonItem = array[0];
        UIView * view = [[[buttonItem.customView superview] superview] superview];
        NSArray * arrayConstraint=view.constraints;
        for (NSLayoutConstraint * constant in arrayConstraint) {
            if (fabs(constant.constant)==16) {
                constant.constant=0;
            }
        }
    }
    NSArray * array2 = item.rightBarButtonItems;
    if (array2 && array2.count!=0){
        UIBarButtonItem * buttonItem = array2[0];
        UIView * view = [[[buttonItem.customView superview] superview] superview];
        NSArray * arrayConstraint = view.constraints;
        for (NSLayoutConstraint * constant in arrayConstraint) {
            if (fabs(constant.constant) == 16) {
                constant.constant=0;
            }
        }
    }
}

@end
