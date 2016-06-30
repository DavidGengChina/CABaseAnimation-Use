//
//  AnimationTool.h
//  动画类
//
//  Created by  enniu on 16/6/17.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <QuartzCore/QuartzCore.h>

@interface AnimationTool : NSObject
/**
 *  永久闪烁的动画
 *
 *  @param time 持续时间
 *
 *  @return 
 */
+(CABasicAnimation *)animation_ForeverTwinklewithTime:(float)time;

/**
 *  有闪烁次数的动画
 *
 *  @param repeatCount 闪烁次数
 *  @param time        闪烁间断的时间
 *
 *  @return 返回动画
 */
+(CABasicAnimation *)animation_HaveTimesTwinkleWithRepeatCount:(float)repeatCount durTimes:(float)time;

/**
 *  横向移动动画
 *
 *  @param time 动画时长
 *  @param x    移动距离
 *
 *  @return 返回横向移动动画
 */
+(CABasicAnimation *)animation_moveXWithTime:(float)time andToValueX:(NSNumber *)x;

/**
 *  纵向移动动画
 *
 *  @param time 动画时长
 *  @param y    移动距离
 *
 *  @return 返回纵向移动动画
 */
+(CABasicAnimation *)animation_moveYWithTime:(float)time andToValueY:(NSNumber *)y;

/**
 *  缩放动画
 *
 *  @param fromValue     开始值
 *  @param toValue       结束值
 *  @param time          动画时间
 *  @param repeatTimes   重复次数
 *
 *  @return 缩放动画
 */
+(CABasicAnimation *)animation_ScaleFromValue:(NSNumber *)fromValue withToValue:(NSNumber *)toValue durTimes:(float)time Rep:(float)repeatTimes;

/**
 *  旋转动画
 *
 *  @param dur         动画时间
 *  @param degree
 *  @param direction
 *  @param repeatCount 重复次数
 *
 *  @return 旋转动画
 */
+(CABasicAnimation *)animation_Rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount;

/**
 *  移动加旋转动画
 *
 *  @param toValue  结束的位置
 *  @param duration 动画时间
 *
 *  @return 移动旋转动画
 */
+(CABasicAnimation *)animation_MoveAndTransfromWithToValve:(float)toValue andDuration:(float)duration;

@end
