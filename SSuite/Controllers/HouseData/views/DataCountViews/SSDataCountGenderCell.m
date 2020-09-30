//
//  SSDataCountGenderCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountGenderCell.h"

@interface SSDataCountGenderCell()
{
    UIView *rateView;
}
@end

@implementation SSDataCountGenderCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
    title.text = @"性别分布";
    title.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    title.textColor = HEX(@"333333");
    [self addSubview:title];
    
    _dataDesLab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(24), CGRectGetMaxY(title.frame)+S_FIX(4), 200, S_FIX(17))];
    [self addSubview:_dataDesLab];
    _dataDesLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _dataDesLab.textColor = HEX(@"999999");
    
    UILabel *manMark = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(29), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(22.5), S_FIX(13), S_FIX(17))];
    manMark.font =  [UIFont fontWithName:@"MicrosoftYaHei" size:13];
    manMark.textColor = HEX(@"666666");
    manMark.text = @"男";
    [self addSubview:manMark];
    
    UILabel *femaleMark = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(337), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(22.5), S_FIX(13), S_FIX(17))];
    femaleMark.font =  [UIFont fontWithName:@"MicrosoftYaHei" size:13];
    femaleMark.textColor = HEX(@"666666");
    femaleMark.text = @"女";
    [self addSubview:femaleMark];
    
    rateView = [[UIView alloc]initWithFrame:CGRectMake(S_FIX(57.5), CGRectGetMaxY(_dataDesLab.frame)+S_FIX(18), S_FIX(260), S_FIX(26))];
    rateView.layer.cornerRadius = 3;
    rateView.clipsToBounds = NO;
    rateView.backgroundColor = HEX(@"#F2F6FC");
    [self addSubview:rateView];
      
    UIView *middleLine = [[UIView alloc] init];
    middleLine.frame = CGRectMake(rateView.frame.size.width/2-.5,-S_FIX(6), 1, S_FIX(38));
    middleLine.backgroundColor = HEX(@"#DCDFE6");
    [rateView addSubview:middleLine];
}

-(void)config{

    _dataDesLab.text = @"女性居多";
    
// man
    CGFloat manRate = 2/3.0;
    
    CGFloat manStartP = (1.0-manRate)*S_FIX(130);
    UIView *manView = [[UIView alloc]initWithFrame:CGRectMake(manStartP, 0, S_FIX(130)-manStartP, S_FIX(26))];
    manView.backgroundColor = HEX(@"#2F6CFE");
    [rateView addSubview:manView];
    
    UIBezierPath *manMaskPath = [UIBezierPath bezierPathWithRoundedRect:manView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(3, 3)];
    
    CAShapeLayer *manMaskLayer = [[CAShapeLayer alloc] init];
    manMaskLayer.frame = manView.bounds;
    manMaskLayer.path = manMaskPath.CGPath;
    manView.layer.mask = manMaskLayer;
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = manView.bounds;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)HEX(@"#2F6CFE").CGColor,
                       (id)HEX(@"#7698FF").CGColor, nil];
    gradient.endPoint = CGPointMake(1, 0);
    [manView.layer addSublayer:gradient];
    
    _manLab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(4), S_FIX(6.5), 50, S_FIX(13))];
    _manLab.text = [NSString stringWithFormat:@"%.0f%@",manRate*100,@"%"];
    _manLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _manLab.textColor = HEX(@"FFFFFF");
    _manLab.backgroundColor = [UIColor clearColor];
    [manView addSubview:_manLab];
    
    
    
//female
    CGFloat femaleRate = 2/3.0;
    
    CGFloat femaleEndP = femaleRate*S_FIX(130);
    UIView *femaleView = [[UIView alloc]initWithFrame:CGRectMake(rateView.frame.size.width/2, 0, femaleEndP, S_FIX(26))];
    [rateView addSubview:femaleView];
    
    UIBezierPath *femaleMaskPath = [UIBezierPath bezierPathWithRoundedRect:femaleView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(3, 3)];
    
    CAShapeLayer *femaleMaskLayer = [[CAShapeLayer alloc] init];
    femaleMaskLayer.frame = femaleView.bounds;
    femaleMaskLayer.path = femaleMaskPath.CGPath;
    femaleView.layer.mask = femaleMaskLayer;
    
    CAGradientLayer *femaleGradient = [CAGradientLayer layer];
    femaleGradient.frame = femaleView.bounds;
    femaleGradient.colors = [NSArray arrayWithObjects:
                       (id)HEX(@"#F7837C").CGColor,
                       (id)HEX(@"#F7AA8B").CGColor, nil];
    femaleGradient.endPoint = CGPointMake(1, 0);
    [femaleView.layer addSublayer:femaleGradient];
    
    _femaleLab = [[UILabel alloc]initWithFrame:CGRectMake(femaleView.frame.size.width-50- S_FIX(4), S_FIX(6.5), 50, S_FIX(13))];
    _femaleLab.textAlignment = NSTextAlignmentRight;
    _femaleLab.text = [NSString stringWithFormat:@"%.0f%@",femaleRate*100,@"%"];
    _femaleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _femaleLab.textColor = HEX(@"FFFFFF");
    _femaleLab.backgroundColor = [UIColor clearColor];
    [femaleView addSubview:_femaleLab];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
