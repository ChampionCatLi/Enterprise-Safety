//
//  LCCircular.m
//  EnterpriseSafety
//
//  Created by 超 on 2019/12/23.
//  Copyright © 2019 chao. All rights reserved.
//

#import "LCCircular.h"
#define LCGayColor  [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1]

@interface LCCircular()
{
    CAShapeLayer* _trackLayer;
    CAShapeLayer* _progressLayer;
    CAShapeLayer* _frontLayer;

}
@end

@implementation LCCircular

-(instancetype)initWithFrame:(CGRect)frame lineWidth:(float)lineWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        _lineWidth = lineWidth;
        [self buildLayout];
    }
    return self;
}

-(void)buildLayout
{
    float centerX = self.bounds.size.width/2.0;
    float centerY = self.bounds.size.height/2.0;
    //半径
    float radius = (self.bounds.size.width-_lineWidth)/2.0;
    
    //创建贝塞尔路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:radius startAngle:(-0.5f*M_PI) endAngle:1.5f*M_PI clockwise:YES];
    
    //添加背景圆环

    CAShapeLayer *backLayer = [CAShapeLayer layer];
    backLayer.frame = self.bounds;
    backLayer.fillColor =  [[UIColor clearColor] CGColor];
//    frontLayer
    backLayer.strokeColor  = LCGayColor.CGColor;
    backLayer.lineWidth = _lineWidth;
    backLayer.path = [path CGPath];
    backLayer.strokeEnd = 1;
    [self.layer addSublayer:backLayer];
    
    //创建进度layer
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    //指定path的渲染颜色
    _progressLayer.strokeColor  = [[UIColor blackColor] CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = _lineWidth;
    _progressLayer.path = [path CGPath];
    _progressLayer.strokeEnd = 0;
    
//    rgba(33, 150, 243, 1)

    
    _frontLayer= [CAShapeLayer layer];
    _frontLayer.frame = self.bounds;
    _frontLayer.fillColor =  [[UIColor clearColor] CGColor];
    _frontLayer.strokeColor  = [UIColor grayColor].CGColor;
    _frontLayer.lineWidth = _lineWidth;
    _frontLayer.path = [path CGPath];
    _frontLayer.strokeEnd = 1;
    
    [_frontLayer setMask:_progressLayer]; //用progressLayer来截取渐变层
    [self.layer addSublayer:_frontLayer];
  
    

}

-(void)setProgress:(float)progress
{
    _progress = progress;
    _progressLayer.strokeEnd = progress;
    if(progress==1){
        _frontLayer.strokeColor=[UIColor redColor].CGColor;
    }
    [self updateEndPoint];
    [_progressLayer removeAllAnimations];
}

//更新小点的位置
-(void)updateEndPoint
{
    //转成弧度
    CGFloat angle = M_PI*2*_progress;
    float radius = (self.bounds.size.width-_lineWidth)/2.0;
    int index = (angle)/M_PI_2;//用户区分在第几象限内
    float needAngle = angle - index*M_PI_2;//用于计算正弦/余弦的角度
    float x = 0,y = 0;//用于保存_dotView的frame
    switch (index) {
        case 0:
            NSLog(@"第一象限");
            x = radius + sinf(needAngle)*radius;
            y = radius - cosf(needAngle)*radius;
            break;
        case 1:
            NSLog(@"第二象限");
            x = radius + cosf(needAngle)*radius;
            y = radius + sinf(needAngle)*radius;
            break;
        case 2:
            NSLog(@"第三象限");
            x = radius - sinf(needAngle)*radius;
            y = radius + cosf(needAngle)*radius;
            break;
        case 3:
            NSLog(@"第四象限");
            x = radius - cosf(needAngle)*radius;
            y = radius - sinf(needAngle)*radius;
            break;
            
        default:
            break;
    }
    

}
@end
