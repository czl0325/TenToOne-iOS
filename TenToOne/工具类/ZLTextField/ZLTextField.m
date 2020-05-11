//
//  ZLTextField.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "ZLTextField.h"

@interface ZLTextField()

@property(nonatomic,strong)UILabel* labelMark;

@end

@implementation ZLTextField

- (instancetype)init {
    self = [super init];
    if (self) {
        self.drawUnderline = YES;
        self.strMark = @"";
    }
    return self;
}

- (instancetype)initWithImageName:(nullable NSString*)imageName placeholder:(nullable NSString*)placeholder {
    self = [self init];
    if (self) {
        UIImageView *userNameLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(10,0,20,20)];
        userNameLeftView.contentMode = UIViewContentModeCenter;
        userNameLeftView.image = [UIImage imageNamed:imageName];
        self.leftViewMode= UITextFieldViewModeAlways;
        self.leftView= userNameLeftView;
        self.placeholder = placeholder;
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        [self setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
    return self;
}

- (instancetype)initWithLeftText:(nullable NSString*)leftText rightText:(nullable NSString*)rightText placeholder:(nullable NSString*)placeholder {
    self = [self init];
    if (self) {
        if (leftText.length > 0) {
            UILabel *labelLeft = [UILabel new];
            labelLeft.textAlignment = NSTextAlignmentRight;
            labelLeft.textColor = [UIColor grayColor];
            labelLeft.frame= CGRectMake(0,0,[leftText getTextWidthfont:self.font labelHeight:20],20);
            labelLeft.text = leftText;
            self.leftViewMode= UITextFieldViewModeAlways;
            self.leftView= labelLeft;
            self.leftLabel = labelLeft;
            //[self setValue:[NSNumber numberWithInt:15] forKey:@"paddingLeft"];
        }
        
        if (rightText != nil) {
            UILabel *labelRight = [UILabel new];
            labelRight.textColor = [UIColor grayColor];
            labelRight.textAlignment = NSTextAlignmentLeft;
            //if (rightText.length > 0) {
            labelRight.frame= CGRectMake(0,0,[rightText getTextWidthfont:self.font labelHeight:20],20);
            //            } else {
            //                labelRight.frame= CGRectMake(0,0,50,20);
            //            }
            labelRight.text = rightText;
            self.rightViewMode= UITextFieldViewModeAlways;
            self.rightView= labelRight;
            self.rightLabel = labelRight;
            //[self setValue:[NSNumber numberWithInt:15] forKey:@"paddingRight"];
        }
        
        self.placeholder = placeholder;
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        [self setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
    return self;
}

- (instancetype)initWithTextRight:(nullable NSString*)leftText placeholder:(nullable NSString*)placeholder {
    if (self = [super init]) {
        if (leftText.length > 0) {
            UILabel *labelLeft = [UILabel new];
            labelLeft.textAlignment = NSTextAlignmentRight;
            labelLeft.textColor = [UIColor grayColor];
            labelLeft.frame= CGRectMake(0,0,[leftText getTextWidthfont:self.font labelHeight:20],20);
            labelLeft.text = leftText;
            self.leftViewMode= UITextFieldViewModeAlways;
            self.leftView= labelLeft;
            self.leftLabel = labelLeft;
        }
        
        self.textAlignment = NSTextAlignmentRight;
        self.textColor = [UIColor blackColor];
        self.placeholder = placeholder;
        self.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        [self setAutocorrectionType:UITextAutocorrectionTypeNo];
        [self setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.leftView.height = self.height;
    self.rightView.height = self.height;
}

- (void)setLeftWidth:(CGFloat)leftWidth {
    _leftWidth = leftWidth;
    self.leftView.width = leftWidth;
}

- (void)setRightWidth:(CGFloat)rightWidth {
    _rightWidth = rightWidth;
    self.rightView.width = rightWidth;
}

- (void)setDrawUnderline:(BOOL)drawUnderline {
    _drawUnderline = drawUnderline;
    [self setNeedsDisplay];
}

- (void)setDrawDeleteLine:(BOOL)drawDeleteLine {
    _drawDeleteLine = drawDeleteLine;
    [self setNeedsDisplay];
}

- (void)setText:(NSString *)text {
    [super setText:text];
    if (_drawDeleteLine) {
        [self setNeedsDisplay];
    }
}

- (void)setStrMark:(NSString *)strMark {
    _strMark = strMark;
    if (strMark.length > 0) {
        if (self.labelMark.superview == nil) {
            [self addSubview:self.labelMark];
            [self.labelMark mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(self);
                make.left.mas_equalTo(self.leftView.frame.size.width + 10 + [self.text getTextWidthfont:self.font labelHeight:self.size.height] + 10);
                make.size.mas_equalTo(CGSizeMake(35, 16));
            }];
        }
        self.labelMark.text = strMark;
    } else {
        [self.labelMark removeFromSuperview];
    }
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    if (self.drawUnderline) {
        //获得处理的上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [UIColor colorWithHexString:@"dedede"].CGColor);
        CGContextFillRect(context, CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5));
    }
    
    if (self.drawDeleteLine && self.text.length > 0) {
        //获得处理的上下文
        CGContextRef context = UIGraphicsGetCurrentContext();
        //指定直线样式
        CGContextSetLineCap(context, kCGLineCapSquare);
        //直线宽度
        CGContextSetLineWidth(context, 1.0);
        //设置颜色
        CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 1.0);
        //开始绘制
        CGContextBeginPath(context);
        //画笔移动到点
        CGContextMoveToPoint(context, self.leftView.frame.size.width + 10, rect.size.height/2);
        //下一点
        CGContextAddLineToPoint(context, self.leftView.frame.size.width + 10 + [self.text getTextWidthfont:self.font labelHeight:rect.size.height], rect.size.height/2);
        //绘制完成
        CGContextStrokePath(context);
    }
}

- (CGRect)rightViewRectForBounds:(CGRect)bounds {
    CGRect textRect = [super rightViewRectForBounds:bounds];
    if (@available(iOS 13.0, *)) {
        CGFloat left = self.frame.size.width - self.rightView.frame.size.width;
        CGFloat top = round((self.frame.size.height - self.rightView.frame.size.height)/2.0);
        textRect = CGRectMake(left, top, self.rightView.frame.size.width , self.rightView.frame.size.height);
    }
    return textRect;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds {
    CGRect textRect = [super leftViewRectForBounds:bounds];
    if (@available(iOS 13.0, *)) {
        CGFloat top = round((self.frame.size.height - self.leftView.frame.size.height)/2.0);
        textRect = CGRectMake(0, top, self.leftView.frame.size.width, self.leftView.frame.size.height);
        textRect = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    } else {
        
    }
    return textRect;
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    CGRect textRect = [super textRectForBounds:bounds];
    if (self.leftView ==nil) {
        return CGRectInset(textRect, 10, 0);
    }
    textRect.origin.x = self.leftView.frame.size.width + 10;
    textRect.size.width -= 20;
    return textRect;
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    CGRect textRect = [super textRectForBounds:bounds];
    if (self.leftView ==nil) {
        return CGRectInset(textRect, 10, 0);
    }
    textRect.origin.x = self.leftView.frame.size.width + 10;
    textRect.size.width -= 20;
    return textRect;
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    CGRect textRect = [super placeholderRectForBounds:bounds];
    return textRect;
}

- (UILabel*)labelMark {
    if (!_labelMark) {
        _labelMark = [UILabel new];
        _labelMark.font = [UIFont boldSystemFontOfSize:13];
        _labelMark.textAlignment = NSTextAlignmentCenter;
        _labelMark.backgroundColor = [UIColor redColor];
        _labelMark.textColor =[UIColor whiteColor];
        _labelMark.layer.cornerRadius = 4;
        _labelMark.layer.masksToBounds = YES;
    }
    return _labelMark;
}

@end
