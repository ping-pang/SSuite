//
//  SSDataRingChartCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/23.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ORRingChartView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSDataRingChartCell : UITableViewCell<ORRingChartViewDatasource>

@property(nonatomic,strong)ORRingChartView *chartView;

@property(nonatomic,strong)UILabel *waitNumLab;
@property(nonatomic,strong)UIImageView *compareLastIcon;
@property(nonatomic,strong)UILabel *compareLastRateLab;  

@property(nonatomic,strong)UILabel *alreadyNumLab;
@property(nonatomic,strong)UIImageView *compareMonthIcon;
@property(nonatomic,strong)UILabel *compareMonthRateLab;

-(void)config;

@end

NS_ASSUME_NONNULL_END
