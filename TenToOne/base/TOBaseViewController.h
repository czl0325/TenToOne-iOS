//
//  TOBaseViewController.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TOBaseViewController : UIViewController

- (void)addLeftNavigationButtons:(NSArray<UIView*>*)views;
- (void)addRightNavigationButtons:(NSArray<UIView*>*)views;

@end

NS_ASSUME_NONNULL_END
