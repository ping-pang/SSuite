//
//  SSDataTopTypeItem.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataTopTypeItem.h"

@interface SSDataTopTypeItem()
@property(nonatomic,strong)UILabel *perLab;
@end

@implementation SSDataTopTypeItem

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = HEX(@"#BDD5FF");
        self.layer.cornerRadius = 20;
    
        _icon = [UIImageView new];
        [self addSubview:_icon];
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(S_FIX(14));
            make.width.height.mas_equalTo(S_FIX(38));
        }];
        
        _nameLab = [UILabel new];
        [self addSubview:_nameLab];
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _nameLab.textColor =HEX(@"#606266");
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(S_FIX(14));
            make.top.equalTo(_icon.mas_bottom).mas_offset(S_FIX(22));
            make.height.mas_equalTo(S_FIX(18));
        }];
        
        _dataLab = [UILabel new];
        [self addSubview:_dataLab];
        _dataLab.font =  [UIFont fontWithName:@"DINAlternate-Bold" size:24];;
        _dataLab.textColor = HEX(@"#606266");
        [_dataLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(S_FIX(14));
            make.top.equalTo(_nameLab.mas_bottom).mas_offset(S_FIX(6));
            make.height.mas_equalTo(S_FIX(28));
        }];
        
        self.perLab = [UILabel new];
        [self addSubview:self.perLab];
        _perLab.text = @"%";
        _perLab.font =  [UIFont fontWithName:@"DINAlternate-Bold" size:14];
        _perLab.textColor =[UIColor colorWithRed:96/255.0 green:98/255.0 blue:102/255.0 alpha:1/1.0];
        [_perLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(_dataLab.mas_bottom);
            make.left.mas_equalTo(_dataLab.mas_right);
        }];
        _perLab.hidden = YES;

        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

-(void)tap{
    if (self.clickBack) {
        self.clickBack([NSNumber numberWithInteger:_type]);
    }
}

-(void)config{
    _perLab.hidden = YES;
    _icon.image = [UIImage imageNamed:@"placeholdimg2"];
    if (_type == SSDataTopTypeItem_total) {
        _nameLab.text = @"近30天总收入(元)";
    }else if (_type == SSDataTopTypeItem_rate){
        _perLab.hidden = NO;
        _nameLab.text = @"出租率";
    }else if (_type == SSDataTopTypeItem_count){
        _nameLab.text = @"在住人数";
    }
    
    _dataLab.text = @"1900";
}


@end
