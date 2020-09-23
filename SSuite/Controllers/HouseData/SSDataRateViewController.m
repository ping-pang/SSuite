//
//  SSDataRateViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataRateViewController.h"
#import "SSSingleTitleView.h"
#import "SSDataRingChartCell.h"
#import "SSDataTotalRankCell.h"
@interface SSDataRateViewController ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation SSDataRateViewController
{
    UITableView *mainTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:mainTableView];
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    [mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 1;
    }else{
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) return .1;
    if (section == 1) return S_FIX(76);
    if (section == 2) return S_FIX(76);
    return .1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) return S_FIX(156);
    if (indexPath.section == 1) return S_FIX(310);
    if (indexPath.section == 2) return S_FIX(62);
       return .1;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1 || section == 2) {
        SSSingleTitleView *view = [[SSSingleTitleView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(76))];
        view.titleLab.text = section==1?@"月总出租率":@"出租率排行榜";
        return view;
    }
    return nil;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SSDataRingChartCell *cell = [[SSDataRingChartCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(156))];
        [cell config];
        return cell;
    }else if (indexPath.section == 1){
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        return cell;
    }else if (indexPath.section == 2){
        SSDataTotalRankCell *cell = [[SSDataTotalRankCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(62))];
        [cell config];
        return cell;
    }
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
}

@end
