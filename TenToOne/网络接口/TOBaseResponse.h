//
//  TOBaseResponse.h
//  TenToOne
//
//  Created by zhaoliang chen on 2020/7/7.
//  Copyright © 2020 zhaoliang chen. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TOBaseResponse : NSObject

@property(nonatomic,assign)NSInteger code;
@property(nonatomic,strong)NSString* message;
@property(nonatomic,strong)id data;

@end

NS_ASSUME_NONNULL_END
