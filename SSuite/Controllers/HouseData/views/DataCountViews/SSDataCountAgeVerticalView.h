//
//  SSDataCountAgeVerticalView.h
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//
/**
 *  年龄分布的柱状图
 */
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSDataCountAgeVerticalView : UIView
-(instancetype)initWithFrame:(CGRect)frame rate:(CGFloat)rate percent:(CGFloat)per description:(NSString *)des;
@end

NS_ASSUME_NONNULL_END
