//
//  SSMatterDeviceCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSMatterDeviceCell : UICollectionViewCell

@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *offlineLab;
@property(nonatomic,strong)UILabel *lowPowerLab;

-(void)config;

@end

NS_ASSUME_NONNULL_END
