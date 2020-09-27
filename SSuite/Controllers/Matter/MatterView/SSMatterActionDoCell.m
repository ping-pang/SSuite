//
//  SSMatterActionDoCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSMatterActionDoCell.h"

@implementation SSMatterActionDoCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];//HEX(@"#78A7FF");
        
        UIImageView *bgImgV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_bg_second"]];
        bgImgV.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:bgImgV];
        
        UILabel *title = [[UILabel alloc]init];
        [self addSubview:title];
        title.text = @"待处理总金额(元)";
        title.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        title.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1/1.0];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(S_FIX(12));
            make.centerX.mas_equalTo(self);
            make.height.mas_equalTo(S_FIX(18));
        }];
        
        _totalMoneyNumLab = [[UILabel alloc]init];
        [self addSubview:_totalMoneyNumLab];
        _totalMoneyNumLab.font = [UIFont systemFontOfSize:32];//[UIFont fontWithName:@"DINPro-Medium" size:32];
        _totalMoneyNumLab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_totalMoneyNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(title.mas_bottom).mas_offset(S_FIX(3));
            make.height.mas_equalTo(S_FIX(41));
            make.centerX.equalTo(self);
        }];
        
        _outMoneyMarkLab = [[UILabel alloc]init];
        [self addSubview:_outMoneyMarkLab];
        _outMoneyMarkLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _outMoneyMarkLab.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [_outMoneyMarkLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_totalMoneyNumLab.mas_bottom).mas_offset(S_FIX(18));
            make.height.mas_equalTo(S_FIX(18));
            make.centerX.equalTo(self).multipliedBy(.5);
        }];
        
        _outMoneyNumLab = [[UILabel alloc]init];
        [self addSubview:_outMoneyNumLab];
        _outMoneyNumLab.font = [UIFont fontWithName:@"DINPro-Medium" size:18];
        _outMoneyNumLab.textColor = [UIColor colorWithRed:239/255.0 green:115/255.0 blue:64/255.0 alpha:1/1.0];
        [_outMoneyNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_outMoneyMarkLab.mas_bottom).mas_offset(S_FIX(5));
            make.height.mas_equalTo(S_FIX(23));
            make.centerX.equalTo(self).multipliedBy(.5);
        }];
        
        //////
        _alreadyMoneyMarkLab = [[UILabel alloc]init];
        [self addSubview:_alreadyMoneyMarkLab];
        _alreadyMoneyMarkLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _alreadyMoneyMarkLab.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1/1.0];
        [_alreadyMoneyMarkLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_totalMoneyNumLab.mas_bottom).mas_offset(S_FIX(18));
            make.height.mas_equalTo(S_FIX(18));
            make.centerX.equalTo(self).multipliedBy(1.5);
        }];
        
        _alreadyMoneyNumLab = [[UILabel alloc]init];
        [self addSubview:_alreadyMoneyNumLab];
        _alreadyMoneyNumLab.font =  [UIFont fontWithName:@"DINPro-Medium" size:18];
        _alreadyMoneyNumLab.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1/1.0];
        [_alreadyMoneyNumLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_alreadyMoneyMarkLab.mas_bottom).mas_offset(S_FIX(5));
            make.height.mas_equalTo(S_FIX(23));
            make.centerX.equalTo(self).multipliedBy(1.5);
        }];
    }
    return self;
}

-(void)config{
    _totalMoneyNumLab.text = @"1,123,456.00";
    _outMoneyMarkLab.text = @"逾期2笔(元)";
    _outMoneyNumLab.text = @"21,289.00";
    _alreadyMoneyMarkLab.text = @"已出账2笔(元)";
    _alreadyMoneyNumLab.text = @"21,289.00";
}

@end
