//
//  SSDataTotalBtnsView.m
//  SSuite
//
//  Created by zhangtao on 2020/9/22.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataTotalBtnsView.h"

@interface SSDataTotalBtnsView()
{
    UIButton *middleBtn;
}

@end

@implementation SSDataTotalBtnsView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEX(@"#F5F7FA");
        self.layer.cornerRadius = 13.4;
     
        NSArray *btnTitles = @[@"年收入",@"月收入",@"周收入",@"日收入"];
        for (int i = 0; i<btnTitles.count; i++) {
            UIButton *btn = [UIButton new];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:btnTitles[i] forState:UIControlStateNormal];
            [btn setTitleColor:HEX(@"999999") forState:UIControlStateNormal];
            [btn setTitleColor:HEX(@"#3771FF") forState:UIControlStateSelected];
            btn.layer.cornerRadius = 13.4;
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.backgroundColor = [UIColor clearColor];
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.bottom.equalTo(self);
                make.width.mas_equalTo(frame.size.width/4);//.multipliedBy(1/4);
                make.left.mas_equalTo(i*(frame.size.width/4));
            }];
            if (i == 0) {
                [self click:btn];
            }
        }
    }
    return self;
}

-(void)click:(UIButton *)btn{
    if (!middleBtn) {
        middleBtn = btn;
        middleBtn.selected = YES;
    }else{
        middleBtn.backgroundColor = [UIColor clearColor];
        middleBtn.selected = NO;
        middleBtn = nil;
        middleBtn = btn;
        middleBtn.selected = YES;
    }
    middleBtn.backgroundColor = [UIColor colorWithRed:222/255.0f green:230/255.0f blue:249/255.0f alpha:1];
}

@end
