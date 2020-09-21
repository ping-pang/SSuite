//
//  SSRadiuTopCollectionView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSRadiuTopCollectionView.h"

@implementation SSRadiuTopCollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(12, 12)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
    }
    return self;
}

@end
