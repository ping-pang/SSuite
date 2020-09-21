//
//  SSMatterGridCollectionCell.h
//  SSuite
//
//  Created by zhangtao on 2020/9/19.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSMatterGridCollectionCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *imgV;
@property(nonatomic,strong)UILabel *title;

-(void)configModel;

@end

NS_ASSUME_NONNULL_END
