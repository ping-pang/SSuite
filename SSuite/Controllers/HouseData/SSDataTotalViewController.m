//
//  SSDataTotalViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataTotalViewController.h"
#import "SSDataTotalBtnsView.h"
#import "SSDataTotalBreakCell.h"
#import "SSDataTotalRankCell.h"
@interface SSDataTotalViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SSDataTotalViewController
{
    UITableView *mainTableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    SSDataTotalBtnsView *btns = [[SSDataTotalBtnsView alloc]initWithFrame:CGRectMake(S_FIX(67.5), S_FIX(21.2), S_FIX(240), S_FIX(26.8))];
    [self.view addSubview:btns];
    
    mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:mainTableView];
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    [mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btns.mas_bottom);//.mas_offset(S_FIX(32));
        make.left.bottom.right.equalTo(self.view);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0) return 1;
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0) return .1;
    
    return S_FIX(76);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return .1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0) return S_FIX(285);//253
    if(indexPath.section == 1)  return S_FIX(62);
    return 0;
   
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0) return [UIView new];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(76))];
    view.backgroundColor = [UIColor whiteColor];
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(S_FIX(30), S_FIX(36), 150, S_FIX(22))];
    lab.font = [UIFont boldSystemFontOfSize:16];//[UIFont fontWithName:@"PingFangSC-Semibold" size:16];
    lab.textColor = HEX(@"333333");
    lab.text = @"收入排行榜";
    [view addSubview:lab];
    return view;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SSDataTotalBreakCell *cell = [[SSDataTotalBreakCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(285))];
        [cell config];
        return cell;
    }else{
        SSDataTotalRankCell *cell = [[SSDataTotalRankCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(62))];
        [cell config];
        return cell;
    }
}

@end
