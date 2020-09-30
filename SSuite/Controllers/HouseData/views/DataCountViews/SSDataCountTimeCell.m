//
//  SSDataCountTimeCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/30.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountTimeCell.h"

@implementation SSDataCountTimeCell

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
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(24), 0, 150, S_FIX(22))];
      title.text = @"政治面貌分布";
      title.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
      title.textColor = HEX(@"333333");
      [self addSubview:title];
      
      _dataDesLab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(24), CGRectGetMaxY(title.frame)+S_FIX(4), 200, S_FIX(17))];
      [self addSubview:_dataDesLab];
      _dataDesLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
      _dataDesLab.textColor = HEX(@"999999");
      _dataDesLab.text = @"租期6个月以下人数占比超80%";
    
    CGFloat y = CGRectGetMaxY(_dataDesLab.frame)+S_FIX(21.5);
    [self createCricleWithFrame:CGRectMake(S_FIX(26), y, S_FIX(70), S_FIX(105)) rate:.75 title:@"3个月以下"];
     [self createCricleWithFrame:CGRectMake(S_FIX(26)+(S_FIX(17)+S_FIX(70)), y, S_FIX(70), S_FIX(105)) rate:.2 title:@"3-6个月"];
     [self createCricleWithFrame:CGRectMake(S_FIX(26)+2*(S_FIX(17)+S_FIX(70)), y, S_FIX(70), S_FIX(105)) rate:.15 title:@"6-12个月"];
     [self createCricleWithFrame:CGRectMake(S_FIX(26)+3*(S_FIX(17)+S_FIX(70)), y, S_FIX(70), S_FIX(105)) rate:.25 title:@"1年及以上"];
    
}

-(void)createCricleWithFrame:(CGRect)frame rate:(CGFloat)rate title:(NSString *)title{
    XLCircleProgress *circle = [[XLCircleProgress alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, frame.size.width)];
    [self addSubview:circle];
    circle.lineWidth = S_FIX(6);
    circle.progress = rate;
    circle.bgRingStrokeColor = HEX(@"#F2F6FC");
    circle.gradientColors =     [NSArray arrayWithObjects:(id)HEX(@"#0673FF").CGColor,(id)HEX(@"#00D2FF").CGColor, nil];

   // [NSArray arrayWithObjects:HEX(@"#0673FF"),HEX(@"#00D2FF"), nil];
    circle.lineCap = kCALineCapRound;
    circle.sigleTitleFont = [UIFont fontWithName:@"PingFangSC-Light" size:16];
    circle.sigleTitleColor = HEX(@"#047AFF");
    [circle beginDraw];
    
    UILabel *markLab = [[UILabel alloc]initWithFrame:CGRectZero];
    markLab.text = title;
    markLab.textAlignment = NSTextAlignmentCenter;
    markLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    markLab.textColor = HEX(@"666666");
    [self addSubview:markLab];
    [markLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(S_FIX(18));
        make.top.equalTo(circle.mas_bottom).mas_offset(S_FIX(14));
        make.centerX.equalTo(circle.mas_centerX);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
