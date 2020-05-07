//
//  UIResponder+deliver.m
//  ActionDeliverDemo
//
//  Created by chen on 2017/10/26.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "UIResponder+deliver.h"

@implementation UIResponder (deliver)
- (void)action_deliverEventsWithName:(NSString *)eventName parameter:(id)parameter {
    [self.nextResponder action_deliverEventsWithName:eventName parameter:parameter];
}
@end
