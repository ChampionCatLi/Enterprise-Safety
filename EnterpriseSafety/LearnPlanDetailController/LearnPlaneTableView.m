//
//  LearnPlaneTableView.m
//  EnterpriseSafety
//
//  Created by 超 on 2020/1/17.
//  Copyright © 2020 chao. All rights reserved.
//

#import "LearnPlaneTableView.h"
#import "LearnPlaneDetialBean.h"
#import "LearnPlaneDetailTableViewCell.h"

@interface LearnPlaneTableView()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation LearnPlaneTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self=[super initWithFrame:frame style:style]){
        
        [self initView];
        
    }
    return self;
    
}
-(void) initView{
    self.delegate=self;
    self.dataSource=self;
}

- (void)setLearnPlaneDetailBean:(LearnPlaneDetialBean *)learnPlaneDetailBean{
    
    _learnPlaneDetailBean=learnPlaneDetailBean;
}

//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * ID= @"cell";
    LearnPlaneDetailCourseTableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell=[[LearnPlaneDetailCourseTableViewCell alloc] init];
    }
    NSArray * data;
    data =  self.learnPlaneDetailBean.totalDataArr[indexPath.section];
    LearnPlaneDetialBeanCourseFrame * learnCourseFrame=  data[indexPath.row];
    cell.learnPlaneDetialBeanCourseFrame=learnCourseFrame;
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray * data=self.learnPlaneDetailBean.totalDataArr[section];
    
    return data.count;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray * data=self.learnPlaneDetailBean.totalDataArr[0];
    LearnPlaneDetialBeanCourseFrame * learnCourseFrame=data[indexPath.row];
    return  learnCourseFrame.cellHeight;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.learnPlaneDetailBean.totalDataArr.count;
}
@end

