//
//  SSRadiuBottomCollectionView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSRadiuBottomCollectionView.h"

@implementation SSRadiuBottomCollectionView
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =  [UIColor colorWithRed:242/255.0f green:243/255.0f blue:244/255.0f alpha:1];
        UIView *radioView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-S_FIX(24), S_FIX(12))];
//        radioView.layer.cornerRadius = S_FIX(8);
//        radioView.layer.masksToBounds = YES;
        radioView.backgroundColor = [UIColor whiteColor];
        [self addSubview:radioView];
  
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:radioView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(12, 12)];

        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.fillColor = [UIColor blackColor].CGColor;
        maskLayer.frame = radioView.bounds;

        maskLayer.path = maskPath.CGPath;

        radioView.layer.mask = maskLayer;
    }
    return self;
}
@end
