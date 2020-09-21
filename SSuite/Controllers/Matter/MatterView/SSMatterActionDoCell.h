//
//  SSMatterActionDoCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSMatterActionDoCell : UICollectionViewCell

@property(nonatomic,strong)UILabel *totalMoneyNumLab;
@property(nonatomic,strong)UILabel *outMoneyMarkLab;
@property(nonatomic,strong)UILabel *alreadyMoneyMarkLab;
@property(nonatomic,strong)UILabel *outMoneyNumLab;
@property(nonatomic,strong)UILabel *alreadyMoneyNumLab;

-(void)config;

@end

NS_ASSUME_NONNULL_END
