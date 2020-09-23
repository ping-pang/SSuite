//
//  AppDelegate.m
//  SSuite
//
//  Created by zhangtao on 2020/9/17.
//  Copyright © 2020 ssuite. All rights reserved.
//

#import "AppDelegate.h"
#import "SSDataRateViewController.h"
#import "SSTabBarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.rootViewController = [[SSTabBarController alloc]init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}




@end
