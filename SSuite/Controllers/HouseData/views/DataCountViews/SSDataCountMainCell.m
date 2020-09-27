//
//  SSDataCountMainCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountMainCell.h"

@implementation SSDataCountMainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self createUI];
    }
    return self;
}

-(void)createUI{
    //左边累计入住 框
    UIView *totalcountView = [[UIView alloc]init];
    [self addSubview:totalcountView];
    [totalcountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(22));
        make.left.mas_equalTo(S_FIX(18));
        make.width.mas_equalTo(S_FIX(162));
        make.height.mas_equalTo(S_FIX(66));
    }];
    
    UIImageView *imgv1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"data_list_bg"]];
    [totalcountView addSubview:imgv1];
    [imgv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.mas_equalTo(0);
    }];
    
    _totalCountLab = [UILabel new];
    [totalcountView addSubview:_totalCountLab];
    _totalCountLab.font = [UIFont fontWithName:@"DINPro-Medium" size:26];
    _totalCountLab.textColor = HEX(@"333333");
    [_totalCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(S_FIX(18));
        make.top.mas_equalTo(S_FIX(5));
        make.height.mas_equalTo(S_FIX(33));
    }];
    
    UILabel *totalMark = [UILabel new];
    [totalcountView addSubview:totalMark];
    totalMark.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    totalMark.textColor = HEX(@"999999");
    totalMark.text = @"累计入住 (人)";
    [totalMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_totalCountLab);
        make.top.mas_equalTo(_totalCountLab.mas_bottom).mas_offset(S_FIX(6));
        make.height.mas_equalTo(S_FIX(17));
    }];
    
     //右边当前在住 框
        UIView *currentCountView = [[UIView alloc]init];
        [self addSubview:currentCountView];
        [currentCountView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(totalcountView);
            make.left.equalTo(totalcountView.mas_right).mas_offset(S_FIX(15));
            make.width.mas_equalTo(S_FIX(162));
            make.height.mas_equalTo(S_FIX(66));
        }];
        
        UIImageView *imgv2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"data_list_bg"]];
        [currentCountView addSubview:imgv2];
        [imgv2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.mas_equalTo(0);
        }];
        
        _currentCountLab = [UILabel new];
        [currentCountView addSubview:_currentCountLab];
        _currentCountLab.font = [UIFont fontWithName:@"DINPro-Medium" size:26];
        _currentCountLab.textColor = HEX(@"333333");
        [_currentCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(S_FIX(18));
            make.top.mas_equalTo(S_FIX(5));
            make.height.mas_equalTo(S_FIX(33));
        }];
        
        UILabel *currentMark = [UILabel new];
        [currentCountView addSubview:currentMark];
        currentMark.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        currentMark.textColor = HEX(@"999999");
        currentMark.text = @"当前在住 (人)";
        [currentMark mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_currentCountLab);
            make.top.mas_equalTo(_totalCountLab.mas_bottom).mas_offset(S_FIX(6));
            make.height.mas_equalTo(S_FIX(17));
        }];
    
    
    //  租客群体画
    UIImageView *groupImgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"groupWrite"]];
    [self addSubview:groupImgv];
    [groupImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(151.4));
        make.left.mas_equalTo(S_FIX(20));
        make.width.height.mas_equalTo(S_FIX(148.8));
    }];
    
    //数据
    
}

-(void)config{
    _totalCountLab.text = @"7890 0000";
    _currentCountLab.text = @"1 2000";
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
