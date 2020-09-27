//
//  SSDataCountViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSDataCountViewController.h"
#import "SSDataCountMainCell.h"
@interface SSDataCountViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SSDataCountViewController
{
    UITableView *mainTable;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    mainTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    mainTable.delegate = self;
    mainTable.dataSource = self;
    [self.view addSubview:mainTable];
    [mainTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row == 0) return S_FIX(400);
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        SSDataCountMainCell *cell = [[SSDataCountMainCell alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(400))];
        [cell config];
        return cell;
    }
    
    UITableViewCell *cell = [UITableViewCell new];
    return cell;
}


@end
