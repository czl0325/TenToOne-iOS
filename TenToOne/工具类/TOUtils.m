//
//  TOUtils.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOUtils.h"

UILabel* to_createLabel_white(NSString* text) {
    UILabel *l = [UILabel new];
    l.text = text;
    l.textColor = [UIColor whiteColor];
    l.font = DefaultFont;
    l.textAlignment = NSTextAlignmentCenter;
    return l;
}

UILabel* to_createLabel_black(NSString* text) {
    return to_createLabel_text_color(text, UIColorFromRGB(0x444444));
}

UILabel* to_createLabel_text_color(NSString* text, UIColor* color) {
    return to_createLabel_text_color_font(text, color, 12);
}

UILabel* to_createLabel_text_color_font(NSString* text, UIColor* color, CGFloat fontSize) {
    UILabel *l = [UILabel new];
    l.text = text;
    l.textColor = color;
    l.font = [UIFont systemFontOfSize:fontSize];
    l.textAlignment = NSTextAlignmentCenter;
    return l;
}

UIButton* to_create_button_left(NSString* title,NSString* imageName ) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:DefaultTextColor forState:UIControlStateNormal];
    button.titleLabel.font = DefaultFont;
    [button layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleLeft imageTitleSpace:5 small:10];
    return button;
}

UIButton* to_create_button_Right(NSString* title,NSString* imageName ) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setTitleColor:DefaultTextColor forState:UIControlStateNormal];
    button.titleLabel.font = DefaultFont;
    [button layoutButtonWithEdgeInsetsStyle:ZLButtonEdgeInsetsStyleRight imageTitleSpace:5 small:10];
    return button;
}


UIButton* to_create_button_normal(NSString* title) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = MainColor;
    button.layer.cornerRadius = 5;
    return button;
}

UIButton* to_create_button_white(NSString* title) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:DefaultTextColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = [UIColor whiteColor];
    return button;
}

UIButton* to_create_button_image(NSString* imageName) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return button;
}


UIButton* to_create_button_backImage(NSString* imageName) {
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    return button;
}

UIImageView* to_create_imageview(NSString* imageName) {
    UIImageView* imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    return imageView;
}
