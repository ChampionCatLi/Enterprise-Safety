//
//  OpenPlaneTableView.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/30.
//  Copyright © 2019 chao. All rights reserved.
//

#import "OpenPlaneTableView.h"
#import "OpenCourseTableViewCell.h"

@interface OpenPlaneTableView()

@property(nonatomic,strong) UIView * headerView;
@property(nonatomic,strong) UIView * footerView;
@end

@implementation OpenPlaneTableView

-(instancetype) initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self=[super initWithFrame:frame style:style]) {
        self.delegate=self;
        self.dataSource=self;
        self.backgroundColor=[UIColor blueColor];
    }
    return self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString  * id =@"cell";
    OpenCourseTableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:id];
    if (cell==nil) {
        cell=[[OpenCourseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:id];
    }
    [cell setOpenCourseData:_data[indexPath.row]];
    return cell;
}

-(void)setData:(NSArray *)data{
    if (data.count>0) {
          _data=data;
        self.footerView=self.footerView;
        [self reloadData];
    }
}


-(UIView *) footerView{
    
    if (_footerView==nil) {
        _footerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
        _footerView.backgroundColor=[UIColor greenColor];
    }

    return _footerView;
    
}

@end
