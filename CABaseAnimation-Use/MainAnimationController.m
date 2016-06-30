//
//  MainAnimationController.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/28.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "MainAnimationController.h"

#import "EnnProductNewPointView.h"

@interface MainAnimationController ()

@property (nonatomic, strong) EnnProductNewPointView *animaView;

@end

@implementation MainAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"主动画";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self animationWithGrayView];
    
    UIButton *button = [[UIButton alloc]init];
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    button.frame = CGRectMake(50, 100, 100, 100);
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonClick{
    [self.animaView removeFromSuperview];
    
    [self animationWithGrayView];
}

- (void)animationWithGrayView{
    self.animaView = [[EnnProductNewPointView alloc]init];
    self.animaView.frame = CGRectMake(0, 300, self.view.frame.size.width, 300);
    [self.view addSubview:self.animaView];
    self.animaView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
