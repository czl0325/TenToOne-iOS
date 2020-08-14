//
//  TOSingleton.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TOSingleton : NSObject

+(instancetype)sharedInstance;

@property(nonatomic,strong)TOUserModel* __nullable userInfo;

@end

NS_ASSUME_NONNULL_END
