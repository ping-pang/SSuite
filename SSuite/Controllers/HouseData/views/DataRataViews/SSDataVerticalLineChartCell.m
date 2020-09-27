//
//  SSDataVerticalLineChartCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/24.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataVerticalLineChartCell.h"

@implementation SSDataVerticalLineChartCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
       _lineView = [[DemoBMainTopView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, S_FIX(185))];
        _lineView.delegate = self;
        [self addSubview:_lineView];
        
        NSArray *arr = [self data];
        
        // 2.找最大值
          double max = 0;
        for (HistogramModel *m in arr) {
              if (m.value > max) {
                  max = m.value;
              }
          }
        
        [_lineView reloadWith:arr max:max];
        
        
        ////////
        
        UIView *dataView = [[UIView alloc]init];
          [self addSubview:dataView];
          dataView.backgroundColor = HEX(@"#F5F7FA");
          dataView.layer.cornerRadius = 12;
          [dataView mas_makeConstraints:^(MASConstraintMaker *make) {
              make.top.equalTo(_lineView.mas_bottom).mas_offset(S_FIX(18.8));
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
        
        
        _currentDateLab.text = @"9月";
         _totalLab.text = @"1,123.00";
         _rateMarkLab.text = @"较上月";
         _rateLab.text = @"0.45";
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - DemoBMainTopViewDelegate

- (void)topView:(DemoBMainTopView *)topView select:(NSInteger)row
{
//    HistogramModel *m = self.dataArray[row];
//    self.valueLabel.text = [NSString stringWithFormat:@"选中：%@年---值是：%ld",
//                            m.date,(long)m.value];
}


#pragma mark - 充当网络请求
- (NSArray *)data
{
    NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:15];
    
    for (int i = 0; i < 15; i++)
    {
        // 1 - 500 之间的随机数，充当每个柱状图柱子的代表值
        
        HistogramModel *m = [HistogramModel new];
        m.value = (long)(1 + (arc4random() % 500));
        m.date = [NSString stringWithFormat:@"%ld",(long)(2019 - 50 + i)];

        [dataArray addObject:m];
    }
    
    return dataArray;
}

@end
