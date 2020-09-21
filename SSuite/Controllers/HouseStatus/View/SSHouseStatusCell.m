//
//  SSHouseStatusCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSHouseStatusCell.h"

@implementation SSHouseStatusCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        _numLab = [UILabel new];
        [self addSubview:_numLab];
        _numLab.font = [UIFont boldSystemFontOfSize:22];//[UIFont fontWithName:@"DINPro-Bold" size:22];
        _numLab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(S_FIX(12));
            make.height.mas_equalTo(S_FIX(22));
            make.centerX.equalTo(self);
        }];
        
        _typeLab = [UILabel new];
               [self addSubview:_typeLab];
               _typeLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:14];
               _typeLab.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
               [_typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.top.mas_equalTo(_numLab.mas_bottom).mas_offset(S_FIX(4));
                   make.height.mas_equalTo(S_FIX(20));
                   make.centerX.equalTo(self);
               }];
        
        _moneyLab = [UILabel new];
                 [self addSubview:_moneyLab];
                 _moneyLab.font =  [UIFont fontWithName:@"PingFangSC-Regular" size:14];
                 _moneyLab.textColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1/1.0];

                 [_moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
                     make.top.mas_equalTo(_typeLab.mas_bottom).mas_offset(S_FIX(6));
                     make.height.mas_equalTo(S_FIX(20));
                     make.centerX.equalTo(self);
                 }];
        
        _bottomView = [UIView new];
        [self addSubview:_bottomView];
        _bottomView.backgroundColor = HEX(@"#DFFAF3");
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.mas_equalTo(S_FIX(38));
        }];
        
        _icon = [[UIImageView alloc]init];
        [_bottomView addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(S_FIX(20.5));
            make.width.mas_equalTo(S_FIX(11));
            make.height.mas_equalTo(S_FIX(12.5));
            make.centerY.equalTo(_bottomView);
        }];
        
        _statusLab = [UILabel new];
                       [self addSubview:_statusLab];
                       _statusLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];

                       [_statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
                           make.left.equalTo(_icon.mas_right).mas_offset(S_FIX(5.5));
                            make.centerY.equalTo(_bottomView);
                       }];
    }
    return self;
}

-(void)config{
    
    _numLab.text = @"102";
    _typeLab.text = @"户型A | 南";
    _moneyLab.text = @"900/月";
    _icon.image = [UIImage imageNamed:@"Tab_Home"];
    _statusLab.textColor = [UIColor colorWithRed:255/255.0 green:96/255.0 blue:16/255.0 alpha:1/1.0];
    _statusLab.text = @"闲置31天";
    
}

@end
