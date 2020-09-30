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
        self.selectionStyle = UITableViewCellSelectionStyleNone;

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
    _femaleMark = [UILabel new];
    [self addSubview:_femaleMark];
    _femaleMark.text = @"";
    _femaleMark.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    _femaleMark.textColor = HEX(@"333333");
    [_femaleMark mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(128.3));
        make.left.mas_equalTo(S_FIX(188.5));
        make.height.mas_equalTo(S_FIX(20));
    }];
    _femaleRateLab = [UILabel new];
    [self addSubview:_femaleRateLab];
    _femaleRateLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _femaleRateLab.textColor = HEX(@"999999");
    [_femaleRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_femaleMark);
        make.top.equalTo(_femaleMark.mas_bottom).mas_offset(S_FIX(2));
        make.height.mas_equalTo(S_FIX(17));
    }];
    
     _youngMark = [UILabel new];
     [self addSubview:_youngMark];
     _youngMark.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
     _youngMark.textColor = HEX(@"333333");
     [_youngMark mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(_femaleRateLab.mas_bottom).mas_offset(S_FIX(14));
         make.leading.equalTo(_femaleMark);
         make.height.mas_equalTo(S_FIX(20));
     }];
     _youngRateLab = [UILabel new];
     [self addSubview:_youngRateLab];
     _youngRateLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
     _youngRateLab.textColor = HEX(@"999999");
     [_youngRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.leading.equalTo(_femaleMark);
         make.top.equalTo(_youngMark.mas_bottom).mas_offset(S_FIX(2));
         make.height.mas_equalTo(S_FIX(17));
     }];

     _eduMark = [UILabel new];
     [self addSubview:_eduMark];
     _eduMark.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
     _eduMark.textColor = HEX(@"333333");
     [_eduMark mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(_youngRateLab.mas_bottom).mas_offset(S_FIX(14));
         make.leading.equalTo(_femaleMark);
         make.height.mas_equalTo(S_FIX(20));
     }];
     _hightEduLab = [UILabel new];
     [self addSubview:_hightEduLab];
     _hightEduLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
     _hightEduLab.textColor = HEX(@"999999");
     [_hightEduLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.leading.equalTo(_femaleMark);
         make.top.equalTo(_eduMark.mas_bottom).mas_offset(S_FIX(2));
         make.height.mas_equalTo(S_FIX(17));
     }];
    
     _parkMark = [UILabel new];
     [self addSubview:_parkMark];
     _parkMark.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
     _parkMark.textColor = HEX(@"333333");
     [_parkMark mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(_hightEduLab.mas_bottom).mas_offset(S_FIX(14));
         make.leading.equalTo(_femaleMark);
         make.height.mas_equalTo(S_FIX(20));
     }];
     _partRateLab = [UILabel new];
     [self addSubview:_partRateLab];
     _partRateLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
     _partRateLab.textColor = HEX(@"999999");
     [_partRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.leading.equalTo(_femaleMark);
         make.top.equalTo(_parkMark.mas_bottom).mas_offset(S_FIX(2));
         make.height.mas_equalTo(S_FIX(17));
     }];
    
     _shortMark = [UILabel new];
     [self addSubview:_shortMark];
     _shortMark.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
     _shortMark.textColor = HEX(@"333333");
     [_shortMark mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(_partRateLab.mas_bottom).mas_offset(S_FIX(14));
         make.leading.equalTo(_femaleMark);
         make.height.mas_equalTo(S_FIX(20));
     }];
     _shortRateLab = [UILabel new];
     [self addSubview:_shortRateLab];
     _shortRateLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
     _shortRateLab.textColor = HEX(@"999999");
     [_shortRateLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.leading.equalTo(_femaleMark);
         make.top.equalTo(_shortMark.mas_bottom).mas_offset(S_FIX(2));
         make.height.mas_equalTo(S_FIX(17));
     }];
}

-(void)config{
    _totalCountLab.text = @"7890 0000";
    _currentCountLab.text = @"1 2000";
    
    _femaleMark.text = @"女性居多";
    _femaleRateLab.text = @"女性人数占比超80%";
    
    _youngMark.text = @"年轻人聚集";
    _youngRateLab.text = @"35岁以下人数占比超80%";
    
    _eduMark.text = @"学历较高";
    _hightEduLab.text = @"本科及以上学历人数占比超70%";
    
    _parkMark.text = @"党性待提高";
    _partRateLab.text = @"党员人数占比小于30%";
    
    _shortMark.text = @"短期停留";
    _shortRateLab.text = @"租期6个月以下人数占90%";
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
