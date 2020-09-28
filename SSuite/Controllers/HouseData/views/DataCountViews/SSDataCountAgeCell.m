//
//  SSDataCountAgeCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/27.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountAgeCell.h"
#import "SSDataCountAgeVerticalView.h"

@interface SSDataCountAgeCell()

@end

@implementation SSDataCountAgeCell

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
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(24), 0, 150, S_FIX(22))];
    title.text = @"年龄分布";
    title.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    title.textColor = HEX(@"333333");
    [self addSubview:title];
    
    _dataDesLab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(24), CGRectGetMaxY(title.frame)+S_FIX(4), 200, S_FIX(17))];
    [self addSubview:_dataDesLab];
    _dataDesLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    _dataDesLab.textColor = HEX(@"999999");
    
    UIView *ageRateView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_dataDesLab.frame)+S_FIX(30), self.frame.size.width, S_FIX(223))];
    [self addSubview:ageRateView];
    
    [ageRateView addSubview:[self averageSpaceView]];
    
    
    for (int i = 0; i<4; i++) {
        SSDataCountAgeVerticalView *ageRateLine = [[SSDataCountAgeVerticalView alloc]initWithFrame:CGRectMake(i*(S_FIX(30)+S_FIX(46))+S_FIX(71.2), 0, S_FIX(46), S_FIX(223)) rate:0.5 percent:40 description:@"25-30岁"];
        [ageRateView addSubview:ageRateLine];
    }
    

}

//左侧数据平分
-(UIView *)averageSpaceView{
    
    NSArray *arr = @[@"200",@"400",@"600",@"800",@"n"];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(S_FIX(24), 0, S_FIX(24+23.2), S_FIX(223))];
    CGFloat height = S_FIX(223);
    CGFloat space = S_FIX(34);
    for (int i = 0; i<arr.count; i++) {
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, height-S_FIX(18)-(space+S_FIX(18))*i, S_FIX(24+23.2), S_FIX(18))];
        lab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        lab.textColor = HEX(@"666666");
        lab.text = arr[i];
        lab.textAlignment = NSTextAlignmentLeft;
         [view addSubview:lab];
    }
    
    return view;
}

-(void)config{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
