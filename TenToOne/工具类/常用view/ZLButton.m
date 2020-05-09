//
//  ZLButton.m
//  TenToOne
//
//  Created by hqtech on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "ZLButton.h"

@implementation ZLButton

- (instancetype)init {
    if (self == [super init]) {
        self.space = 5;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnWidth = self.frame.size.width;
    CGFloat btnHeight = self.frame.size.height;
    
    CGFloat imageWidth = self.imageView.image.size.width;
    CGFloat imageHeight = self.imageView.image.size.height;
    if (self.imageSize > 0) {
        imageWidth = self.imageSize;
        imageHeight = self.imageSize;
    }
    
    CGFloat titleWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleHeight = self.titleLabel.intrinsicContentSize.height;
    
    CGFloat contentWidth = 0;
    CGFloat contentHeight = 0;
    
    if (self.buttonStyle == ZLButtonStyleTop || self.buttonStyle == ZLButtonStyleBottom) {
        contentWidth = MAX(imageWidth, titleWidth);
        contentHeight = imageHeight + self.space + titleHeight;
    } else {
        contentWidth = imageWidth + self.space + titleWidth;
        contentHeight = MAX(imageHeight, titleHeight);
    }
    if (btnWidth < contentWidth) {
        btnWidth = contentWidth;
    }
    if (btnHeight < contentHeight) {
        btnHeight = contentHeight;
    }
    CGRect rc = self.frame;
    rc.size.width = btnWidth;
    rc.size.height = btnHeight;
    self.frame = rc;

    CGFloat x = (btnWidth - contentWidth) / 2;
    CGFloat y = (btnHeight - contentHeight) / 2;
    if (self.buttonStyle == ZLButtonStyleTop) {
        self.imageView.frame = CGRectMake(btnWidth/2-imageWidth/2, y, imageWidth, imageHeight);
        self.titleLabel.frame = CGRectMake(btnWidth/2-titleWidth/2, y+imageHeight+self.space, titleWidth, titleHeight);
    } else if (self.buttonStyle == ZLButtonStyleBottom) {
        self.titleLabel.frame = CGRectMake(btnWidth/2-titleWidth/2, y, titleWidth, titleHeight);
        self.imageView.frame = CGRectMake(btnWidth/2-imageWidth/2, y+titleHeight+self.space, imageWidth, imageHeight);
    } else if (self.buttonStyle == ZLButtonStyleLeft) {
        self.imageView.frame = CGRectMake(x, btnHeight/2-imageHeight/2, imageWidth, imageHeight);
        self.titleLabel.frame = CGRectMake(x+imageWidth+self.space, btnHeight/2-titleHeight/2, titleWidth, titleHeight);
    } else if (self.buttonStyle == ZLButtonStyleRight) {
        self.titleLabel.frame = CGRectMake(x, btnHeight/2-titleHeight/2, titleWidth, titleHeight);
        self.imageView.frame = CGRectMake(x+titleWidth+self.space, btnHeight/2-imageHeight/2, imageWidth, imageHeight);
    }
    self.imageView.frame = CGRectMake(btnWidth/2-imageWidth/2, 0, imageWidth, imageHeight);
    self.titleLabel.frame = CGRectMake(btnWidth/2-titleWidth/2, imageHeight+5, titleWidth, titleHeight);
}

- (void)setButtonStyle:(ZLButtonStyle)buttonStyle {
    _buttonStyle = buttonStyle;
    [self layoutSubviews];
}

- (void)setSpace:(CGFloat)space {
    _space = space;
    [self layoutSubviews];
}

- (void)setImageSize:(CGFloat)imageSize {
    _imageSize = imageSize;
    [self layoutSubviews];
}

@end
