//
//  SSDataTopTypeItem.h
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    SSDataTopTypeItem_total,
    SSDataTopTypeItem_rate,
    SSDataTopTypeItem_count
}SSDataTopTypeItemType;

@interface SSDataTopTypeItem : UIView
@property(nonatomic,strong)UIImageView *icon;
@property(nonatomic,strong)UILabel *nameLab;
@property(nonatomic,strong)UILabel *dataLab;

@property(nonatomic,assign)SSDataTopTypeItemType type;

@property(nonatomic,copy)void((^clickBack)(NSNumber *typ));

-(void)config;

@end

NS_ASSUME_NONNULL_END
