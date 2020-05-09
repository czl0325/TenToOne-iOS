//
//  TORedView.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TORedView : UIView

@property(nonatomic,copy)void (^onKai)(void);

@end

NS_ASSUME_NONNULL_END
