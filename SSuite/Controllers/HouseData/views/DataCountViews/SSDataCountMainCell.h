//
//  SSDataCountMainCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSDataCountMainCell : UITableViewCell

@property(nonatomic,strong)UILabel *totalCountLab;
@property(nonatomic,strong)UILabel *currentCountLab;
@property(nonatomic,strong)UILabel *femaleRateLab; //女性占比
@property(nonatomic,strong)UILabel *youngRateLab;  //年轻人占比
@property(nonatomic,strong)UILabel *hightEduLab;  //高学历占比
@property(nonatomic,strong)UILabel *partRateLab;  //党员
@property(nonatomic,strong)UILabel *shortRateLab;  //短期

-(void)config;

@end

NS_ASSUME_NONNULL_END
