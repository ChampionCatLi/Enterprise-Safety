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
@property(nonatomic,copy)NSString * jseid;
@property(nonatomic,strong) UIImageView * iconImageView;
@property(nonatomic,weak)   NSTimer *timer;
@end

@implementation SplashViewController

- (void)viewDidLoad {
     [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.iconImageView];
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@170);
        make.height.equalTo(@120);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];
   _timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(initData) userInfo:nil repeats:NO];


    
}

-(void)initData{
    
    NSUserDefaults * userData=[NSUserDefaults standardUserDefaults];
    _token=[userData stringForKey:data_key_user_token];
    _jseid=[userData stringForKey:data_key_user_jse_id];
    if (_token!=nil) {
        [self jundgeGo];
    }else{
        [self go2LoginVC];
    }
    
}
-(void) jundgeGo{
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url_do_login_by_token;
        request.headers=@{@"Cookie":self.jseid};
        request.parameters=@{@"token":self.token,@"_t":@"1"};
        request.httpMethod=kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        [self go2MainTabBar];
        [self saveUserData:responseObject];
    }onFailure:^(NSError * _Nullable error) {
        [self go2LoginVC];
        NSLog(@"error::::%@",error);
    }];
}



-(UIImageView *)iconImageView{
    
    if (_iconImageView==nil) {
        UIImage * image=[UIImage imageNamed:@"launch_img.png"];
        _iconImageView=[[UIImageView alloc] initWithImage:image];
    }
    
    
    
    return _iconImageView;
}


#pragma mark -数据保存
-(void) saveUserData:(id )responseObject{
    NSUserDefaults * defaults =[NSUserDefaults standardUserDefaults];
    
    NSDictionary * messageDic =responseObject[@"message"];
    [defaults setObject:responseObject[data_key_user_jse_id] forKey:data_key_user_jse_id];
    [defaults setObject:messageDic[data_key_user_id] forKey:data_key_user_id];
    [defaults setObject:messageDic[data_key_user_name] forKey:data_key_user_name];
    [defaults setObject:messageDic[data_key_user_token] forKey:data_key_user_token];
    [defaults setObject:messageDic[data_key_user_fee_modle] forKey:data_key_user_fee_modle];
    
    [defaults synchronize];
}



#pragma mark -跳转方法
-(void) go2LoginVC{
    LoginController * loginVC=[[LoginController alloc] init];
    UINavigationController * nav =[[UINavigationController alloc] initWithRootViewController:loginVC];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:nav animated:NO completion:NULL];
}
-(void)go2MainTabBar{
    MainTabBar * mainTabBar=[[MainTabBar alloc] init];
    mainTabBar.modalPresentationStyle=UIModalPresentationFullScreen;
    [self presentViewController:mainTabBar animated:NO completion:nil];
}

-(void)viewDidDisappear:(BOOL)animated{
    [_timer invalidate];
    _timer=nil;
}


@end
