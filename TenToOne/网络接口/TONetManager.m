//
//  TONetManager.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/7/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TONetManager.h"
#import "TOBaseResponse.h"
#import "AFHTTPSessionManager.h"

#define base_url @"http://api.qsy999.com"

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
    // 自定义超时设置
    BANetManagerShare.timeoutInterval = 15;
    
    // 自定义添加请求头
    NSString *token = [TOSingleton sharedInstance].userInfo.accessToken ? : @"";
    NSDictionary *headerDict = @{
        @"Accept":@"application/json",
        @"Connection": @"keep-alive",
        @"Accept-Encoding":@"gzip",
        @"Access-Control-Allow-Origin": @"*",
        @"Access-Control-Allow-Headers": @"X-Requested-With",
        @"Vary": @"Accept-Encoding",
        @"Authorization": token
    };
    BANetManagerShare.httpHeaderFieldDictionary = headerDict;
    
    BADataEntity *entity = [BADataEntity new];
    if (![url hasPrefix:@"http"]) {
        url = [base_url stringByAppendingString:url];
    }
    entity.urlString = url;
    entity.parameters = [parameters mj_JSONString];
    entity.needCache = NO;
    entity.isSetQueryStringSerialization = YES;
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

+(NSURLSessionDataTask*)postWithBody:(NSString *)url
                              params:(NSDictionary *)params
                             success:(TOResponseSuccessBlock)success
                             failure:(TOResponseFailureBlock)failure {
    [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript", nil];
    mgr.requestSerializer.timeoutInterval=15.0f;
    
    if (![url hasPrefix:@"http"]) {
        url = [base_url stringByAppendingString:url];
    }
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    request.timeoutInterval= 20.0;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    // 设置body
    [request setHTTPBody:[params mj_JSONData]];
    
    NSURLSessionDataTask* task = [mgr dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
        if (!error) {
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
        } else {
            [MBProgressHUD showTipMessageInWindow:error.localizedDescription];
            if (failure) {
                failure(error.localizedDescription);
            }
        }
    }];
    [task resume];
    return task;
}

@end
