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
UIButton* to_create_button_left(NSString* title,NSString* imageName );
UIButton* to_create_button_Right(NSString* title,NSString* imageName );
UIButton* to_create_button_normal(NSString* title);
UIButton* to_create_button_image(NSString* imageName);
UIButton* to_create_button_backImage(NSString* imageName);


NS_ASSUME_NONNULL_END
