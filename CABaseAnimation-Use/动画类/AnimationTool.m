//
//  AnimationTool.m
//  动画类
//
//  Created by  enniu on 16/6/17.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import "AnimationTool.h"

@implementation AnimationTool

+(CABasicAnimation *)animation_ForeverTwinklewithTime:(float)time //永久闪烁的动画
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.0];
    animation.autoreverses=YES;
    animation.duration=time;
    animation.repeatCount=FLT_MAX;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}


+(CABasicAnimation *)animation_HaveTimesTwinkleWithRepeatCount:(float)repeatCount durTimes:(float)time //有闪烁次数的动画

{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue=[NSNumber numberWithFloat:1.0];
    animation.toValue=[NSNumber numberWithFloat:0.4];
    animation.repeatCount=repeatCount;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses=YES;
    return  animation;
}


+(CABasicAnimation *)animation_moveXWithTime:(float)time andToValueX:(NSNumber *)x //横向移动

{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    animation.toValue=x;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    return animation;
}

+(CABasicAnimation *)animation_moveYWithTime:(float)time andToValueY:(NSNumber *)y //纵向移动

{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    animation.toValue=y;
    animation.duration=time;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
}

+(CABasicAnimation *)animation_ScaleFromValue:(NSNumber *)fromValue withToValue:(NSNumber *)toValue durTimes:(float)time Rep:(float)repeatTimes //缩放
{
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.fromValue=fromValue;
    animation.toValue=toValue;
    animation.duration=time;
    animation.autoreverses=YES;
    animation.repeatCount=repeatTimes;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
}

+(CABasicAnimation *)animation_Rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount //旋转

{
    CATransform3D rotationTransform  = CATransform3DMakeRotation(degree, 0, 0,direction);
    CABasicAnimation* animation;
    animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue= [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration= dur;
    animation.autoreverses= NO;
    animation.cumulative= YES;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.repeatCount= repeatCount;
    animation.delegate= self;
    
    return animation;
}

+(CABasicAnimation *)animation_MoveAndTransfromWithToValve:(float)toValue andDuration:(float)duration{
    /**动画1(在X轴方向移动)*/
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    //终点设定
    animation1.toValue = [NSNumber numberWithFloat:toValue];
    
    /**动画2(绕Z轴中心旋转)*/
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //开始时的旋转角度
    animation2.fromValue = [NSNumber numberWithFloat:0.f];
    //结束时的旋转角度
    animation2.toValue = [NSNumber numberWithFloat:44*M_PI];
    
    /**动画组*/
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = duration;
    group.repeatCount = 1;
    group.autoreverses = YES;
    
    group.animations = [NSArray arrayWithObjects:animation1,animation2, nil];
    return group;
}

@end
