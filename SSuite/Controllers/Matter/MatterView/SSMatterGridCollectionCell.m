//
//  SSMatterGridCollectionCell.m
//  SSuite
//
//  Created by zhangtao on 2020/9/19.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSMatterGridCollectionCell.h"

@implementation SSMatterGridCollectionCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _imgV = [[UIImageView alloc]init];
        [self addSubview:_imgV];
        _nameLab = [[UILabel alloc]init];
        _nameLab.textColor = HEX(@"666666");
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        _nameLab.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_nameLab];
        
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(S_FIX(10.5));
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(S_FIX(44));
            make.height.mas_equalTo(S_FIX(44));
            
        }];
        
        [_nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.width.mas_equalTo(S_FIX(65));
            make.height.mas_equalTo(S_FIX(13));
        }];
    }
    return self;
}

-(void)configModel{
//    _imgV.image = [UIImage imageNamed:@"placeholdimg1"];
}

@end
