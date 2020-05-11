//
//  UITabBarController+TabButtonType.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "UITabBarController+TabButtonType.h"

@implementation UITabBarController (TabButtonType)

- (UITraitCollection *)traitCollection {
//    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
//        return [UITraitCollection traitCollectionWithHorizontalSizeClass: UIUserInterfaceSizeClassCompact];
//    }
    return super.traitCollection;
}

@end
