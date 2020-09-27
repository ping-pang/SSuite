//
//  SSDataCountEduVerticalView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountEduVerticalView.h"

@implementation SSDataCountEduVerticalView

-(instancetype)initWithFrame:(CGRect)frame rate:(CGFloat)rate percent:(CGFloat)per description:(NSString *)des{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 2;
        self.backgroundColor = HEX(@"#F2F6FC");
        
        UIView *rateView = [[UIView alloc]initWithFrame:CGRectMake(0, (1.0-rate)*frame.size.height, frame.size.width, rate*frame.size.height)];
        rateView.layer.cornerRadius = 2;
//        CAGradientLayer
        CAGradientLayer *gradient = [CAGradientLayer layer];
        gradient.frame = rateView.frame;
        gradient.endPoint = CGPointMake(0, 1);
        gradient.colors = [NSArray arrayWithObjects:
        (id)HEX(@"#7698FF").CGColor,
        (id)HEX(@"#2F6CFE").CGColor, nil];
        [rateView.layer addSublayer:gradient];
        
        NSString *percent = [NSString stringWithFormat:@"%@%@",per,@"%"];
        UILabel *perLab = [[UILabel alloc]initWithFrame:CGRectMake(0, S_FIX(8.9), rateView.frame.size.height, S_FIX(13))];
        perLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        perLab.textColor = HEX(@"FFFFFF");
        perLab.text = percent;
        [rateView addSubview:perLab];
        
        
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
