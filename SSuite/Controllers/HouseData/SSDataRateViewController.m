//
//  SSDataRateViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataRateViewController.h"
#import "ORRingChartView.h"
@interface SSDataRateViewController ()<ORRingChartViewDatasource>
@property(nonatomic,strong)ORRingChartView *chartView;
@end

@implementation SSDataRateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _chartView = [[ORRingChartView alloc]initWithFrame:CGRectMake(50, 100, 150, 150)];
    _chartView.style = ORRingChartStyleRing;
    _chartView.config.ringWidth = 0;
    _chartView.dataSource = self;
    [self.view addSubview:_chartView];
    
}

- (NSArray <UIColor *> *)chartView:(ORRingChartView *)chartView graidentColorsAtRingIndex:(NSInteger)index{
    if (index == 0) {
        return @[[UIColor blueColor]];
    }
    return @[[UIColor lightGrayColor]];
}

- (UIView *)viewForRingCenterOfChartView:(ORRingChartView *)chartView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    return view;
}

-(NSInteger)numberOfRingsOfChartView:(ORRingChartView *)chartView{
    return 2;
}

-(CGFloat)chartView:(ORRingChartView *)chartView valueAtRingIndex:(NSInteger)index{
    if (index == 0) {
        return 60;
    }else{
        return 40;
    }
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
