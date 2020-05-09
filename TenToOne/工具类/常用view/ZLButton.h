//
//  ZLButton.h
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZLButtonStyle) {
    ZLButtonStyleTop,       // image在上，label在下
    ZLButtonStyleLeft,      // image在左，label在右
    ZLButtonStyleBottom,    // image在下，label在上
    ZLButtonStyleRight      // image在右，label在左
};

@interface ZLButton : UIButton

@property(nonatomic,assign)ZLButtonStyle buttonStyle;
@property(nonatomic,assign)CGFloat space;
@property(nonatomic,assign)CGFloat imageSize;

@end

NS_ASSUME_NONNULL_END
