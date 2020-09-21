//
//  SSDataTotalGainBreakLineView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataTotalGainBreakLineView.h"

@implementation SSDataTotalGainBreakLineView


-(NSInteger)numberOfHorizontalDataOfChartView:(ORLineChartView *)chartView{
    return _horizontails.count;
}

-(CGFloat)chartView:(ORLineChartView *)chartView valueForHorizontalAtIndex:(NSInteger)index{
    return [_horizontails[index] floatValue];
}


-(NSString *)chartView:(ORLineChartView *)chartView titleForHorizontalAtIndex:(NSInteger)index{
    return [NSString stringWithFormat:@"%ld",index];
}

@end
