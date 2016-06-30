//
//  TwinkAnimationController.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/29.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "TwinkAnimationController.h"

@interface TwinkAnimationController ()

@end

@implementation TwinkAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"闪烁动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30.f];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100.f];
    [redView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [redView.layer addAnimation:[AnimationTool animation_ForeverTwinklewithTime:0.5f] forKey:nil];
    
    UIView *blueView = [[UIView alloc]init];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView autoCenterInSuperview];
    [blueView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [blueView.layer addAnimation:[AnimationTool animation_HaveTimesTwinkleWithRepeatCount:3 durTimes:1.f] forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
