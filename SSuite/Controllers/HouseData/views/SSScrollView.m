//
//  SSScrollView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSScrollView.h"

@implementation SSScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
//    UIView *view = [super hitTest:point withEvent:event];
//    if (view == nil) {
//       // 大小为0,0开始 contentSize.width,为宽度的矩形。
//        CGRect rect = CGRectMake(0, 0, self.contentSize.width, self.frame.size.height);
//       // 只要在矩形范围内，最合适的view返回self。
//        if (CGRectContainsPoint(rect, point)) {
//            view = self;
//        }
//    }
//    return view;
//}

@end
