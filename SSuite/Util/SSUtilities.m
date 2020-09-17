//
//  SSUtilities.m
//  SSuite
//
//  Created by zhangtao on 2020/9/17.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSUtilities.h"

@implementation SSUtilities

+ (BOOL)isValidDic:(id)object
{
    return object && [object isKindOfClass:[NSDictionary class]] && ((NSDictionary *)object).count;
    
}

+ (BOOL)isValidArr:(id)object
{
    return object && [object isKindOfClass:[NSArray class]] && ((NSArray *)object).count;
}

+ (BOOL)isValidStr:(id)object
{
    return object && [object isKindOfClass:[NSString class]] && ((NSString *)object).length;
}

@end
