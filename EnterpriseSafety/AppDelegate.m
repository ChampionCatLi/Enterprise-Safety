//
//  AppDelegate.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/11/28.
//  Copyright © 2019 chao. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabBar.h"
#import "NetWorkManager.h"
#import "LoginController.h"
#import "SplashViewController.h"

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    [self initNetWork];
    
    SplashViewController * spVC=[[SplashViewController alloc] init];
    
    _window.rootViewController=spVC;
    
//    objectIsForcedForKey
  
    return YES;
}


-(void) initNetWork{
    [NetWorkManager setup];
}



@end
