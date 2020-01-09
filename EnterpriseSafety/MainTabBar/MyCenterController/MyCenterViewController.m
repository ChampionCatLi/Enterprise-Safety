//
//  MyViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/2.
//  Copyright © 2019 chao. All rights reserved.
//

#import "MyCenterViewController.h"
#import "LoginController.h"
#import "LearnHistoryController.h"
@interface MyCenterViewController ()
/**
 上边 背景view
 */
@property(nonatomic,strong) UIView * topBackGroundView;
/**
 头像
 */
@property(nonatomic,strong) UIImageView * headerImageView;
/**
 用户姓名
 */
@property(nonatomic,strong) UILabel * nameLabel;

/**
 学习历史 条目
 */
@property(nonatomic,strong)UIView * learnHistoryItem;
/**
 学习历史 图标
 */
@property(nonatomic,strong)UIImageView * learnHistoryIcon;
/**
 学习历史 标题
 */
@property(nonatomic,strong)UILabel * learnHistoryTitle;
@property(nonatomic,strong)UIImageView * rightIcon;
/**
 退出登录
 */
@property(nonatomic,strong)UIView * loginOutItem;
@property(nonatomic,strong)UIImageView * loginOutIcon;
@property(nonatomic,strong)UILabel * loginOutTitle;




@end

@implementation MyCenterViewController


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
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initView];
}

-(void)initView{
    self.view.backgroundColor=LCBackGroundColor;
    [self.view addSubview:self.topBackGroundView];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerImageView.mas_centerX);
        make.centerY.equalTo(self.headerImageView.mas_centerY).offset(70);
    }];
    [self.view addSubview:self.learnHistoryItem];
    [self.view addSubview:self.loginOutItem];
    [_learnHistoryItem addSubview:self.rightIcon];
    
}



# pragma mark - init topBackGround
-(UIView *) topBackGroundView{
    if (_topBackGroundView==nil) {
        _topBackGroundView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,  200)];
        _topBackGroundView.backgroundColor=[UIColor whiteColor];
        
    }
    return _topBackGroundView;
}
-(UIImageView *)headerImageView{
    if (_headerImageView==nil) {
        UIImage *image = [UIImage imageNamed:@"camera_sample.png"];
        _headerImageView=[[UIImageView alloc] initWithImage:image];
        _headerImageView.frame=CGRectMake(SCREEN_WIDTH*0.5-40,40, 80, 80);
        [_topBackGroundView addSubview:self.headerImageView];
    }
    
    
    return _headerImageView;
    
}

-(UILabel *) nameLabel{
    
    if (_nameLabel==nil) {
        _nameLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 0)];
        [_nameLabel sizeToFit];
        _nameLabel.text=@"过年了";
        _nameLabel.font=[UIFont systemFontOfSize:15];
        [_nameLabel setTextColor:LCRGBColor(33,33,33)];
        [_topBackGroundView addSubview:self.nameLabel];
    }
    
    return _nameLabel;
}

#pragma mark -init learn History  item
/**
 学习历史条目
 */
-(UIView *) learnHistoryItem{
    if (_learnHistoryItem==nil) {
        _learnHistoryItem=[[UIView alloc] initWithFrame:CGRectMake(0, 215, SCREEN_WIDTH, 50)];
        _learnHistoryItem.backgroundColor=[UIColor whiteColor];
        [_learnHistoryItem addSubview:self.learnHistoryIcon];
        [_learnHistoryItem addSubview:self.learnHistoryTitle];
        [_learnHistoryTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.learnHistoryIcon.mas_right).offset(15);
            make.centerY.equalTo(self.learnHistoryIcon.mas_centerY);
        }];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(learnHistoryOnclick)];
        [_learnHistoryItem addGestureRecognizer:tap];
        
    }
    return _learnHistoryItem;
    
}
/**
 学习历史图标
 */
-(UIImageView *)learnHistoryIcon{
    
    if (_learnHistoryIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"learn_history@3x.png"];
        _learnHistoryIcon=[[UIImageView alloc] initWithImage:image];
        _learnHistoryIcon.frame=CGRectMake(15, 10, 30, 30);
        
    }
    return _learnHistoryIcon;
}
/**
 学习历史标题
 */
-(UILabel *)learnHistoryTitle{
    
    if (_learnHistoryTitle==nil) {
        _learnHistoryTitle=[[UILabel alloc]init ];
        _learnHistoryTitle.text=@"学习档案";
        _learnHistoryTitle.font=[UIFont systemFontOfSize:16];
    }
    
    return _learnHistoryTitle;
}

#pragma mark - login out item

-(UIView *)loginOutItem{
    
    if (_loginOutItem==nil) {
        _loginOutItem=[[UIView alloc] initWithFrame:CGRectMake(0, self.learnHistoryItem.frame.origin.y+65, SCREEN_WIDTH, 50)];
        _loginOutItem.backgroundColor=[UIColor whiteColor];
        [_loginOutItem addSubview:self.loginOutIcon];
        [_loginOutItem addSubview:self.loginOutTitle];
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(loginOutOnclick)];
        
        _loginOutItem.userInteractionEnabled=YES;
        [_loginOutItem addGestureRecognizer:tap];
        
        
    }
    return _loginOutItem;
}

-(UIImageView *)loginOutIcon{
    if (_loginOutIcon==nil) {
        UIImage * image=[UIImage imageNamed:@"exit.png"];
        _loginOutIcon=[[UIImageView alloc] initWithImage:image];
        _loginOutIcon.frame=CGRectMake(15, 10, 30, 30);
    }
    
    return _loginOutIcon;
}
-(UILabel *)loginOutTitle{
    
    if (_loginOutTitle==nil) {
        _loginOutTitle=[[UILabel alloc] initWithFrame:CGRectMake(60, 10, 100 , 30)];
        _loginOutTitle.text=@"退出登录";
        _loginOutTitle.font=[UIFont systemFontOfSize:16];
    }
    
    return _loginOutTitle;
}


#pragma mark -onclick

-(void) loginOutOnclick{
    
        LoginController *loginController=[[LoginController alloc] init];
        UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:loginController];
        navigationController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController:navigationController animated:NO completion:NULL];
    
}

-(void) learnHistoryOnclick{
    
    LearnHistoryController * learnHistoryController =[[LearnHistoryController alloc] init];
       learnHistoryController.hidesBottomBarWhenPushed=YES;
       [self.navigationController pushViewController:learnHistoryController animated:YES];
}



@end
