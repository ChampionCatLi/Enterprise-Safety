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

@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window =[[UIWindow alloc]initWithFrame: [UIScreen mainScreen].bounds];
    [self.window setBackgroundColor:[UIColor whiteColor]];
    [self.window makeKeyAndVisible];
    [self initNetWork];
    
    MainTabBar * mainTab =[[MainTabBar alloc] init];
    mainTab.selectedIndex=1;
    _window.rootViewController=mainTab;
    

    return YES;
}


-(void) initNetWork{
    [NetWorkManager setup];
}

#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
