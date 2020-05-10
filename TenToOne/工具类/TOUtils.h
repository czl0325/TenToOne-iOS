//
//  TOUtils.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/8.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


UILabel* to_createLabel_white(NSString* text);
UILabel* to_createLabel_black(NSString* text);
UILabel* to_createLabel_text_color(NSString* text, UIColor* color);
UILabel* to_createLabel_text_color_font(NSString* text, UIColor* color, CGFloat fontSize);
UIButton* to_create_button_left(NSString* title,NSString* imageName );
UIButton* to_create_button_Right(NSString* title,NSString* imageName );
UIButton* to_create_button_normal(NSString* title);
UIButton* to_create_button_image(NSString* imageName);
UIButton* to_create_button_backImage(NSString* imageName);
UIImageView* to_create_imageview(NSString* imageName);


NS_ASSUME_NONNULL_END
