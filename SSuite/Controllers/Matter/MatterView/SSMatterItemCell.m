//
//  SSMatterItemCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSMatterItemCell.h"

@implementation SSMatterItemCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.backgroundColor = HEX(@"F8F8F8");
        
        _numLab = [[UILabel alloc]init];
        _numLab.font =  [UIFont fontWithName:@"DINPro-Medium" size:20];
        _numLab.text = @"0";
        [self addSubview:_numLab];
        
        _nameLab = [[UILabel alloc]init];
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        [self addSubview:_nameLab];
        
        [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(S_FIX(8));
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.mas_equalTo(S_FIX(26));
        }];
        
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-S_FIX(6));
            make.centerX.mas_equalTo(self.mas_centerX);
            make.height.mas_equalTo(S_FIX(18));
        }];
    }
    return self;
}

-(void)configNum:(NSString *)num color:(NSString *)color title:(nonnull NSString *)title{
    if ([SSUtilities isValidStr:num] && ![num isEqualToString:@"0"]) {
        _numLab.text = num;
        _numLab.textColor = HEX(color);
        _nameLab.textColor = HEX(@"666666");
    }else{
        _nameLab.textColor = HEX(@"CCCCCC");
        _numLab.textColor = HEX(@"CCCCCC");
    }
    
    if ([SSUtilities isValidStr:title]) {
        _nameLab.text = title;
    }
}

@end
