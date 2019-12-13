//
//  MainTabBar.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/13.
//  Copyright © 2019 chao. All rights reserved.
//

#import "MainTabBar.h"
#import "CourseViewController.h"
#import "MyCenterViewController.h"
@implementation MainTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype) init {
    self=[super init];
    if (self) {
        
        
           CourseViewController * courseVC= [[CourseViewController alloc] init];
           UINavigationController * courseNav =[[UINavigationController alloc] initWithRootViewController:courseVC];
        courseNav.title=LCMainCourseTitle;
         
           MyCenterViewController * myVC=[[MyCenterViewController alloc] init];
           UINavigationController * myNav=[[UINavigationController alloc] initWithRootViewController:myVC];
           myNav.title=LCMainMyCenterTitle;
        
        
        [self setViewControllers:@[courseNav,myNav]];

//           tabBarController.tabBar.barTintColor=[UIColor whiteColor];
        
        
    }
    
    return self;
    
    
}


@end
