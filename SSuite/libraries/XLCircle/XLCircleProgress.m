//
//  CircleView.m
//  YKL
//
//  Created by Apple on 15/12/7.
//  Copyright © 2015年 Apple. All rights reserved.
//

#import "XLCircleProgress.h"
#import "XLCircle.h"

@implementation XLCircleProgress
{
    XLCircle* _circle;
    UILabel *_percentLabel;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //默认形态
        _lineWidth = 15;
        _progress = .5;
        _bgRingStrokeColor = [UIColor lightGrayColor];
        _gradientColors = [NSArray arrayWithObjects:(id)[UIColor redColor],(id)[UIColor blueColor], nil];
        _lineCap = kCALineJoinRound;
        
    }
    return self;
}

-(void)initUI
{
    _percentLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _percentLabel.textColor = [UIColor whiteColor];
    _percentLabel.textAlignment = NSTextAlignmentCenter;
    _percentLabel.font = [UIFont boldSystemFontOfSize:50];
    _percentLabel.text = @"0%";
    [self addSubview:_percentLabel];
    
    _circle = [[XLCircle alloc] initWithFrame:self.bounds lineWidth:_lineWidth bgRingColor:_bgRingStrokeColor gradientColors:_gradientColors lineCap:_lineCap];
    [self addSubview:_circle];
}


-(void)useCenterView:(UIView *)view{
    _percentLabel.hidden = YES;
    view.backgroundColor = [UIColor clearColor];
//    view.frame = CGRectZero;
    CGFloat width = view.frame.size.width;
    CGFloat height = view.frame.size.height;
    CGFloat sfWidth = self.frame.size.width;
    CGFloat sfHeight = self.frame.size.height;
    view.frame = CGRectMake((sfWidth-width)/2, (sfHeight-height)/2, width, height);
    [self addSubview:view];
//    view.center = self.center;
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, S_FIX(90), S_FIX(90))];
//        UILabel *lab = [[UILabel alloc]init];
//    //    lab.textAlignment = NSTextAlignmentCenter;
//        NSString *value = @"60%";
//        NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:value];
//        [attributeStr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Thin" size:14],NSForegroundColorAttributeName:HEX(@"#0673FF")} range:NSMakeRange(value.length-1,1)];
//        [attributeStr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Thin" size:36],NSForegroundColorAttributeName:HEX(@"#0673FF")} range:NSMakeRange(0, value.length-1)];
//        lab.attributedText = attributeStr;
//        [view addSubview:lab];
//        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(view);
//            make.centerY.equalTo(view).mas_offset(-10);
//        }];
//
//        UILabel *titleLab = [[UILabel alloc]init];
//        titleLab.text = @"当前总出租率";
//        titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
//        titleLab.textColor = HEX(@"999999");
//        [view addSubview:titleLab];
//        [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(view);
//            make.centerY.equalTo(view).mas_offset(20);
//        }];
}

#pragma mark -
#pragma mark Setter方法
-(void)setProgress:(float)progress
{
    _progress = progress;

}

-(void)beginDraw{
    [self initUI];
    
    _circle.progress = _progress;
    _percentLabel.text = [NSString stringWithFormat:@"%.0f%%",_progress*100];
}


@end
