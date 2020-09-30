//
//  CircleView.h
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLCircleProgress : UIView

//圆线宽度
@property(nonatomic,assign)float lineWidth;

//百分比
@property (assign,nonatomic) float progress;

//背景圆颜色
@property(nonatomic,strong)UIColor *bgRingStrokeColor;

//前景圆渐变色 CGColor
@property(nonatomic,strong)NSArray *gradientColors;

//闭合类型
@property(nonatomic,assign)CAShapeLayerLineCap lineCap;

@property(nonatomic,strong) UIFont *sigleTitleFont;
@property(nonatomic,strong)UIColor *sigleTitleColor;

-(void)useCenterView:(UIView *)view;

//配置好上面各项数据之后调用开始画圆
-(void)beginDraw;

@end
