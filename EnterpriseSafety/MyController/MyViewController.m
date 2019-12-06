//
//  MyViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/2.
//  Copyright © 2019 chao. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController


-(instancetype)init{
    if (self= [super init]) {
        self.tabBarItem.title=@"个人中心";
        self.tabBarItem.image=[UIImage imageNamed:@"movie"];
        [self setTitle:@"个人中心"];

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

-(void)initView{
    self.view.backgroundColor=[UIColor whiteColor];
    
    
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
