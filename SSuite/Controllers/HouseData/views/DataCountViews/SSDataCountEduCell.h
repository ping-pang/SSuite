//
//  SSDataCountEduCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/28.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ORRingChartView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SSDataCountEduCell : UITableViewCell<ORRingChartViewDatasource>

@property(nonatomic,strong)UILabel *dataDesLab;

@property(nonatomic,strong)ORRingChartView *chartView;

@end

NS_ASSUME_NONNULL_END
