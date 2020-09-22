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
    
    _chartView = [[ORRingChartView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, S_FIX(201))];
    _chartView.style = ORRingChartStyleRing;
    _chartView.config.ringLineWidth = 0;
//    _chartView.config.animateDuration = 15;
//    _chartView.config.neatInfoLine = YES;
    _chartView.config.minInfoInset=-50; //    minInfoInset：infoView的内容偏移，值越大，infoView越宽，默认0
//    infoLineMargin：infoLine 至 周边 的距离，默认10
//    infoLineInMargin：infoLine 至 环形图的距离，默认 10
//    infoLineBreakMargin：infoLine折线距离，默认 15
//    infoViewMargin：infoLine 至 infoView的距离，默认5

    _chartView.dataSource = self;
    [self.view addSubview:_chartView];
    
}

- (NSArray <UIColor *> *)chartView:(ORRingChartView *)chartView graidentColorsAtRingIndex:(NSInteger)index{
    if (index == 0) {
        return @[[UIColor blueColor],[UIColor redColor]];
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

-(UIView *)chartView:(ORRingChartView *)chartView viewForTopInfoAtRingIndex:(NSInteger)index{
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 20, 10)];
    lab.backgroundColor = [UIColor redColor];
    return lab;
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
