//
//  TOWebManager.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/7/6.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOWebManager.h"

@implementation TOWebManager

+ (BAURLSessionTask*)getSmsCode:(NSString*)mobile success:(_Nullable TOResponseSuccessBlock)success failure:(_Nullable TOResponseFailureBlock)failure {
    return [TONetManager to_post:@"/user/sms" params:@{@"mobile":mobile} success:success failure:failure];
}

+ (BAURLSessionTask*)loginBySms:(NSString*)mobile code:(NSString*)code success:(_Nullable TOResponseSuccessBlock)success failure:(_Nullable TOResponseFailureBlock)failure {
    return [TONetManager postWithBody:@"/user/login" params:@{@"mobile":mobile,@"code":code} success:success failure:failure];
}

@end
