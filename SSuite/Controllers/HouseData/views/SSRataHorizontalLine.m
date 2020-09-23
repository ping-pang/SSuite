//
//  SSRataHorizontalLine.m
//  SSuite
//
//  Created by zhangtao on 2020/9/23.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSRataHorizontalLine.h"

@interface SSRataHorizontalLine()
@property(nonatomic,strong)UIView *rateView;
@end

@implementation SSRataHorizontalLine

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
//        _baseRateView = [[UIView alloc]initWithFrame:CGRectMake(S_FIX(30), S_FIX(26), S_FIX(240), S_FIX(12))];
        self.layer.cornerRadius = frame.size.height/2;//6;
        self.backgroundColor = HEX(@"#F2F6FC");
//               [self addSubview:_baseRateView];
               
               _rateView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, S_FIX(240)/2, S_FIX(12))];
        _rateView.layer.cornerRadius = frame.size.height/2;//6;
//               _rateView.backgroundColor = HEX(@"#2F6CFE");
               [self addSubview:_rateView];
    }
    return self;
}

-(void)color:(UIColor *)color rate:(CGFloat)rate{
    if (color) {
        _rateView.backgroundColor = color;
        _rateView.frame = CGRectMake(0, 0, rate * self.frame.size.width, self.frame.size.height);
//        [_rateView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.bottom.equalTo(self);
//            make.width.mas_equalTo(self.frame.size.width).multipliedBy(rate);
//        }];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
