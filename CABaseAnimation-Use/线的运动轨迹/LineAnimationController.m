//
//  LineAnimationController.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/29.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "LineAnimationController.h"
#import "LineView.h"

@interface LineAnimationController ()

@property (nonatomic, strong) LineView *lineV;

@end

@implementation LineAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"线的运动轨迹";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.lineV = [[LineView alloc]init];
    [self.view addSubview:self.lineV];
    [self.lineV autoPinEdgesToSuperviewEdges];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
