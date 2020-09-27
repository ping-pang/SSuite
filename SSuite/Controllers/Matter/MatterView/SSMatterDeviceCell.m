//
//  SSMatterDeviceCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSMatterDeviceCell.h"

@implementation SSMatterDeviceCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1/1.0];
        
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.nameLab = [UILabel new];
        self.nameLab.font =  [UIFont fontWithName:@"PingFangTC-Medium" size:14];
        self.nameLab.textAlignment = NSTextAlignmentCenter;
        self.nameLab.textColor = [UIColor whiteColor];
        [self addSubview:_nameLab];
        _nameLab.backgroundColor = HEX(@"#73A4FF");
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.mas_equalTo(self);
            make.width.mas_equalTo(S_FIX(86));
        }];
        
        _offlineLab = [UILabel new];
        [self addSubview:_offlineLab];
        _offlineLab.font = [UIFont fontWithName:@"DINPro-Medium" size:20];
        _offlineLab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_offlineLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(S_FIX(8));
            make.height.mas_equalTo(S_FIX(26));
            make.centerX.mas_equalTo(self.mas_left).mas_offset(S_FIX(156));
        }];
        
        UILabel *offLineMark = [UILabel new];
        [self addSubview:offLineMark];
        offLineMark.text = @"离线";
        offLineMark.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        offLineMark.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [offLineMark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_offlineLab.mas_bottom).mas_offset(S_FIX(2));
            make.height.mas_equalTo(S_FIX(18));
            make.centerX.equalTo(_offlineLab);
        }];
        
        
        _lowPowerLab = [UILabel new];
        [self addSubview:_lowPowerLab];
        _lowPowerLab.font = [UIFont fontWithName:@"DINPro-Medium" size:20];
        _lowPowerLab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_lowPowerLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(S_FIX(8));
            make.height.mas_equalTo(S_FIX(26));
            make.centerX.mas_equalTo(self.mas_left).mas_offset(S_FIX(257));
        }];
        
        UILabel *lowPowerMark = [UILabel new];
        [self addSubview:lowPowerMark];
        lowPowerMark.text = @"低电量";
        lowPowerMark.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        lowPowerMark.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [lowPowerMark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_lowPowerLab.mas_bottom).mas_offset(S_FIX(2));
            make.height.mas_equalTo(S_FIX(18));
            make.centerX.equalTo(_lowPowerLab);
        }];
    }
    return self;
}

-(void)config{
    _nameLab.text = @"门锁";
    _offlineLab.text = @"5";
    _lowPowerLab.text = @"21";
}

@end
