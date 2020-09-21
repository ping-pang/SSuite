//
//  SSLeftRightCollectionView.h
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SSLeftRightCollectionView : UICollectionReusableView

@property(nonatomic,strong)UIImageView *leftImgV;
@property(nonatomic,strong)UILabel *leftLable;
@property(nonatomic,strong)UIButton *rightBtn;
@property(nonatomic,strong)UIImageView *rightArrow;

-(void)configleftImg:(NSString *)imgName lefName:(NSString *)leftName moreName:(NSString *)moreName;

@end

NS_ASSUME_NONNULL_END
