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
//@property(nonatomic,strong) OpenCourseTableViewCell * openCpurseTableViewCell;
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
    NSLog(@"%ld",_data.count);
    return _data.count;
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
        [self reloadData];
    }
   
    
}
-(UIView *) headerView{
    if (_headerView==nil) {
        _headerView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        _headerView.backgroundColor=[UIColor orangeColor];
//        UILabel * headerTitle=[[UILabel alloc] initWithFrame:CGRectMake(15, 0, 100, 40)];
//        headerTitle.font=LCFont15;
//        headerTitle.text=@"可选课程";
//        headerTitle.adjustsFontSizeToFitWidth=YES;
//        [_headerView addSubview:headerTitle];
//        [headerTitle mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(_headerView.mas_centerY);
//            make.left.equalTo(self.headerView.mas_left).offset(15);
//        }];
//
//        UIView * gayLine=[[UIView alloc] init];
//        gayLine.backgroundColor=LCGayLineBDBDBD;
//        [self.headerView addSubview:gayLine];
//        [gayLine mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.equalTo(self.headerView.mas_width);
//            make.height.equalTo(@0.5);
//            make.bottom.equalTo(self.headerView.mas_bottom);
//        }];
//
    }
    return _headerView;
}

@end
