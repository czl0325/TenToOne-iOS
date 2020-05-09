//
//  ZLTextField.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZLTextField : UITextField

@property(nonatomic,assign)BOOL drawUnderline;
@property(nonatomic,assign)CGFloat leftWidth;
@property(nonatomic,assign)CGFloat rightWidth;
@property(nonatomic,assign)BOOL drawDeleteLine;
@property(nonatomic,strong)UILabel* rightLabel;
@property(nonatomic,strong)UILabel* leftLabel;
@property(nonatomic,strong)NSString* strMark;

- (instancetype)initWithImageName:(nullable NSString*)imageName placeholder:(nullable NSString*)placeholder;

- (instancetype)initWithLeftText:(nullable NSString*)leftText rightText:(nullable NSString*)rightText placeholder:(nullable NSString*)placeholder;

- (instancetype)initWithTextRight:(nullable NSString*)leftText placeholder:(nullable NSString*)placeholder;

@end

NS_ASSUME_NONNULL_END
