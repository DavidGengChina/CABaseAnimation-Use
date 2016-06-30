//
//  ScaleAnimationController.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/29.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "ScaleAnimationController.h"

@interface ScaleAnimationController ()

@end

@implementation ScaleAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"缩放旋转";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30.f];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100.f];
    [redView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [redView.layer addAnimation:[AnimationTool animation_ScaleFromValue:@0.5 withToValue:@1 durTimes:1 Rep:MAX_CANON] forKey:nil];
    
    UIView *blueView = [[UIView alloc]init];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView autoCenterInSuperview];
    [blueView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [blueView.layer addAnimation:[AnimationTool animation_Rotation:0.1 degree:0.1 direction:1 repeatCount:MAX_CANON] forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
