//
//  SSMatterTitleView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/20.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSMatterTitleView.h"

@implementation SSMatterTitleView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.title = [[UILabel alloc]init];
        [self addSubview:_title];
        _title.font = [UIFont systemFontOfSize:18];
        _title.textColor = HEX(@"#5B84FF");
        _title.text = @"待办事项";
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.centerY.equalTo(self.mas_centerY);
        }];
        
        UIImageView *imgv = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_title"]];
        [self addSubview:imgv];
        [imgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_title);
            make.centerY.equalTo(_title);
        }];
    }
    return self;
}

@end
