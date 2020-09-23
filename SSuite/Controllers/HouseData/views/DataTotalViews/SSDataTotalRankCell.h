//
//  SSDataTotalRankCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/22.
//  Copyright © 2020 ssuite. All rights reserved.
//
/**排行榜cell*/
#import <UIKit/UIKit.h>
#import "SSRataHorizontalLine.h"
NS_ASSUME_NONNULL_BEGIN

@interface SSDataTotalRankCell : UITableViewCell

@property(nonatomic,strong)UILabel *nameLab;
//@property(nonatomic,strong)UIView *baseRateView;
@property(nonatomic,strong)SSRataHorizontalLine *rateView;
@property(nonatomic,strong)UILabel *moneyLab;

-(void)config;

@end

NS_ASSUME_NONNULL_END
