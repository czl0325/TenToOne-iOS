//
//  TOTitleView.h
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TOTitleView : UIView

- (instancetype)initWithTitle:(NSString*)title;
- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail;
- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail showLine:(BOOL)show;

@end

NS_ASSUME_NONNULL_END
