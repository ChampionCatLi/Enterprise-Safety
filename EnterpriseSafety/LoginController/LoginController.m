//
//  LoginController.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/13.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@property (nonatomic,strong)UIImageView * topIconImageView;


@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
}

#pragma mark -init view
-(void) initView{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor=[UIColor redColor];


    [self.view addSubview:self.topIconImageView];
}
-(UIImageView *) topIconImageView{
    if (_topIconImageView==nil) {
        UIImage * image=[UIImage imageNamed:@"logo1.5x@png"];
        _topIconImageView=[[UIImageView alloc] initWithImage:image];
        _topIconImageView.frame=CGRectMake(SCREEN_WIDTH*0.5, 50, 40, 40);
        
    }
    
    
    return _topIconImageView;
    
    
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
