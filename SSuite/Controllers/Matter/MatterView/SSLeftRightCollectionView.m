//
//  SSLeftRightCollectionView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSLeftRightCollectionView.h"

@implementation SSLeftRightCollectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
      
        self.backgroundColor = [UIColor colorWithRed:245/255.0f green:246/255.0f blue:246/255.0f alpha:1];
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-S_FIX(24), S_FIX(52))];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
//        [view mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.left.bottom.right.mas_equalTo(0);
//        }];
//
        
        
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(12, 12)];

        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//        maskLayer.fillColor = [UIColor blackColor].CGColor;
        maskLayer.frame = view.bounds;

        maskLayer.path = maskPath.CGPath;

        view.layer.mask = maskLayer;

      
        
        
        
        
        
        
        
        
        
        
        
        
        _leftImgV = [UIImageView new];
        [self addSubview:_leftImgV];
        
        _leftLable = [UILabel new];
        _leftLable.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
        _leftLable.textColor = HEX(@"333333");
        [self addSubview:_leftLable];
        
        _rightBtn = [UIButton new];
        [_rightBtn setTitleColor:HEX(@"C7C7C7") forState:UIControlStateNormal];
        _rightBtn.titleLabel.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        [self addSubview:_rightBtn];
        
        _rightArrow = [UIImageView new];
        _rightArrow.image = [UIImage imageNamed:@"sc_right_arrow"];
        [self addSubview:_rightArrow];
        
        [_leftImgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(S_FIX(12));
            make.centerY.mas_equalTo(self.mas_centerY);
            make.width.height.mas_equalTo(S_FIX(22));
        }];
        
        [_leftLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_leftImgV.mas_right).mas_offset(S_FIX(6));
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        [_rightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-S_FIX(14.5));
            make.width.mas_equalTo(S_FIX(5.4));
            make.height.mas_equalTo(S_FIX(9.5));
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        [_rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.equalTo(_rightArrow.mas_left).mas_offset(-S_FIX(4));
        }];
        
        _rightBtn.hidden = YES;
        _rightArrow.hidden = YES;
    }
    
    
           
   
    return self;
}


-(void)configleftImg:(NSString *)imgName lefName:(NSString *)leftName moreName:(NSString *)moreName{
    if ([SSUtilities isValidStr:imgName]) {
        _leftImgV.image = [UIImage imageNamed:imgName];
    }
    if ([SSUtilities isValidStr:leftName]) {
        _leftLable.text = leftName;
    }
    if ([SSUtilities isValidStr:moreName]) {
        _rightBtn.hidden = NO;
        _rightArrow.hidden = NO;
        [_rightBtn setTitle:moreName forState:UIControlStateNormal];
    }else{
        _rightBtn.hidden = YES;
        _rightArrow.hidden = YES;
    }
}

@end
