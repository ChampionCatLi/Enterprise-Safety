//
//  LoginController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/13.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()


@property (nonatomic,strong) UIImageView * topIconImageView;
/**
 账号
 */
@property(nonatomic,strong) UIView * accountItem;
@property(nonatomic,strong) UIImageView * accountIcon ;
@property(nonatomic,strong) UITextField * accountField;
/**
 机构
 */
@property(nonatomic,strong) UIView * organItem;
@property(nonatomic,strong) UIImageView * organIcon;
@property(nonatomic,strong) UITextField * organField;

/**
 密码
 */
@property(nonatomic,strong) UIView * passwordItem;
@property(nonatomic,strong) UIImageView * passwordIcon;
@property(nonatomic,strong) UITextField * passwordField;



@end

@implementation LoginController

- (void)viewDidLoad {
[super viewDidLoad];
[self initView];

}

#pragma mark -init view
-(void) initView{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor blueColor];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.view addSubview:self.topIconImageView];
    [self.view addSubview:self.accountItem];
    [self.accountItem addSubview:self.accountIcon];
    [_accountIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.accountItem.mas_centerY);
        make.left.equalTo(@MARGIN_LEFT_15);
         make.size.equalTo(@25);
    }];
    [self.accountItem addSubview:self.accountField];
    [_accountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountIcon.mas_right).offset(15);
        make.right.equalTo(@SCREEN_WIDTH).offset(-15);
        make.centerY.equalTo(self.accountItem.mas_centerY);
    }];
    
    [self.view addSubview:self.organItem];
    [_organItem mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountItem.mas_bottom).offset(15);
        make.width.equalTo(@SCREEN_WIDTH);
        make.height.equalTo(@ITEM_HEIGHT);
    }];
    [self.organItem addSubview:self.organIcon];
    [_organIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.organItem.mas_centerY);
        make.left.equalTo(@15);
        make.size.equalTo(@25);
    }];
    
    [self.organItem addSubview:self.organField];
    [_organField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.organIcon.mas_right).offset(15);
        make.size.equalTo(self.accountField);
        make.centerY.equalTo(self.organItem.mas_centerY);
    }];
    
}


#pragma mark - topIcon
-(UIImageView *) topIconImageView{
    if (_topIconImageView==nil) {
        UIImage * image=[UIImage imageNamed:@"logo.png"];
        _topIconImageView=[[UIImageView alloc] initWithImage:image];
        _topIconImageView.frame=CGRectMake(0, 0, 60, 60);
        _topIconImageView.center=CGPointMake(SCREEN_WIDTH*0.5, 70);
    }
    
    return _topIconImageView;
    
    
}


#pragma mark - account

-(UIView *) accountItem {
    if (_accountItem==nil) {
        _accountItem =[[UIView alloc] initWithFrame:CGRectMake(0, self.topIconImageView.frame.origin.y+100, SCREEN_WIDTH, ITEM_HEIGHT)];
        _accountItem.backgroundColor=[UIColor whiteColor];
    }
    return _accountItem;
}

-(UIImageView *) accountIcon {
    
    
    if (_accountIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"user.png"];
        _accountIcon=[[UIImageView alloc]initWithImage:image];
    }
    
    return _accountIcon;
}

-(UITextField *) accountField{
    
    if (_accountField==nil) {
        _accountField=[[UITextField alloc]init];
        _accountField.textAlignment=NSTextAlignmentLeft;
        _accountField.clearButtonMode =UITextFieldViewModeAlways;
        _accountField.keyboardType=UIKeyboardTypeNumberPad;
        _accountField.placeholder=@"请输入账号";
        _accountField.borderStyle=UITextBorderStyleNone;
    }
    
    return _accountField;
}

#pragma mark - organ

-(UIView  *)organItem{
    if (_organItem == nil) {
        _organItem = [[UIView alloc]init];
        _organItem.backgroundColor=[UIColor whiteColor];
    }
    return _organItem;
    
}
-(UIImageView *)organIcon{
    if (_organIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"work.png"];
        _organIcon=[[UIImageView alloc] initWithImage:image];
    }
    
    return _organIcon;
}

-(UITextField *) organField{
    
    
    if (_organField==nil) {
        _organField=[[UITextField alloc] init];
        _organField.placeholder=@"请选择机构";
        _organField.textAlignment=NSTextAlignmentLeft;
        _organField.enabled=false;
        _organField.borderStyle=UITextBorderStyleNone;
    }
    return _organField;
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
