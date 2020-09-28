//
//  SSDataCountAgeVerticalView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountAgeVerticalView.h"
@implementation SSDataCountAgeVerticalView

-(instancetype)initWithFrame:(CGRect)frame rate:(CGFloat)rate percent:(CGFloat)per description:(NSString *)des{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2;
        self.backgroundColor = HEX(@"#F2F6FC");
        
        UIView *rateView = [[UIView alloc]initWithFrame:CGRectMake(0, (1.0-rate)*frame.size.height, frame.size.width, rate*frame.size.height)];
        rateView.layer.cornerRadius = 2;
        [self addSubview:rateView];
//        CAGradientLayer
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.cornerRadius = 2;
        gradient.frame = rateView.bounds;
        gradient.endPoint = CGPointMake(0, 1);
        gradient.colors = [NSArray arrayWithObjects:
        (id)HEX(@"#7698FF").CGColor,
        (id)HEX(@"#2F6CFE").CGColor, nil];
        [rateView.layer addSublayer:gradient];
        
        UILabel *perLab = [[UILabel alloc]initWithFrame:CGRectMake(0, S_FIX(8.9), rateView.frame.size.width, S_FIX(13))];
        perLab.textAlignment = NSTextAlignmentCenter;
        NSString *percent = [NSString stringWithFormat:@"%.0f%@",per,@"%"];
        perLab.text = percent;
        perLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        perLab.textColor = HEX(@"FFFFFF");
        [rateView addSubview:perLab];
        
        UILabel *desLab = [[UILabel alloc]init];
        desLab.text = des;
        desLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        desLab.textColor = HEX(@"666666");

        [self addSubview:desLab];
        CGFloat desWidth = [SSUtilities getWidthWithText:des height:self.frame.size.width font:13];
        [desLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.bottom.mas_equalTo(rateView.mas_top).mas_offset(-S_FIX(13.1));
//            make.top.equalTo(rateView.mas_left).mas_offset(S_FIX(14));
            make.height.mas_equalTo(S_FIX(18));
            make.centerX.equalTo(self);
            make.centerY.equalTo(rateView.mas_top).mas_offset(-(S_FIX(14)+desWidth/2));
        }];

        desLab.transform = CGAffineTransformMakeRotation(-M_PI_2);

    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
