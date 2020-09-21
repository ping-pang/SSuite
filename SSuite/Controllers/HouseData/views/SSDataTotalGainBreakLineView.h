//
//  SSDataTotalGainBreakLineView.h
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

/**
 *  总收入折线图
 */
#import "ORLineChartView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSDataTotalGainBreakLineView : ORLineChartView<ORLineChartViewDataSource>

@property(nonatomic,strong)NSArray *horizontails;

@end

NS_ASSUME_NONNULL_END
