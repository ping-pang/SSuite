//
//  SSDataCountEduCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/28.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountEduCell.h"

@implementation SSDataCountEduCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(24), 0, 150, S_FIX(22))];
    title.text = @"学历分布";
    title.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    title.textColor = HEX(@"333333");
    [self addSubview:title];
    
    _dataDesLab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(24), CGRectGetMaxY(title.frame)+S_FIX(4), 200, S_FIX(17))];
    [self addSubview:_dataDesLab];
    _dataDesLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _dataDesLab.textColor = HEX(@"999999");
    _dataDesLab.text = @"本科及以上学历占比超过70%";

    //68+76
    {
        _chartView = [[ORRingChartView alloc]initWithFrame:CGRectMake(S_FIX(30), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(26), SCREEN_WIDTH-S_FIX(40)*2, S_FIX(175))];
        _chartView.style = ORRingChartStyleRing;
        _chartView.config.ringWidth = 30;
        _chartView.config.ringLineWidth = 0;
        //    _chartView.config.animateDuration = 15;
        //    _chartView.config.neatInfoLine = YES;
        //                _chartView.config.infoLineWidth = 1;
        _chartView.config.minInfoInset= -S_FIX(15);
        _chartView.config.infoLineMargin = 0;//-10;
        _chartView.config.infoLineInMargin = 5;
        _chartView.config.infoLineBreakMargin = 5;
        _chartView.config.neatInfoLine = NO;
        _chartView.config.infoViewMargin = 5;
        //    minInfoInset：infoView的内容偏移，值越大，infoView越宽，默认0
        //    infoLineMargin：infoLine 至 周边 的距离，默认10  //左右
        //    infoLineInMargin：infoLine 至 环形图的距离，默认 10
        //    infoLineBreakMargin：infoLine折线距离，默认 15
        //    infoViewMargin：infoLine 至 infoView的距离，默认5
        
                    _chartView.dataSource = self;
                    [self addSubview:_chartView];
        
    }
    
    
    
}

-(UIView *)createBottomInfoPointColor:(UIColor *)color info:(NSString *)info{
    UIView *view = [UIView new];
    [self addSubview:view];
    
    UIView *pointView = [UIView new];
    [view addSubview:pointView];
    pointView.backgroundColor = color;
    pointView.layer.cornerRadius = S_FIX(4);
    [pointView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo( S_FIX(4));
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(view);
    }];
    return view;
}


#pragma mark -- <ORRingChartViewDatasource>
-(NSInteger)numberOfRingsOfChartView:(ORRingChartView *)chartView{
    return 4;
}

-(CGFloat)chartView:(ORRingChartView *)chartView valueAtRingIndex:(NSInteger)index{
    NSArray *arr = @[@"5",@"20",@"60",@"15"];
    
    return [arr[index] floatValue];
}

- (NSArray <UIColor *> *)chartView:(ORRingChartView *)chartView graidentColorsAtRingIndex:(NSInteger)index{
    
    NSArray *arr = @[HEX(@"#4EE8CC"),
                    HEX(@"#FFB469"),
                    HEX(@"#FF8484"),
                    HEX(@"#73A4FF")];
    return @[arr[index]];
}

- (UIColor *)chartView:(ORRingChartView *)chartView lineColorForInfoLineAtRingIndex:(NSInteger)index{
    
       NSArray *arr = @[HEX(@"#4EE8CC"),
                       HEX(@"#FFB469"),
                       HEX(@"#FF8484"),
                       HEX(@"#73A4FF")];
       return arr[index];
}

- (UIView *)chartView:(ORRingChartView *)chartView viewForTopInfoAtRingIndex:(NSInteger)index{
    NSArray *arr = @[@"5",@"20",@"60",@"15"];
    CGFloat width = [SSUtilities getWidthWithText:arr[index] height:10 font:13];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(width, 10, width, 10)];
    lab.text = arr[index];
    lab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    lab.textColor = HEX(@"666666");
    return lab;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
