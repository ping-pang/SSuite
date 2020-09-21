//
//  SSMatterItemCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSMatterItemCell : UICollectionViewCell

@property(nonatomic,strong)UILabel *numLab;
@property(nonatomic,strong)UILabel *nameLab;

-(void)configNum:(NSString *)num color:(NSString *)color title:(NSString *)title;

@end

NS_ASSUME_NONNULL_END
