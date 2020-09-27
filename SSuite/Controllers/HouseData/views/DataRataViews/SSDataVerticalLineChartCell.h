//
//  SSDataVerticalLineChartCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/24.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoBMainTopView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SSDataVerticalLineChartCell : UITableViewCell<DemoBMainTopViewDelegate>

@property(nonatomic,strong)DemoBMainTopView *lineView;

@property(nonatomic,strong)UILabel *currentDateLab;
@property(nonatomic,strong)UILabel *totalLab;
@property(nonatomic,strong)UILabel *rateLab;
@property(nonatomic,strong)UILabel *rateMarkLab;

@end

NS_ASSUME_NONNULL_END
