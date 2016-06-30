//
//  AnimationLineTool.m
//  animation
//
//  Created by  enniu on 16/6/12.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "AnimationLineTool.h"


@implementation AnimationLineTool

+ (void)moveA:(CGPoint)pointA andMoveB:(CGPoint)pointB andMoveC:(CGPoint)pointC andView:(UIView *)view{
    CAShapeLayer *linePath = [CAShapeLayer layer];
    linePath=[CAShapeLayer layer];
    linePath.lineCap=kCALineCapRound;
    linePath.lineJoin=kCALineJoinBevel;
    linePath.lineWidth=1;
    linePath.fillColor=[UIColor clearColor].CGColor;
    [view.layer addSublayer:linePath];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 0.7;
    
    path.lineCapStyle = kCGLineCapRound;//线条拐角
    path.lineJoinStyle = kCGLineCapRound;//线条终点
    
    [path moveToPoint:pointA];
    
    [path addLineToPoint:pointB];
    
    [path addLineToPoint:pointC];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = 0.5;
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue=[NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses=NO;
    linePath.path=path.CGPath;
    linePath.strokeColor=UIColorFromRGB(0xfc7a19).CGColor;//[UIColor orangeColor].CGColor;
    [linePath addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    linePath.strokeEnd = 1.0;
}

+(void)circleScaleAndZoomInView:(UIView *)view{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    // 动画选项设定
    animation.duration = 0.3; // 动画持续时间
    //    animation.repeatCount = 0; // 重复次数
    animation.autoreverses = NO; // 动画结束时执行逆动画
    // 缩放倍数
    animation.fromValue = [NSNumber numberWithFloat:-0.5]; // 开始时的倍率
    animation.toValue = [NSNumber numberWithFloat:-1.0]; // 结束时的倍率
    // 添加动画
    [view.layer addAnimation:animation forKey:@"scale-layer"];
}

+ (CABasicAnimation *)animationSpeedViewWithFromValue:(id)fromValue andToValue:(id)toValue andTimeDuration:(int)duration
{
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = @"position.x";
    animation2.fromValue = fromValue;
    animation2.toValue = toValue;
    animation2.duration = duration;
    animation2.timingFunction    = [CAMediaTimingFunction functionWithControlPoints:0 :0.7:0 :0.7];
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    
    return animation2;
}

+ (void)moveA:(CGPoint)pointA andMoveB:(CGPoint)pointB andMoveC:(CGPoint)pointC andView:(UIView *)view andTime:(float)duration{
    CAShapeLayer *linePath = [CAShapeLayer layer];
    linePath=[CAShapeLayer layer];
    linePath.lineCap=kCALineCapRound;
    linePath.lineJoin=kCALineJoinBevel;
    linePath.lineWidth=1;
    linePath.fillColor=[UIColor clearColor].CGColor;
    [view.layer addSublayer:linePath];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 0.7;
    
    path.lineCapStyle = kCGLineCapRound;//线条拐角
    path.lineJoinStyle = kCGLineCapRound;//线条终点
    
    [path moveToPoint:pointA];
    
    [path addLineToPoint:pointB];
    
    [path addLineToPoint:pointC];
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnimation.duration = duration;
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue=[NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses=NO;
    linePath.path=path.CGPath;
    linePath.strokeColor=UIColorFromRGB(0xfc7a19).CGColor;//[UIColor orangeColor].CGColor;
    [linePath addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    linePath.strokeEnd = 1.0;
}

@end
