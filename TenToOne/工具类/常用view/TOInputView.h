//
//  TOInputView.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TOInputView : UIView

- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder;
- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder detail:(NSString*)detail;
- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder detail:(NSString*)detail canEdit:(BOOL)canEdit;
- (instancetype)initWithTitle:(NSString*)title placeholder:(NSString*)placeholder detail:(NSString*)detail canEdit:(BOOL)canEdit showLine:(BOOL)show;

@end

NS_ASSUME_NONNULL_END
