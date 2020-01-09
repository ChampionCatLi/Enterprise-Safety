//
//  LearnPlanDetailViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/13.
//  Copyright © 2019 chao. All rights reserved.
//
#import "LearnHeaderView.h"
#import "LearnPlanDetailViewController.h"


@interface LearnPlanDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSString * planeName;
@property(nonatomic,strong)NSString * planeID;

@property(nonatomic,strong) UITableView * rootTableview;

@property(nonatomic,strong) LearnHeaderView * headerView;

@end

@implementation LearnPlanDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=_planeName;
    
    [self.view addSubview:self.rootTableview];
    
    [_rootTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self initData];
    
    
}

-(void) initData{
    
    [self getCoursePlaneDetail];
    
}



#pragma mark - net work

-(void)getCoursePlaneDetail{
    
    NSString *url =[NSString stringWithFormat:@"%@/%@",url_get_plane_detail,self.planeID];
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
    
        request.api=url;
        request.httpMethod=kXMHTTPMethodGET;
    
    } onSuccess:^(id  _Nullable responseObject) {
        
        NSLog(@"onSuccess:::::responseObj:::%@",responseObject);
        
    } onFailure:^(NSError * _Nullable error) {
        
    }];
    
}


-(void) setPlaneName:(NSString *)planeName setPlaneID:(NSString * )planeID
{

    self.planeName=planeName;
    self.planeID=planeID;
    
}

#pragma mark -init view
-(UITableView *) rootTableview{
    if (_rootTableview==nil) {
        _rootTableview=[[UITableView alloc] init];
        _rootTableview.delegate=self;
        _rootTableview.dataSource=self;
    }
    
    return _rootTableview;
}

-(LearnHeaderView *) headerView{
    
    
    
    
    return _headerView;
}


#pragma mark -delegate

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{}


@end
