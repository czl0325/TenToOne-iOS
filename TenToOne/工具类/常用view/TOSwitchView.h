//
//  TOSwitchView.h
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TOSwitchView : UIView

- (instancetype)initWithTitle:(NSString*)title;
- (instancetype)initWithTitle:(NSString*)title showLine:(BOOL)show;
@property(nonatomic,assign)BOOL isOn;

@end

NS_ASSUME_NONNULL_END
