//
//  SSStatusViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSStatusViewController.h"
#import "SSHouseStatusCell.h"
#import "SSBaseCollectionView.h"
#import "SSCollectionViewFlowLayout.h"
@interface SSStatusViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)SSBaseCollectionView *collection;

@end

@implementation SSStatusViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:242/255.0f green:243/255.0f blue:244/255.0f alpha:1];
    
  
   
    SSCollectionViewFlowLayout *layout = [[SSCollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = S_FIX(12);
    layout.minimumInteritemSpacing = S_FIX(12);
    self.collection = [[SSBaseCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    self.collection.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.collection];
    self.collection.showsVerticalScrollIndicator = NO;
    self.collection.bounces = NO;
    self.collection.delegate = self;
    self.collection.dataSource = self;
   [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.bottom.left.right.equalTo(self.view);
   }];
    
    [self.collection registerClass:[SSHouseStatusCell class] forCellWithReuseIdentifier:NSStringFromClass([SSHouseStatusCell class])];
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
        SSHouseStatusCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSHouseStatusCell" forIndexPath:indexPath];
        [cell config];
        return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  
    return 30;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
        return CGSizeMake(S_FIX(109), S_FIX(130));
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
 return UIEdgeInsetsMake(S_FIX(12), S_FIX(12), S_FIX(30), S_FIX(12));
}



@end
