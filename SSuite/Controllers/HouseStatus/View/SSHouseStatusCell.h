//
//  SSHouseStatusCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSHouseStatusCell : UICollectionViewCell

@property(nonatomic,strong)UILabel *numLab;
@property(nonatomic,strong)UILabel *typeLab;
@property(nonatomic,strong)UILabel *moneyLab;
@property(nonatomic,strong)UILabel *statusLab;
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UIView *bottomView;


-(void)config;

@end

NS_ASSUME_NONNULL_END
