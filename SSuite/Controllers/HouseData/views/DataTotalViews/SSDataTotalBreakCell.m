//
//  SSDataTotalBreakCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/22.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataTotalBreakCell.h"

@implementation SSDataTotalBreakCell

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
    _totalLineView = [[SSDataTotalGainBreakLineView alloc]init];
    _totalLineView.dataSource = _totalLineView;
    _totalLineView.config.style = ORLineChartStyleControl;
    _totalLineView.config.dottedBGLine = NO;
    _totalLineView.config.showHorizontalBgline = NO;
    _totalLineView.config.showVerticalBgline = NO;
    
    _totalLineView.config.leftWidth = 0;
    _totalLineView.config.chartLineColor = HEX(@"#0673FF");
    _totalLineView.config.shadowLineColor = HEX(@"#00D2FF");
    _totalLineView.config.gradientColors = @[HEX(@"FFFFFF")];
    [self addSubview:_totalLineView];
    [_totalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(169);
    }];
    
    //24/24/18.8
    
    UIView *dataView = [[UIView alloc]init];
    [self addSubview:dataView];
    dataView.backgroundColor = HEX(@"#F5F7FA");
    dataView.layer.cornerRadius = 12;
    [dataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_totalLineView.mas_bottom).mas_offset(S_FIX(18.8));
        make.left.mas_equalTo(S_FIX(24));
        make.right.mas_equalTo(S_FIX(-24));
        make.height.mas_equalTo(S_FIX(100));
    }];
    
    //15.5。  12。    H：17
    _currentDateLab = [UILabel new];
    [dataView addSubview:_currentDateLab];
    _currentDateLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _currentDateLab.textColor = HEX(@"999999");
    [_currentDateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(15.5));
        make.left.mas_equalTo(S_FIX(12));
        make.height.mas_equalTo(S_FIX(17));
    }];
    
    UILabel *unitLab = [UILabel new];
    [dataView addSubview:unitLab];
    unitLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    unitLab.textColor = HEX(@"999999");
    unitLab.text = @"收入总计(万元)";
    [unitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(15.5));
        make.left.equalTo(_currentDateLab.mas_right);
        make.height.mas_equalTo(S_FIX(17));
    }];
    
    _totalLab = [UILabel new];
    [dataView addSubview:_totalLab];
    _totalLab.textColor = HEX(@"333333");
    _totalLab.font = [UIFont boldSystemFontOfSize:36];//[UIFont fontWithName:@"DINPro-Medium" size:36];
    [_totalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(S_FIX(12));
        make.top.equalTo(_currentDateLab.mas_bottom).mas_offset(S_FIX(6));
        make.height.mas_equalTo(S_FIX(46));
    }];
    
    _rateLab = [UILabel new];
    [dataView addSubview:_rateLab];
    _rateLab.font =  [UIFont fontWithName:@"Helvetica" size:15];
    _rateLab.textColor = HEX(@"50D9D2");
    [_rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-S_FIX(12));
        make.top.equalTo(dataView).mas_offset(S_FIX(41.5));
        make.height.mas_equalTo(S_FIX(18));
    }];
    
    UIImageView *iconImgV = [[UIImageView alloc]init];
    [dataView addSubview:iconImgV];
    [iconImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(S_FIX(18));
        make.height.mas_equalTo(S_FIX(12));
        make.right.mas_equalTo(_rateLab.mas_left).mas_offset(-S_FIX(8));
        make.centerY.equalTo(_rateLab);
    }];
    
    _rateMarkLab = [UILabel new];
    _rateMarkLab.textColor = HEX(@"50D9D2");
    _rateMarkLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    [dataView addSubview:_rateMarkLab];
    [_rateMarkLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_rateLab);
        make.right.mas_equalTo(iconImgV.mas_left).mas_offset(-S_FIX(8));
    }];
}

-(void)config{
    _totalLineView.horizontails = @[@"20",@"30.5",@"40",@"35",@"60",@"10",@"0",@"60"];
    [_totalLineView reloadData];
    
    _currentDateLab.text = @"9月";
    _totalLab.text = @"1,123.00";
    _rateMarkLab.text = @"较上月";
    _rateLab.text = @"0.45";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
