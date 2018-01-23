//
//  XTMediator.h
//  RouterDemo
//
//  Created by holdtime on 2017/3/13.
//  Copyright © 2017年 www.bthdtm.com 豪德天沐移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XTMediator : NSObject

// 本地组件调用入口
- (id)performTarget:(NSString *)targetName action:(NSString *)actionName params:(NSDictionary *)params;

@end
