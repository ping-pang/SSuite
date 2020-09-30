//
//  SSDataCountPoliticsCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/30.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountPoliticsCell.h"

@implementation SSDataCountPoliticsCell

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
      _dataDesLab.text = @"党员人数占比小于30%";
    
    [self createRateView:CGRectMake(S_FIX(24), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(24), S_FIX(349), S_FIX(18)) title:@"党员" rate:.5];
      [self createRateView:CGRectMake(S_FIX(24), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(62), S_FIX(349), S_FIX(18)) title:@"共青团员" rate:.3];
      [self createRateView:CGRectMake(S_FIX(24), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(100), S_FIX(349), S_FIX(18)) title:@"群众" rate:.2];
      [self createRateView:CGRectMake(S_FIX(24), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(138), S_FIX(349), S_FIX(18)) title:@"未知" rate:.1];
    
    
}

-(void)createRateView:(CGRect)frame title:(NSString *)title rate:(CGFloat)rate{
    UIView *customView = [[UIView alloc]initWithFrame:frame];
    [self addSubview:customView];
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, (frame.size.height-S_FIX(18))/2, 100, S_FIX(18))];
    titleLab.text = title;
    titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    titleLab.textColor = HEX(@"666666");
    [customView addSubview:titleLab];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(S_FIX(68.5), (frame.size.height-S_FIX(12))/2, S_FIX(220), S_FIX(12))];
    [self addSubview:bgView];
    bgView.backgroundColor = HEX(@"#F2F6FC");
    bgView.layer.cornerRadius = S_FIX(6);
    bgView.layer.masksToBounds = YES;
    [customView addSubview:bgView];
    
    UIView *rateView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, rate*S_FIX(220), S_FIX(12))];
       [customView addSubview:rateView];
    rateView.layer.cornerRadius = S_FIX(6);
    rateView.layer.masksToBounds = YES;
    [bgView addSubview:rateView];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = rateView.bounds;
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.colors = @[(id)HEX(@"#F7AA8B").CGColor,(id)HEX(@"#F7837C").CGColor];
    [rateView.layer addSublayer:gradientLayer];
    
    
    UILabel *rateLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(bgView.frame)+S_FIX(9.5), 0, 30, frame.size.height)];
    rateLab.textAlignment = NSTextAlignmentLeft;
    rateLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    rateLab.textColor = HEX(@"666666");
    NSString *rateStr = [NSString stringWithFormat:@"%.0f%@",rate*100.00,@"%"];
    rateLab.text = rateStr;
    [customView addSubview:rateLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
