//
//  TOTitleView1.h
//  TenToOne
//
//  Created by hqtech on 2020/5/10.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TOTitleView1 : UIView

- (instancetype)initWithTitle:(NSString*)title;
- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail;
- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail showLine:(BOOL)show;
- (instancetype)initWithTitle:(NSString*)title detail:(NSString*)detail showLine:(BOOL)show showArraw:(BOOL)show2;

- (void)setDetailTextColor:(UIColor*)color;

@end

NS_ASSUME_NONNULL_END
