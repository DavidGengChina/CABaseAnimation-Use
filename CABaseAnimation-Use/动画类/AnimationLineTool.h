//
//  AnimationLineTool.h
//  animation
//
//  Created by  enniu on 16/6/12.
//  Copyright © 2016年  enniu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#import <QuartzCore/QuartzCore.h>

@interface AnimationLineTool : NSObject

/**
 *  通过设置点,划其运动轨迹
 *
 *  @param pointA 点A
 *  @param pointB 点B
 *  @param pointC 点C
 *  @param view   当前哪个View
 */
+ (void)moveA:(CGPoint)pointA andMoveB:(CGPoint)pointB andMoveC:(CGPoint)pointC andView:(UIView *)view;


/**
 *  放大的动画
 *
 *  @param view 添加到哪个view
 */
+(void)circleScaleAndZoomInView:(UIView *)view;


/**
 *  移动速度的动画
 *
 *  @param fromValue 开始点
 *  @param toValue   结束点
 *  @param duration  运行时间
 *  @return 速度轨迹
 */
+ (CABasicAnimation *)animationSpeedViewWithFromValue:(id)fromValue andToValue:(id)toValue andTimeDuration:(int)duration;

/**
 *  通过设置点,划其运动轨迹
 *
 *  @param pointA 点A
 *  @param pointB 点B
 *  @param pointC 点C
 *  @param view   当前哪个View
 *  @param duration 动画时间
 */
+ (void)moveA:(CGPoint)pointA andMoveB:(CGPoint)pointB andMoveC:(CGPoint)pointC andView:(UIView *)view andTime:(float)duration;
@end
