//
//  LearnPlanDetailViewController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/13.
//  Copyright © 2019 chao. All rights reserved.
//
#import "LearnHeaderView.h"
#import "LearnPlanDetailViewController.h"
#import "LearnPlaneDetialBean.h"
#import "LearnPlaneTableView.h"
#import "LearnPlaneBeanFrame.h"
#import "LearnVideoViewController.h"


@interface LearnPlanDetailViewController ()<LearnPlaneTableViewDelegate>

@property(nonatomic,strong) NSString * planeName;
@property(nonatomic,strong) NSString * planeID;
@property(nonatomic,strong) LearnHeaderView * headerView;
@property(nonatomic,strong) LearnPlaneDetialBean * learnPlaneDetailBean;

@property(nonatomic,strong) LearnPlaneTableView * learnPlaneTableView;

@end

@implementation LearnPlanDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=_planeName;
    [self initData];
    
}

-(void) initData{
    
    [self getCoursePlaneDetail];
    self.learnPlaneDetailBean=[[LearnPlaneDetialBean alloc] init];
    
    [self.view addSubview:self.learnPlaneTableView];
    
}
-(void) setPlaneName:(NSString *)planeName setPlaneID:(NSString * )planeID
{
    
    self.planeName=planeName;
    self.planeID=planeID;
    
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
            
            NSDictionary * messageDic=responseObject[@"message"];
            [self parsePlaneDetail:messageDic];
        }
    } onFailure:^(NSError * _Nullable error) {
        
    }];
    
}



-(void)getArticleData:(NSDictionary * )messageDic{
    NSString * url=[NSString stringWithFormat:@"%@/%@/%@/%@",url_get_read_article_data,self.planeID,@"1",@"10"];
    [XMCenter sendRequest:^(XMRequest * _Nonnull request) {
        request.api=url;
        request.httpMethod=kXMHTTPMethodGET;
    } onSuccess:^(id  _Nullable responseObject) {
        NSString * status=responseObject[@"status"];
        if ([status isEqualToString:@"ok"]) {
            NSArray * keyArr=[responseObject allKeys];
            if ([keyArr containsObject:@"message"]) {
                
                [self.learnPlaneDetailBean setMessageDic:messageDic setArticleDicArr: responseObject[@"message"]];
                [self.learnPlaneTableView setLearnPlaneDetailBean:self.learnPlaneDetailBean];
                [self.learnPlaneTableView reloadData];
                
                
            }
            
        }
        
        
        
    }];
    
}



#pragma mark --init view --


-(LearnPlaneTableView *) learnPlaneTableView{
    if (_learnPlaneTableView==nil) {
        _learnPlaneTableView=[[LearnPlaneTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
        _learnPlaneTableView.myDeletage=self;
    }
    return _learnPlaneTableView;
}
-(LearnHeaderView *) headerView{
    if(_headerView==nil){
        _headerView=[[LearnHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,0)];
        _headerView.backgroundColor=[UIColor whiteColor];
    }
    return _headerView;
}




#pragma mark -parseData-
-(void)parsePlaneDetail:(NSDictionary *) messageDic{
    
    NSDictionary * classNic =messageDic[@"clazz"];
    NSDictionary * ruleNic =messageDic[@"rule"];
    NSDictionary * scNic =messageDic[@"sc"];
    NSString * planeName=classNic[@"name"];
    NSString * planeDesc =ruleNic[@"desc"];
    
    NSInteger readNum= [ruleNic[@"readNum"] intValue];
    
    long startTime = [scNic[@"startTime"] longValue];
    long endTime  =  [scNic[@"endTime"] longValue];
    if (planeName.length==0) {
        planeName=ruleNic[@"name"];
    }
    NSString * showTime=[LCUtils planeLong2str:startTime endTime:endTime];
    planeDesc=@"jjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnskjjabjfkjbsfkjbskjfnskjnfskfnsk";
    [self.headerView setPlaneName:planeName setPlaneDesc:planeDesc setPlaneTime:showTime];
    self.headerView.frame=CGRectMake(0, 0, self.view.frame.size.width, self.headerView.headerHeight);
    [self.learnPlaneTableView setTableHeaderView:self.headerView];
    
    if (readNum>0) {
        [self getArticleData:messageDic];
    }else{
        [self.learnPlaneDetailBean setMessageDic:messageDic setArticleDicArr:nil];
        [self.learnPlaneTableView setLearnPlaneDetailBean:self.learnPlaneDetailBean];
        [self.learnPlaneTableView reloadData];
    }

}



#pragma mark --delegate


-(void)gotoLearnVideoClazzId:(NSString *)clazzId courseID:(int)courseID lastLearnVideoId:(int)videoID{
    LearnVideoViewController * learnVideoVC=[[LearnVideoViewController alloc] init];
    [self.navigationController pushViewController:learnVideoVC animated:YES];

}

@end

