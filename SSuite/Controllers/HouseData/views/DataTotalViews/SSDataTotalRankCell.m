//
//  SSDataTotalRankCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/22.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataTotalRankCell.h"

@implementation SSDataTotalRankCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        _nameLab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(30),0, SCREEN_WIDTH-100, S_FIX(18))];
        _nameLab.font = [UIFont systemFontOfSize:13];
        _nameLab.textColor = HEX(@"999999");
        [self addSubview:_nameLab];
        
//        _baseRateView = [[UIView alloc]initWithFrame:CGRectMake(S_FIX(30), S_FIX(26), S_FIX(240), S_FIX(12))];
//        _baseRateView.layer.cornerRadius = 6;
//        _baseRateView.backgroundColor = HEX(@"#F2F6FC");
//        [self addSubview:_baseRateView];
        
        _rateView = [[SSRataHorizontalLine alloc]initWithFrame:CGRectMake(S_FIX(30), S_FIX(26), S_FIX(240), S_FIX(12))];
        [self addSubview:_rateView];
        
        UIImageView *rightArrow = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-S_FIX(24)-S_FIX(5.4), S_FIX(27), S_FIX(5.4), S_FIX(9.5))];
        rightArrow.image = [UIImage imageNamed:@"right_arrow"];
        [self addSubview:rightArrow];
        
        _moneyLab = [[UILabel alloc]init];
        _moneyLab.font = [UIFont systemFontOfSize:13];
        _moneyLab.textColor = HEX(@"999999");
        [self addSubview:_moneyLab];
        [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(rightArrow.mas_left).mas_offset(-S_FIX(6.6));
            make.centerY.equalTo(rightArrow);
        }];
    }
    return self;
}

-(void)config{
    _nameLab.text = @"店铺名称";
    _moneyLab.text = @"100.00万";

    CGFloat rate = 1/3.00;
    
    [_rateView color:HEX(@"#2F6CFE") rate:rate];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
