//
//  CABaseAnimationController.m
//  CABaseAnimation-Use
//
//  Created by  enniu on 16/6/28.
//  Copyright © 2016年 enniu. All rights reserved.
//

#import "CABaseAnimationController.h"
#import "CABaseAnimationCell.h"

#import "MainAnimationController.h"
#import "TwinkAnimationController.h"
#import "MoveAnimationController.h"
#import "ScaleAnimationController.h"
#import "MoveAndTransfromAnimationController.h"
#import "LineAnimationController.h"

@interface CABaseAnimationController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *baseTableView;
@property (nonatomic, strong) NSArray *dataArr;
@end

@implementation CABaseAnimationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.baseTableView = [[UITableView alloc]init];
    [self.view addSubview:self.baseTableView];
    [self.baseTableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
}

- (NSArray *)dataArr{
    return @[@"主动画",@"闪烁",@"移动",@"缩放旋转",@"组合动画",@"线的运动轨迹"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CABaseAnimationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"animation"];
    if (cell == nil) {
        cell = [[CABaseAnimationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"animation"];
    }
    
    cell.cellNameLabel.text = self.dataArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MainAnimationController *mainVC = [[MainAnimationController alloc]init];
        [self.navigationController pushViewController:mainVC animated:YES];
    }else if (indexPath.row == 1){
        TwinkAnimationController *twinkVC = [[TwinkAnimationController alloc]init];
        [self.navigationController pushViewController:twinkVC animated:YES];
    }else if (indexPath.row == 2){
        MoveAnimationController *moveVC = [[MoveAnimationController alloc]init];
        [self.navigationController pushViewController:moveVC animated:YES];
    }else if (indexPath.row == 3){
        ScaleAnimationController *scaleVC = [[ScaleAnimationController alloc]init];
        [self.navigationController pushViewController:scaleVC animated:YES];
    }else if (indexPath.row == 4){
        MoveAndTransfromAnimationController *movAndTranVC = [[MoveAndTransfromAnimationController alloc]init];
        [self.navigationController pushViewController:movAndTranVC animated:YES];
    }else if (indexPath.row == 5){
        LineAnimationController *lineVC = [[LineAnimationController alloc]init];
        [self.navigationController pushViewController:lineVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
