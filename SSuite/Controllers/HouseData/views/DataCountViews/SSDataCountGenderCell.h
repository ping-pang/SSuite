//
//  SSDataCountGenderCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSDataCountGenderCell : UITableViewCell

@property(nonatomic,strong)UILabel *dataDesLab;
@property(nonatomic,strong)UILabel *manLab;
@property(nonatomic,strong)UILabel *femaleLab;

-(void)config;
@end

NS_ASSUME_NONNULL_END
