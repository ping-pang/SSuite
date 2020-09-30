//
//  SSMatterViewController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/19.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSMatterViewController.h"
#import "SSCollectionViewFlowLayout.h"
#import "SSBaseCollectionView.h"
#import "SSMatterGridCollectionCell.h"
#import "SSMatterTitleView.h"
#import "SSRadiuTopCollectionView.h"
#import "SSRadiuBottomCollectionView.h"
#import "SSLeftRightCollectionView.h"
#import "SSMatterItemCell.h"
#import "SSMatterActionDoCell.h"
#import "SSMatterDeviceCell.h"
@interface SSMatterViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)SSBaseCollectionView *collection;
@property(nonatomic,strong)UIView *firstBgView;
@end

@implementation SSMatterViewController
{
    NSArray *gridImgs;
    NSArray *gridTitles;
}
-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ////遍历已安装字体
    for(NSString *fontfamilyname in [UIFont familyNames])
    {
        NSLog(@"family:'%@'",fontfamilyname);
        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
        {
            NSLog(@"\tfont:'%@'",fontName);
        }
        NSLog(@"-------------");
    }
    
    
    
    [self createLocalSource];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIImageView *bgImgV = [[UIImageView alloc]init];
    [self.view addSubview:bgImgV];
    bgImgV.image = [UIImage imageNamed:@"bg"];
    [bgImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(S_FIX(115));
    }];
    
    UIButton *nameBtn = [[UIButton alloc]init];
    [self.view addSubview:nameBtn];
    [nameBtn setImage:[UIImage imageNamed:@"sc_down_arrow"] forState:UIControlStateNormal];
    [nameBtn setTitle:@"雨花台区青年公寓" forState:UIControlStateNormal];
    [nameBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nameBtn.titleLabel.font =  [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
    [nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(48.5));
        make.left.mas_equalTo(S_FIX(13));
        make.height.mas_equalTo(S_FIX(25));
    }];
    [nameBtn layoutButtonWithEdgeInsetsStyle:XGButtonEdgeInsetsStyleRight imageTitleSpace:S_FIX(5)];
    
    UIView *collectionBGView = [UIView new];
    [self.view addSubview:collectionBGView];
    collectionBGView.layer.cornerRadius = 12;
    collectionBGView.layer.masksToBounds = YES;
    collectionBGView.backgroundColor = [UIColor colorWithRed:242/255.0f green:243/255.0f blue:244/255.0f alpha:1];
    [collectionBGView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(S_FIX(108));
        make.left.mas_equalTo(S_FIX(0));
        make.right.mas_equalTo(-S_FIX(0));
        make.bottom.equalTo(self.view);
    }];
    
//    UIColor *color = [UIColor colorWithRed:242/255.0f green:243/255.0f blue:244/255.0f alpha:1];
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = collectionBGView.bounds;
//    gradientLayer.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,(id)[UIColor whiteColor].CGColor,(id)color.CGColor,(id)color.CGColor, nil];
//    [collectionBGView.layer addSublayer:gradientLayer];
    
    _firstBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, S_FIX(61)*2+17+S_FIX(59)+S_FIX(14))];
    _firstBgView.backgroundColor = [UIColor whiteColor];
    [collectionBGView addSubview:_firstBgView];
    
    
    SSCollectionViewFlowLayout *layout = [[SSCollectionViewFlowLayout alloc]init];
