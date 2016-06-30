//
//  MoveAnimationController.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/29.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "MoveAnimationController.h"

@interface MoveAnimationController ()

@end

@implementation MoveAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"移动动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30.f];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100.f];
    [redView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [redView.layer addAnimation:[AnimationTool animation_moveXWithTime:3.f andToValueX:@150] forKey:nil];
    
    UIView *blueView = [[UIView alloc]init];
    [self.view addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30.f];
    [blueView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100.f];
    [blueView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [blueView.layer addAnimation:[AnimationTool animation_moveYWithTime:2.f andToValueY:@340] forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
