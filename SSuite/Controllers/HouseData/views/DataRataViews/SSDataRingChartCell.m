//
//  SSDataRingChartCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/23.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataRingChartCell.h"
#import "XLCircleProgress.h"

@interface SSDataRingChartCell()
{
    XLCircleProgress *_circle;
}
@end


@implementation SSDataRingChartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self createUI];
        
    }
    return self;
}

-(void)createUI{
//            _chartView = [[ORRingChartView alloc]initWithFrame:CGRectMake(S_FIX(30), S_FIX(36.5), S_FIX(110), S_FIX(110))];
//                _chartView.style = ORRingChartStyleRing;
//                _chartView.config.ringLineWidth = 0;
//            //    _chartView.config.animateDuration = 15;
//            //    _chartView.config.neatInfoLine = YES;
//    //            _chartView.config.minInfoInset=-50;
//            _chartView.config.infoLineWidth = 0;
//            _chartView.config.infoLineMargin = 0;
//            _chartView.config.infoLineInMargin = 0;
//            _chartView.config.infoLineBreakMargin = 0;
//            _chartView.config.infoViewMargin = 0;
//            //    minInfoInset：infoView的内容偏移，值越大，infoView越宽，默认0
//            //    infoLineMargin：infoLine 至 周边 的距离，默认10
//            //    infoLineInMargin：infoLine 至 环形图的距离，默认 10
//            //    infoLineBreakMargin：infoLine折线距离，默认 15
//            //    infoViewMargin：infoLine 至 infoView的距离，默认5
//
//                _chartView.dataSource = self;
//                [self addSubview:_chartView];
    
    
     _circle = [[XLCircleProgress alloc] initWithFrame:CGRectMake(S_FIX(30), S_FIX(36.5), S_FIX(110), S_FIX(110))];
     [self addSubview:_circle];
    _circle.lineWidth = 12;
     _circle.progress = 0.8;
    _circle.bgRingStrokeColor = HEX(@"#EBEFF8");
     _circle.gradientColors = [NSArray arrayWithObjects:(id)HEX(@"#00D2FF").CGColor,(id)HEX(@"#0673FF").CGColor,nil];
     _circle.lineCap = kCALineCapButt;
    [_circle beginDraw];
    [_circle useCenterView:[self viewForRingCenterOfChartView:nil]];

    
    
    UILabel *waitLab = [[UILabel alloc]init];
    waitLab.text = @"待租";
    waitLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    waitLab.textColor = HEX(@"999999");
    [self addSubview:waitLab];
    [waitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(35));
        make.left.mas_equalTo(_circle.mas_right).mas_offset(S_FIX(51));
        make.height.mas_equalTo(S_FIX(18));
    }];
    
    _waitNumLab = [[UILabel alloc]init];
    _waitNumLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    _waitNumLab.textColor = HEX(@"333333");
    [self addSubview:_waitNumLab];
    [_waitNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(waitLab);
        make.top.equalTo(waitLab.mas_bottom).mas_offset(S_FIX(4));
        make.height.mas_equalTo(S_FIX(22));
    }];
    
    UILabel *compereLastLab = [[UILabel alloc]init];
    compereLastLab.text = @"较去年";
    compereLastLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    compereLastLab.textColor = HEX(@"999999");
    [self addSubview:compereLastLab];
    [compereLastLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_waitNumLab.mas_bottom).mas_offset(S_FIX(20));
        make.leading.mas_equalTo(waitLab);
        make.height.mas_equalTo(S_FIX(18));
    }];
    
    _compareLastIcon = [[UIImageView alloc]init];
    [self addSubview:_compareLastIcon];
    [_compareLastIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(waitLab);
        make.width.mas_equalTo(S_FIX(18));
        make.height.mas_equalTo(S_FIX(12));
        make.top.equalTo(compereLastLab.mas_bottom).mas_offset(S_FIX(10));
    }];
    
    _compareLastRateLab = [[UILabel alloc]init];
    [self addSubview:_compareLastRateLab];
    _compareLastRateLab.font =  [UIFont fontWithName:@"Helvetica" size:14];
    _compareLastRateLab.textColor = HEX(@"#FF8484");  //降  #50D9D2 升
    [_compareLastRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_compareLastIcon.mas_right).mas_offset(S_FIX(3));
        make.height.mas_equalTo(S_FIX(17));
        make.top.equalTo(compereLastLab.mas_bottom).mas_offset(S_FIX(7));
    }];
    
    //////
    
    UILabel *alreadLab = [[UILabel alloc]init];
       alreadLab.text = @"已出租";
       alreadLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:13];
       alreadLab.textColor = HEX(@"999999");
       [self addSubview:alreadLab];
       [alreadLab mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.mas_equalTo(S_FIX(35));
           make.left.mas_equalTo(waitLab.mas_right).mas_offset(S_FIX(57));
           make.height.mas_equalTo(S_FIX(18));
       }];
       
       _alreadyNumLab = [[UILabel alloc]init];
       _alreadyNumLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
       _alreadyNumLab.textColor = HEX(@"333333");
       [self addSubview:_alreadyNumLab];
       [_alreadyNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
           make.leading.equalTo(alreadLab);
           make.top.equalTo(alreadLab.mas_bottom).mas_offset(S_FIX(4));
           make.height.mas_equalTo(S_FIX(22));
       }];
       
       UILabel *compereMonthLab = [[UILabel alloc]init];
       compereMonthLab.text = @"较上年同月";
       compereMonthLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
       compereMonthLab.textColor = HEX(@"999999");
       [self addSubview:compereMonthLab];
       [compereMonthLab mas_makeConstraints:^(MASConstraintMaker *make) {
           make.top.mas_equalTo(_alreadyNumLab.mas_bottom).mas_offset(S_FIX(20));
           make.leading.mas_equalTo(alreadLab);
           make.height.mas_equalTo(S_FIX(18));
       }];
       
       _compareMonthIcon = [[UIImageView alloc]init];
       [self addSubview:_compareMonthIcon];
       [_compareMonthIcon mas_makeConstraints:^(MASConstraintMaker *make) {
           make.leading.equalTo(alreadLab);
           make.width.mas_equalTo(S_FIX(18));
           make.height.mas_equalTo(S_FIX(12));
           make.top.equalTo(compereMonthLab.mas_bottom).mas_offset(S_FIX(10));
       }];
       
       _compareMonthRateLab = [[UILabel alloc]init];
       [self addSubview:_compareMonthRateLab];
       _compareMonthRateLab.font =  [UIFont fontWithName:@"Helvetica" size:14];
       _compareMonthRateLab.textColor = HEX(@"#FF8484");
       [_compareMonthRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(_compareMonthIcon.mas_right).mas_offset(S_FIX(3));
           make.height.mas_equalTo(S_FIX(17));
           make.top.equalTo(compereMonthLab.mas_bottom).mas_offset(S_FIX(7));
       }];
    
    
    
    
    
    
    
    
}

