//
//  UIButton+SCEextension.h
//  shopping
//
//  Created by zhangtao on 2020/7/7.
//  Copyright © 2020 jsmcc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, XGButtonEdgeInsetsStyle) {
    XGButtonEdgeInsetsStyleTop, // image在上，label在下
    XGButtonEdgeInsetsStyleLeft, // image在左，label在右
    XGButtonEdgeInsetsStyleBottom, // image在下，label在上
    XGButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (SCEextension)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(XGButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

-(void)badgeNum:(NSInteger)num fontSize:(NSInteger)size bgColor:(UIColor *)color;



@end

NS_ASSUME_NONNULL_END