//    layout.minimumLineSpacing = S_FIX(14);
//    layout.minimumInteritemSpacing = S_FIX(15);
    self.collection = [[SSBaseCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [collectionBGView addSubview:self.collection];
    self.collection.showsVerticalScrollIndicator = NO;
    self.collection.bounces = NO;
    self.collection.delegate = self;
    self.collection.dataSource = self;
   [self.collection mas_makeConstraints:^(MASConstraintMaker *make) {
       make.top.bottom.equalTo(collectionBGView);
       make.left.mas_equalTo(S_FIX(12));
       make.right.mas_equalTo(-S_FIX(12));
   }];
    
    [self.collection registerClass:[SSMatterGridCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([SSMatterGridCollectionCell class])];
      [self.collection registerClass:[SSMatterActionDoCell class] forCellWithReuseIdentifier:NSStringFromClass([SSMatterActionDoCell class])];
    [self.collection registerClass:[SSMatterItemCell class] forCellWithReuseIdentifier:NSStringFromClass([SSMatterItemCell class])];
    [self.collection registerClass:[SSMatterDeviceCell class] forCellWithReuseIdentifier:NSStringFromClass([SSMatterDeviceCell class])];
    [self.collection registerClass:[SSMatterTitleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([SSMatterTitleView class])];
      [self.collection registerClass:[SSRadiuTopCollectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([SSRadiuTopCollectionView class])];
      [self.collection registerClass:[SSRadiuBottomCollectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([SSRadiuBottomCollectionView class])];
     [self.collection registerClass:[SSLeftRightCollectionView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([SSLeftRightCollectionView class])];

}

//竖
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) return  S_FIX(14);
    if (section == 4) return  S_FIX(8);
    return 0;
}
//
////横
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    if (section == 0) S_FIX(30);
//    if (section == 0) return 0;
//     if (section == 2) return S_FIX(23.7);
//       return 0;
//}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeZero;// CGSizeMake(self.view.frame.size.width, S_FIX(17));
    }else if (section == 1){
        return CGSizeMake(collectionView.frame.size.width, S_FIX(59));
    }else if (section == 2 || section == 3 || section == 4){
        return CGSizeMake(collectionView.frame.size.width, S_FIX(52));
    }
    return CGSizeZero;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if(section == 0) return CGSizeZero;
    if(section == 1 ||
       section == 2 ||
       section == 3 ||
       section == 4)
        return CGSizeMake(self.view.frame.size.width-S_FIX(24), S_FIX(24));
    
    return CGSizeZero;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        if (indexPath.section == 0) {
            return nil;
         }
         if (indexPath.section == 1) {
             SSMatterTitleView *titleView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([SSMatterTitleView class]) forIndexPath:indexPath];
             return titleView;
         }
         
         if (indexPath.section == 2 ||
             indexPath.section == 3 ||
             indexPath.section == 4) {
             SSLeftRightCollectionView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"SSLeftRightCollectionView" forIndexPath:indexPath];
             if (indexPath.section == 3) {
                  [headerV configleftImg:@"placeholdimg2" lefName:@"日常事务" moreName:@""];
             }else if(indexPath.section == 2){
                  [headerV configleftImg:@"placeholdimg2" lefName:@"合同" moreName:@"合同管理"];
             }else if(indexPath.section == 4){
                  [headerV configleftImg:@"placeholdimg2" lefName:@"设备" moreName:@"查看详情"];
             }
            
             return headerV;
         }
    }else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
        if (indexPath.section == 0){
             return nil;
         }
         if (indexPath.section == 1 ||
             indexPath.section == 2 ||
             indexPath.section == 3 ||
             indexPath.section == 4) {
             
             SSRadiuBottomCollectionView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"SSRadiuBottomCollectionView" forIndexPath:indexPath];
             return footerView;
         }
    }
    
 
    
    
    return nil;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SSMatterGridCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSMatterGridCollectionCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
            cell.imgV.image = [UIImage imageNamed:@"home_icon_reserve"];
        }else{
            cell.imgV.image = [UIImage imageNamed:@"placeholdimg1"];
        }
        cell.nameLab.text = gridTitles[indexPath.item];
        [cell configModel];
        return cell;
    }else if (indexPath.section == 1){
        SSMatterActionDoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSMatterActionDoCell" forIndexPath:indexPath];
        [cell config];
        return cell;
        return nil;
    }else if (indexPath.section == 2 || indexPath.section == 3){
        SSMatterItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSMatterItemCell" forIndexPath:indexPath];
        NSArray *nums = @[@"0",@"98",@"1",@"5"];
        NSArray *titles = @[@"预定",@"入住",@"退房",@"续租申请"];
        NSArray *colors = @[@"",@"FF8F1F",@"FF6565",@"#5B84FF"];
        [cell configNum:nums[indexPath.item] color:colors[indexPath.item] title:titles[indexPath.item]];
        return cell;
        
    }else if (indexPath.section == 4){
        SSMatterDeviceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SSMatterDeviceCell" forIndexPath:indexPath];
        [cell config];
        return cell;
    }

    return nil;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(section == 0) return 8;
    if(section == 1) return 1;
    if(section == 2 || section == 3) return 4;
    if(section == 4) return 3;
    return 0;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return CGSizeMake(S_FIX(65), S_FIX(61));
    }else if (indexPath.section == 1){
        return CGSizeMake(collectionView.frame.size.width, S_FIX(138));
    }else if (indexPath.section == 2 || indexPath.section == 3){
        return CGSizeMake(S_FIX(64), S_FIX(60));
    }else if (indexPath.section == 4)
        return CGSizeMake(S_FIX(327), S_FIX(62));
    
    return CGSizeZero;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if(section == 0) return UIEdgeInsetsMake(17, 0, 0,0);
    if(section == 1) return UIEdgeInsetsZero;
    if(section == 2 || section == 3) return UIEdgeInsetsMake(0, S_FIX(12), 0, S_FIX(12));
    if(section == 4) return UIEdgeInsetsMake(0, S_FIX(12), 0, S_FIX(12));
    return UIEdgeInsetsZero;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _collection) {
        CGFloat offset = scrollView.contentOffset.y;
        _firstBgView.frame = CGRectMake(0, -offset, SCREEN_WIDTH, _firstBgView.frame.size.height);
    }
}

-(void)createLocalSource{
    gridImgs = @[@"home_icon_reserve",@"hone_icon_bill",@"home_icon_CheckOut",@"hone_icon_contract",@"hone_icon_service",@"hone_icon_DeviceManage",@"hone_icon_check",@"hone_icon_contractCompany"];
    gridTitles = @[@"预约管理",@"账单管理",@"户型管理",@"合同管理",@"维修管理",@"设备管理",@"审核管理",@"企业合同",];
}

@end
