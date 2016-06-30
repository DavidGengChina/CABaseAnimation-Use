//
//  LineView.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/29.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "LineView.h"


@interface LineView ()

@property (nonatomic,strong) CAShapeLayer * linePath;

@end

@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        _linePath=[CAShapeLayer layer];
        _linePath.lineCap=kCALineCapRound;
        _linePath.lineJoin=kCALineJoinBevel;
        _linePath.lineWidth=2;
        _linePath.fillColor=[UIColor clearColor].CGColor;
        [self.layer addSublayer:_linePath];
        
        //橘色横线
        CGPoint pointA = CGPointMake(50, 150);
        CGPoint pointB = CGPointMake(200, 150);
        CGPoint pointC = CGPointMake(300, 80);
        [AnimationLineTool moveA:pointA andMoveB:pointB andMoveC:pointC andView:self andTime:3.f];
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    UIBezierPath *path=[UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(10, 300)];
    //    [path addLineToPoint:CGPointMake(50, 200)];
    //    [path addLineToPoint:CGPointMake(100, 150)];
    //    [path addLineToPoint:CGPointMake(150, 200)];
    
    [path addCurveToPoint:CGPointMake(300, 130) controlPoint1:CGPointMake(50, 150) controlPoint2:CGPointMake(100, 200)];
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle=kCGLineJoinRound;
    [[UIColor redColor]setStroke];
    CABasicAnimation *pathAnimation=[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    //    pathAnimation.valueFunction
    pathAnimation.duration = 3;
    pathAnimation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnimation.fromValue=[NSNumber numberWithFloat:0.0f];
    pathAnimation.toValue=[NSNumber numberWithFloat:1.0f];
    pathAnimation.autoreverses=NO;
    _linePath.path=path.CGPath;
    _linePath.strokeColor=[UIColor colorWithRed:255/255 green:156/255 blue:0 alpha:1].CGColor;
    [_linePath addAnimation:pathAnimation forKey:@"strokeEndAnimation"];
    
    _linePath.strokeEnd = 1.0;
}


@end
