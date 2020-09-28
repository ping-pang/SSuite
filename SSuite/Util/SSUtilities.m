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

+ (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(CGFloat)font{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)

                                     options:NSStringDrawingUsesLineFragmentOrigin

                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}

                                     context:nil];
    return rect.size.width;

}

@end
