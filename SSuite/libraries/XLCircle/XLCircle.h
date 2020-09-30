//
//  Circle.h
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLCircle : UIView

-(instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth bgRingColor:(UIColor *)bgColor gradientColors:(NSArray <UIColor *>*)colors lineCap:(CAShapeLayerLineCap)lineCap;

@property (assign,nonatomic) float progress;

@end
