//
//  BaseViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/18.
//  Copyright © 2019 chao. All rights reserved.
//

#import "BaseViewController.h"
#import "IQKeyboardManager.h"
#import "IQKeyboardReturnKeyHandler.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //这句话就是从导航栏下面开始计算高度
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=LCBackGroundColor;
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [self initKeyboardListener];
}



-(void) initKeyboardListener{
    IQKeyboardManager * manager =[IQKeyboardManager sharedManager];
    manager.enable=YES;
    manager.shouldResignOnTouchOutside=YES;
    manager.enableAutoToolbar=NO;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
