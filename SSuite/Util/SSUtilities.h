//
//  SSUtilities.h
//  SSuite
//
//  Created by zhangtao on 2020/9/17.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSUtilities : NSObject

+(BOOL)isValidDic:(id)object;
+(BOOL)isValidArr:(id)object;
+(BOOL)isValidStr:(id)object;

@end

NS_ASSUME_NONNULL_END
