//
//  SSRataHorizontalLine.h
//  SSuite
//
//  Created by zhangtao on 2020/9/23.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSRataHorizontalLine : UIView

/// 横 比例条
/// @param color 前景条色
/// @param rate 前景条长度比例  rate<1
-(void)color:(UIColor *)color rate:(CGFloat)rate;

@end

NS_ASSUME_NONNULL_END
