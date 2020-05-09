//
//  TOSingleton.m
//  TenToOne
//
//  Created by zhaoliang chen on 2020/5/9.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import "TOSingleton.h"

static TOSingleton * _instance = nil;

@implementation TOSingleton

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone ];
    });
    return _instance;
}

+(instancetype)sharedInstance{
    if (_instance == nil) {
        _instance = [[super alloc]init];
    }
    return _instance;
}

- (instancetype)init {
    if (self == [super init]) {
        self.userInfo = nil;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    return _instance;
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    return _instance;
}



@end
