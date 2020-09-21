//
//  SSTabBarController.m
//  SSuite
//
//  Created by zhangtao on 2020/9/21.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "SSTabBarController.h"
#import "SSMatterViewController.h"
#import "SSStatusViewController.h"
#import "SSDataViewController.h"
#import "SSPersonalViewController.h"
@interface SSTabBarController ()


@end

@implementation SSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [super viewDidLoad];
    
    [self createTabs];
    
    [self setupTabBar];
    
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//    self.delegate = self;
    
}

- (void)createTabs
{//imageWithRenderingMode
    SSMatterViewController *homeVc = [SSMatterViewController new];
    homeVc.title = @"服务";
    homeVc.tabBarItem.image = [[UIImage imageNamed:@"Tab_Home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_Home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVc];
    
    SSStatusViewController *categoryVc = [SSStatusViewController new];
    categoryVc.title = @"房态";
    categoryVc.tabBarItem.image = [[UIImage imageNamed:@"Tab_Home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    categoryVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_Home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *categoryNav = [[UINavigationController alloc] initWithRootViewController:categoryVc];
    
    SSDataViewController *cartVc = [SSDataViewController new];
    cartVc.title = @"数据";
    cartVc.tabBarItem.image = [[UIImage imageNamed:@"Tab_Home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cartVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_Home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *cartNav = [[UINavigationController alloc] initWithRootViewController:cartVc];
    
    SSPersonalViewController *orderVc = [SSPersonalViewController new];
    orderVc.title = @"我的";
    orderVc.tabBarItem.image = [[UIImage imageNamed:@"Tab_Home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    orderVc.tabBarItem.selectedImage = [[UIImage imageNamed:@"Tab_Home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UINavigationController *orderNav = [[UINavigationController alloc] initWithRootViewController:orderVc];
    
    self.viewControllers = @[homeNav, categoryNav, cartNav, orderNav];
    
}

- (void)setupTabBar
{
    //    self.tabBar.backgroundImage = [UIImage new];
    //    self.tabBar.shadowImage     = [UIImage new];
    self.tabBar.barStyle     = UIBarStyleBlack;
    self.tabBar.translucent  = NO;
    self.tabBar.barTintColor = [UIColor whiteColor];
    //阴影
    self.tabBar.layer.shadowColor   = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOffset  = CGSizeMake(0, -1);
    self.tabBar.layer.shadowOpacity = 0.3;
    
    //字体颜色
    NSDictionary *normalTextAttributes   = @{NSForegroundColorAttributeName: HEX(@"#C1C5CC"), NSFontAttributeName:[UIFont systemFontOfSize:11]};
    NSDictionary *selectedTextAttributes = @{NSForegroundColorAttributeName: HEX(@"#5B84FF"), NSFontAttributeName:[UIFont systemFontOfSize:11]};
    
    for (UITabBarItem *item in self.tabBar.items) {
        [item setTitleTextAttributes:normalTextAttributes forState:UIControlStateNormal];
        [item setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];
    }
    
    
}

@end
