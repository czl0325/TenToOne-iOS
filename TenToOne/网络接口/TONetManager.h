//
//  TONetManager.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/7/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BANetManager_OC.h"

NS_ASSUME_NONNULL_BEGIN

typedef void( ^TOResponseSuccessBlock)(id data);
typedef void( ^TOResponseFailureBlock)(NSString* message);

@interface TONetManager : NSObject

+ (BAURLSessionTask*)to_get:(NSString*)url params:(id)parameters success:(_Nullable TOResponseSuccessBlock)success failure:(_Nullable TOResponseFailureBlock)failure;
+ (BAURLSessionTask*)to_post:(NSString*)url params:(id)parameters success:(_Nullable TOResponseSuccessBlock)success failure:(_Nullable TOResponseFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
