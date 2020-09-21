//
//  SSDataTotalViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataTotalViewController.h"
#import "SSDataTotalGainBreakLineView.h"
#import "SSDataTotalBtnsView.h"
@interface SSDataTotalViewController ()
@property(nonatomic,strong)SSDataTotalGainBreakLineView *totalLineView;

@end

@implementation SSDataTotalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    SSDataTotalBtnsView *btns = [[SSDataTotalBtnsView alloc]initWithFrame:CGRectMake(S_FIX(67.5), S_FIX(21.2), S_FIX(240), S_FIX(26.8))];
    [self.view addSubview:btns];
    
    _totalLineView = [[SSDataTotalGainBreakLineView alloc]init];
    _totalLineView.dataSource = _totalLineView;
    _totalLineView.config.style = ORLineChartStyleControl;
    _totalLineView.config.dottedBGLine = NO;
    _totalLineView.config.showHorizontalBgline = NO;
    _totalLineView.config.showVerticalBgline = NO;
    
    _totalLineView.config.leftWidth = 00;
    _totalLineView.config.chartLineColor = HEX(@"#0673FF");
    _totalLineView.config.shadowLineColor = HEX(@"#00D2FF");
    _totalLineView.config.gradientColors = @[HEX(@"FFFFFF")];
    [self.view addSubview:_totalLineView];
    [_totalLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btns.mas_bottom).mas_offset(S_FIX(32));
        make.left.mas_equalTo(50);
        make.right.mas_equalTo(-50);
        make.height.mas_equalTo(144);
    }];
    
    _totalLineView.horizontails = @[@"20",@"30.5",@"40",@"35",@"60",@"10",@"0",@"60"];
    [_totalLineView reloadData];
    
}



@end
