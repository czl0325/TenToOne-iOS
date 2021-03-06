//
//  TOShareView.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/11.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TOShareView : UIView

- (void)startAnimationsCompletion:(void (^ __nullable)(BOOL finished))completion;

@end

NS_ASSUME_NONNULL_END
