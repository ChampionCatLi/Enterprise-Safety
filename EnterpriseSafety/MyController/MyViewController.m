//
//  MyViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/2.
//  Copyright © 2019 chao. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
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
    self.edgesForExtendedLayout = UIRectEdgeNone;//这句话就是从导航栏下面开始计算高度
    [self initView];
}

-(void)initView{
    self.view.backgroundColor=[UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
   [self.view addSubview:self.topBackGroundView];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headerImageView.mas_centerX);
        make.centerY.equalTo(self.headerImageView.mas_centerY).offset(70);
    }];
    
    [self.view addSubview:self.learnHistoryItem];
}



# pragma mark - init view
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
        [_topBackGroundView addSubview:self.nameLabel];
    }
    
    return _nameLabel;
}
/**
 学习历史条目
 */
-(UIView *) learnHistoryItem{
    if (_learnHistoryItem==nil) {
        _learnHistoryItem=[[UIView alloc] initWithFrame:CGRectMake(0, 215, SCREEN_WIDTH, 50)];
        _learnHistoryItem.backgroundColor=[UIColor whiteColor];
        [_learnHistoryItem addSubview:self.learnHistoryIcon];
        [_learnHistoryItem addSubview:self.learnHistoryTitle];
        [_learnHistoryItem addSubview:self.rightIcon];
        }
    return _learnHistoryItem;
    
}
/**
 学习历史图标
 */
-(UIImageView *)learnHistoryIcon{
    
    if (_learnHistoryIcon==nil) {
        
        UIImage * image=[UIImage imageNamed:@"le"];
        _learnHistoryIcon=[[UIImageView alloc] initWithImage:image];
        
        
    }
    return _learnHistoryIcon;
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
