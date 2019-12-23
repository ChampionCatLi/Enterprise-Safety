//
//  SplashViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/23.
//  Copyright © 2019 chao. All rights reserved.
//

#import "SplashViewController.h"
#import <XMRequest.h>
#import "LoginController.h"
#import "MainTabBar.h"

@interface SplashViewController ()
@property(nonatomic,copy) NSString * token;
@end

@implementation SplashViewController

- (void)viewDidLoad {
    self.title=@"闪屏页面";
    [super viewDidLoad];
    [self initData];
    
}

-(void)initData{
    
    NSUserDefaults * userData=[NSUserDefaults standardUserDefaults];
    _token=[userData stringForKey:data_key_user_token];
    NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];
    NSLog(@"initdata =======");
    NSLog(@"%@",[defaults stringForKey:data_key_user_token]);
    if (_token!=nil) {
        [self jundgeGo];
    }else{
        [self go2LoginVC];
    }
    
}
-(void) jundgeGo{
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url_do_login_by_token;
        request.parameters=@{@"token":self.token,@"_t":@"1"};
        request.httpMethod=kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        NSLog(@"success::::%@",responseObject);
    }onFailure:^(NSError * _Nullable error) {
        [self go2LoginVC];
        
    }];
    
    
    
}


-(void) go2LoginVC{
    LoginController * loginVC=[[LoginController alloc] init];
    UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:loginVC];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:NO completion:NULL];
}

@end
