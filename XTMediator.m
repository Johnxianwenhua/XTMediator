//
//  XTMediator.m
//  RouterDemo
//
//  Created by holdtime on 2017/3/13.
//  Copyright © 2017年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import "XTMediator.h"

//控制器命名要加 XT
#define kXTSecurity_target @"XT"
//方法命名要加   action
#define kXTSecurity_action @"action"

#define KXTViewController @"ViewController"

#define kXTNotFoundViewController @"action_notFoundViewController"

#define kXTNotFoundAction @"action_notFoundAction"

@implementation XTMediator

+ (instancetype)sharedInstance {
    static XTMediator *mediator;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        mediator = [[self alloc] init];
    });
    
    return mediator;
}

- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params {
    
    NSObject *target = [self target:targetName];
    
    if (target == nil) {
        SEL action = NSSelectorFromString(kXTNotFoundViewController);
        return [self returnTarget:[self target:KXTViewController] Action:action withObject:nil];
    }
    
    NSString *actionString = [NSString stringWithFormat:@"%@_%@:", kXTSecurity_action, actionName];
    SEL action = NSSelectorFromString(actionString);
    
    if ([target respondsToSelector:action]) {
        return [self returnTarget:target Action:action withObject:params];
    } else {
        SEL action = NSSelectorFromString(kXTNotFoundAction);
        return [self returnTarget:[self target:KXTViewController] Action:action withObject:nil];
    }
}

- (id)target:(NSString *)targetName {
    
    NSString *targetClassString = [NSString stringWithFormat:@"%@%@",kXTSecurity_target, targetName];
    
    Class targetClass = NSClassFromString(targetClassString);
    NSObject *target = [[targetClass alloc] init];
    
    return target;
}
- (id)returnTarget:(NSObject *)target Action:(SEL)action withObject:(NSDictionary *)params {
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    
    [target performSelector:action withObject:params];
    return target;
    
#pragma clang diagnostic pop
}
@end
