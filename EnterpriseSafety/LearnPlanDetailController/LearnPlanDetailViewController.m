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
        NSArray * keys=[responseObject allKeys];
        if ([keys containsObject:@"message"]) {
            
            NSDictionary * messageNic=responseObject[@"message"];
            [self parsePlaneDetail:messageNic];
        }
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
        _rootTableview.backgroundColor=LCBackGroundColor;
        //        _rootTableview.delegate=self;
        //        _rootTableview.dataSource=self;
    }
    
    return _rootTableview;
}

-(LearnHeaderView *) headerView{
    if(_headerView==nil){
        _headerView=[[LearnHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,0)];
        _headerView.backgroundColor=[UIColor whiteColor];
    }
    
    
    
    return _headerView;
}


#pragma mark -delegate

//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{}

#pragma mark -parseData
-(void)parsePlaneDetail:(NSDictionary *) messageNic{
    NSDictionary * classNic =messageNic[@"clazz"];
    NSDictionary * ruleNic =messageNic[@"rule"];
    NSDictionary * scNic =messageNic[@"sc"];
    
    NSString * planeName=classNic[@"name"];
    NSString * planeDesc =ruleNic[@"desc"];
    long startTime = [scNic[@"startTime"] longValue];
    long endTime  =  [scNic[@"endTime"] longValue];
    if (planeName.length==0) {
        planeName=ruleNic[@"name"];
    }
    NSString * showTime=[LCUtils planeLong2str:startTime endTime:endTime];
    [self.rootTableview setTableHeaderView:self.headerView];
    planeDesc=@"jjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnsk";
    [self.headerView setPlaneName:planeName setPlaneDesc:planeDesc setPlaneTime:showTime];
    

    self.headerView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.headerView.headerHeight);
   
}
@end

