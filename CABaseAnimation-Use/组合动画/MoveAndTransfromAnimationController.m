//
//  MoveAndTransfromAnimationController.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/29.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "MoveAndTransfromAnimationController.h"

@interface MoveAndTransfromAnimationController ()

@end

@implementation MoveAndTransfromAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"组合动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *redView = [[UIView alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:30.f];
    [redView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:100.f];
    [redView autoSetDimensionsToSize:CGSizeMake(100, 100)];
    [redView.layer addAnimation:[AnimationTool animation_MoveAndTransfromWithToValve:150 andDuration:2] forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
