//
//  SSSingleTitleView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/23.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSSingleTitleView.h"

@implementation SSSingleTitleView

// height 76
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
           self.backgroundColor = [UIColor whiteColor];
           _titleLab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(30), S_FIX(36), 150, S_FIX(22))];
           _titleLab.font = [UIFont boldSystemFontOfSize:16];//[UIFont fontWithName:@"PingFangSC-Semibold" size:16];
           _titleLab.textColor = HEX(@"333333");
           [self addSubview:_titleLab];
        [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(S_FIX(30));
            make.top.mas_equalTo(S_FIX(36));
            make.height.mas_equalTo(S_FIX(22));
        }];
    }
    return self;
}

@end
