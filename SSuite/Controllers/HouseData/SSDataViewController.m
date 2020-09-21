//
//  SSDataViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataViewController.h"
#import "SSScrollView.h"
#import "SSDataTopTypeItem.h"

#import "SSDataTotalViewController.h"
#import "SSDataRateViewController.h"
#import "SSDataCountViewController.h"
@interface SSDataViewController ()<UIScrollViewDelegate>


@end

@implementation SSDataViewController
{
    SSScrollView *scroll;
    SSDataTotalViewController *totalCtr;
    SSDataRateViewController *rateCtr;
    SSDataCountViewController *countCtr;
    
    UIScrollView *pageScroll;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, S_FIX(312))];
    bgview.backgroundColor = HEX(@"#3873FC");
    [self.view addSubview:bgview];
    
    
    scroll = [[SSScrollView alloc]initWithFrame:CGRectMake(0, S_FIX(120), self.view.frame.size.width, S_FIX(148))];
    [self.view  addSubview:scroll];

    UIButton *nameBtn = [[UIButton alloc]init];
    [self.view addSubview:nameBtn];
    [nameBtn setImage:[UIImage imageNamed:@"sc_down_arrow"] forState:UIControlStateNormal];
    [nameBtn setTitle:@"雨花台区青年公寓" forState:UIControlStateNormal];
    [nameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nameBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:18];
    [nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(49));
        make.left.mas_equalTo(S_FIX(12));
        make.height.mas_equalTo(S_FIX(25));
    }];
    [nameBtn layoutButtonWithEdgeInsetsStyle:XGButtonEdgeInsetsStyleRight imageTitleSpace:S_FIX(5)];

    scroll.clipsToBounds = NO;
    scroll.contentInset = UIEdgeInsetsMake(0, S_FIX(38), 0, 0);
    scroll.contentSize = CGSizeMake((S_FIX(132)+S_FIX(16))*3,0);
    typeof(self)wkSelf = self;
    NSMutableArray<SSDataTopTypeItem *> *views = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i<3; i++) {
        SSDataTopTypeItem *item = [[SSDataTopTypeItem alloc]initWithFrame:CGRectMake(i*(S_FIX(132)+S_FIX(16)), 0, S_FIX(132), S_FIX(148))];
        item.type = i;
        [item config];
        [scroll addSubview:item];
        if (i == 0) {
            item.backgroundColor = [UIColor whiteColor];
        }
        item.clickBack = ^(NSNumber * _Nonnull typ) {
            [wkSelf changePage:typ];
            for (SSDataTopTypeItem *view in views) {
                if ([NSNumber numberWithInteger:view.type] == typ) {
                    view.backgroundColor = [UIColor whiteColor];
                }else{
                    view.backgroundColor = HEX(@"#BDD5FF");
                }
            }
        };
        [views addObject:item];
    }
    
    
    pageScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bgview.frame), SCREEN_WIDTH, self.view.frame.size.height-CGRectGetMaxY(bgview.frame)-TAB_BAR_HEIGHT)];
    [self.view addSubview:pageScroll];
//    [pageScroll mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.right.equalTo(self.view);
//        make.top.mas_equalTo(bgview.mas_bottom);
//    }];
    pageScroll.scrollEnabled = NO;
    pageScroll.contentSize = CGSizeMake(SCREEN_WIDTH*3, 0);
    
    totalCtr = [[SSDataTotalViewController alloc]init];
    rateCtr = [[SSDataRateViewController alloc]init];
    countCtr = [[SSDataCountViewController alloc]init];
    [pageScroll addSubview:totalCtr.view];
    [pageScroll addSubview:rateCtr.view];
    [pageScroll addSubview:countCtr.view];
    totalCtr.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, pageScroll.frame.size.height);
    rateCtr.view.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, pageScroll.frame.size.height);
    countCtr.view.frame = CGRectMake(SCREEN_WIDTH*2, 0, SCREEN_WIDTH, pageScroll.frame.size.height);
//    [totalCtr.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.bottom.equalTo(pageScroll);
//        make.width.mas_equalTo(SCREEN_WIDTH);
//    }];
//    [rateCtr.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(SCREEN_WIDTH);
//        make.top.bottom.equalTo(pageScroll);
//        make.width.mas_equalTo(SCREEN_WIDTH);
//    }];
//    [countCtr.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(SCREEN_WIDTH*2);
//        make.top.bottom.equalTo(pageScroll);
//        make.width.mas_equalTo(SCREEN_WIDTH);
//    }];
}

-(void)changePage:(NSNumber *)type{
    NSInteger index = [type integerValue];
    pageScroll.contentOffset = CGPointMake(index*SCREEN_WIDTH, 0);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
