//
//  TOWebManager.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/7/6.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TONetManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface TOWebManager : NSObject

+ (BAURLSessionTask*)getSmsCode:(NSString*)mobile success:(_Nullable TOResponseSuccessBlock)success failure:(_Nullable TOResponseFailureBlock)failure;

+ (BAURLSessionTask*)loginBySms:(NSString*)mobile code:(NSString*)code success:(_Nullable TOResponseSuccessBlock)success failure:(_Nullable TOResponseFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
