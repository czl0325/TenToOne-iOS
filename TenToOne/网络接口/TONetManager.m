//
//  TONetManager.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/7/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TONetManager.h"
#import "TOBaseResponse.h"

#define base_url @"http://47.114.137.165:9002/api"

@implementation TONetManager

+ (BAURLSessionTask*)to_get:(NSString*)url params:(id)parameters success:(TOResponseSuccessBlock)success failure:(TOResponseFailureBlock)failure {
    BADataEntity *entity = [BADataEntity new];
    if (![url hasPrefix:@"http"]) {
        url = [base_url stringByAppendingString:url];
    }
    entity.urlString = url;
    entity.parameters = parameters;
    entity.needCache = NO;
    return [BANetManager ba_request_GETWithEntity:entity successBlock:^(id response) {
        TOBaseResponse* result = [TOBaseResponse mj_objectWithKeyValues:response];
        if (result.code == 0) {
            [MBProgressHUD hideHUD];
            if (success) {
                success(result.data);
            }
        } else {
            [MBProgressHUD showTipMessageInWindow:result.message];
            if (failure) {
                failure(result.message);
            }
        }
    } failureBlock:^(NSError *error) {
        [MBProgressHUD showTipMessageInWindow:error.localizedDescription];
        if (failure) {
            failure(error.localizedDescription);
        }
    } progressBlock:nil];
}

+ (BAURLSessionTask*)to_post:(NSString*)url params:(id)parameters success:(TOResponseSuccessBlock)success failure:(TOResponseFailureBlock)failure {
    BADataEntity *entity = [BADataEntity new];
    if (![url hasPrefix:@"http"]) {
        url = [base_url stringByAppendingString:url];
    }
    entity.urlString = url;
    entity.parameters = parameters;
    entity.needCache = NO;
    return [BANetManager ba_request_POSTWithEntity:entity successBlock:^(id response) {
        TOBaseResponse* result = [TOBaseResponse mj_objectWithKeyValues:response];
        if (result.code == 0) {
            [MBProgressHUD hideHUD];
            if (success) {
                success(result.data);
            }
        } else {
            [MBProgressHUD showTipMessageInWindow:result.message];
            if (failure) {
                failure(result.message);
            }
        }
    } failureBlock:^(NSError *error) {
        [MBProgressHUD showTipMessageInWindow:error.localizedDescription];
        if (failure) {
            failure(error.localizedDescription);
        }
    } progressBlock:nil];
}

@end