-(void)config{
    //#FF8484 降  #50D9D2 升
    _waitNumLab.text = @"1900间";
    _alreadyNumLab.text = @"2000间";
    _compareLastRateLab.text = @"0.45";
    _compareMonthRateLab.text = @"0.45";
//    _compareMonthIcon.image =
//    _compareLastIcon.image =
}




- (UIView *)viewForRingCenterOfChartView:(ORRingChartView *)chartView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, S_FIX(90), S_FIX(90))];
    UILabel *lab = [[UILabel alloc]init];
//    lab.textAlignment = NSTextAlignmentCenter;
    NSString *value = @"60%";
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:value];
    [attributeStr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Thin" size:14],NSForegroundColorAttributeName:HEX(@"#0673FF")} range:NSMakeRange(value.length-1,1)];
    [attributeStr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Thin" size:36],NSForegroundColorAttributeName:HEX(@"#0673FF")} range:NSMakeRange(0, value.length-1)];
    lab.attributedText = attributeStr;
    [view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.centerY.equalTo(view).mas_offset(-10);
    }];
    
    UILabel *titleLab = [[UILabel alloc]init];
    titleLab.text = @"当前总出租率";
    titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    titleLab.textColor = HEX(@"999999");
    [view addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.centerY.equalTo(view).mas_offset(20);
    }];
    return view;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
