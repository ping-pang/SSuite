//
//  SSDataTotalBreakCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/22.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SSDataTotalGainBreakLineView.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSDataTotalBreakCell : UITableViewCell

@property(nonatomic,strong)SSDataTotalGainBreakLineView *totalLineView;
@property(nonatomic,strong)UILabel *currentDateLab;
@property(nonatomic,strong)UILabel *totalLab;
@property(nonatomic,strong)UILabel *rateLab;
@property(nonatomic,strong)UILabel *rateMarkLab;

-(void)config;

@end

NS_ASSUME_NONNULL_END
