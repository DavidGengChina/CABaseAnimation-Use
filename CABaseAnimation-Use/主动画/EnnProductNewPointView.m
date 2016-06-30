//
//  EnnProductNewPointView.m
//  EnNew
//
//  Created by  enniu on 16/5/25.
//  Copyright © 2016年 EnNew. All rights reserved.
//

#import "EnnProductNewPointView.h"

#define TimeWait 2.5

#define SCREEN_WIDTH_SELF self.frame.size.width

#define SCREEN_HEIGHT_SELF self.frame.size.height

#define InnovationBeginPoint SCREEN_WIDTH_SELF*0.17

#define InnovationCenterPoint SCREEN_WIDTH_SELF*0.56

#define InnovationEndPoint SCREEN_WIDTH_SELF*1.5

@interface EnnProductNewPointView ()

@property (nonatomic, strong) UIView *firstView;

@property (nonatomic, strong) UIView *secondView;

@property (nonatomic,strong) NSMutableArray <UIImageView *> *starImageArr;

@property (nonatomic,strong) NSMutableArray <UIImageView *> *secondStarImageArr;

@end

@implementation EnnProductNewPointView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.starImageArr = [[NSMutableArray alloc]init];
        self.secondStarImageArr = [[NSMutableArray alloc]init];
        
        [self performSelector:@selector(animationWithView) withObject:nil afterDelay:1];
      
        [self performSelector:@selector(leftTopNameLabelAndDescLabel) withObject:nil afterDelay:7];
    }
    return self;
}

#pragma mark - 两个创新点的动画
- (void)animationWithView
{
    self.firstView = [[UIView alloc]init];
    self.firstView.frame = CGRectMake(-215, 15, 215, 27);
    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"movetab_1.png"]];
    self.firstView.backgroundColor = bgColor;
    self.firstView.alpha = 0.7;
    [self addSubview:self.firstView];
    
    
    for (NSInteger i = 0; i < 7; i++) {
        UIImageView * img = [self getStarImg];
        [self.starImageArr addObject:img];
        [self.firstView addSubview:img];
    }
    
    
    for (int i = 0; i < 3; i++) {
        UIImageView * img = self.starImageArr[i];
        img.image = [UIImage imageNamed:@"icon_cret_star_dark"];
    }
    
    
    [self.starImageArr autoSetViewsDimension:ALDimensionHeight toSize:11.0];
    [self.starImageArr autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:3.0 insetSpacing:YES matchedSizes:YES];
    [self.starImageArr.firstObject autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.starImageArr.firstObject autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:90];
    [self.starImageArr.lastObject autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    
    self.secondView = [[UIView alloc]init];
    self.secondView.frame = CGRectMake(-215, 50, 215, 27);
    UIColor *secondBgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"movetab_2.png"]];
    self.secondView.backgroundColor = secondBgColor;
    self.secondView.alpha = 0.7;
    [self addSubview:self.secondView];
    
    
    for (NSInteger i = 0; i < 7; i++) {
        UIImageView * img = [self getStarImg];
        [self.secondStarImageArr addObject:img];
        [self.secondView addSubview:img];
    }
    
    [self.secondStarImageArr autoSetViewsDimension:ALDimensionHeight toSize:11.0];
    [self.secondStarImageArr autoDistributeViewsAlongAxis:ALAxisHorizontal alignedTo:ALAttributeHorizontal withFixedSpacing:3.0 insetSpacing:YES matchedSizes:YES];
    [self.secondStarImageArr.firstObject autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.secondStarImageArr.firstObject autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:90];
    [self.secondStarImageArr.lastObject autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    
    [self.secondView.layer addAnimation:[AnimationLineTool animationSpeedViewWithFromValue:@20 andToValue:@(InnovationBeginPoint+15) andTimeDuration:1] forKey:nil];
    
    [self performSelector:@selector(secondViewAnimation) withObject:nil afterDelay:0.05];
    [self performSelector:@selector(centerAnimation) withObject:nil afterDelay:5];
}

- (UIImageView *)getStarImg {
    UIImageView * starIm = [UIImageView newAutoLayoutView];
    [starIm setImage:[UIImage imageNamed:@"icon_cret_star.png"]];
    return starIm;
}
#pragma mark - 两个创新度一开始的动画轨迹
- (void)secondViewAnimation
{
    [self.firstView.layer addAnimation:[AnimationLineTool animationSpeedViewWithFromValue:@1 andToValue:@(InnovationBeginPoint) andTimeDuration:0.5] forKey:nil];
    
    [self performSelector:@selector(Animation) withObject:nil afterDelay:0.05];
}
#pragma mark - 两个创新度中间的动画轨迹
- (void)Animation{
    [self.firstView.layer addAnimation:[AnimationLineTool animationSpeedViewWithFromValue:@(InnovationBeginPoint) andToValue:@(InnovationCenterPoint) andTimeDuration:5] forKey:nil];
    
    [self.secondView.layer addAnimation:[AnimationLineTool animationSpeedViewWithFromValue:@(InnovationBeginPoint+35) andToValue:@(InnovationCenterPoint+15) andTimeDuration:5] forKey:nil];
}
#pragma mark - 两个创新度结束的动画轨迹
- (void)centerAnimation
{
    
    [self.secondView.layer addAnimation:[AnimationLineTool animationSpeedViewWithFromValue:@(InnovationCenterPoint) andToValue:@(InnovationEndPoint) andTimeDuration:2] forKey:nil];
    
    [self performSelector:@selector(endAnimation) withObject:nil afterDelay:0.1];
}

- (void)endAnimation
{
    
    [self.firstView.layer addAnimation:[AnimationLineTool animationSpeedViewWithFromValue:@(InnovationCenterPoint) andToValue:@(InnovationEndPoint) andTimeDuration:2] forKey:nil];
}

#pragma mark - 左上
- (void)leftTopNameLabelAndDescLabel
{
    
    [self addSubview:self.leftTopView];
    
    [self.leftTopView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.f];
    [self.leftTopView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10.f];
    [self.leftTopView autoSetDimension:ALDimensionWidth toSize:110];
    [self.leftTopView autoSetDimension:ALDimensionHeight toSize:50];
    
    [self performSelector:@selector(rightTopNameLabelAndDescLabel) withObject:nil afterDelay:TimeWait];
}

#pragma mark - 右上
- (void)rightTopNameLabelAndDescLabel
{
    [self addSubview:self.rightTopView];

    [self.rightTopView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10.f];
    [self.rightTopView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.f];
    [self.rightTopView autoSetDimension:ALDimensionWidth toSize:110];
    [self.rightTopView autoSetDimension:ALDimensionHeight toSize:50];
    
    [self performSelector:@selector(leftBottomNameLabelAndDescLabel) withObject:nil afterDelay:TimeWait];
}

#pragma mark - 左下
- (void)leftBottomNameLabelAndDescLabel
{

    [self addSubview:self.leftBottomView];
    
    [self.leftBottomView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30.f];
    [self.leftBottomView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10.f];
    [self.leftBottomView autoSetDimension:ALDimensionWidth toSize:110];
    [self.leftBottomView autoSetDimension:ALDimensionHeight toSize:50];
    
    [self performSelector:@selector(rightBottomNameLabelAndDescLabel) withObject:nil afterDelay:TimeWait];
}

#pragma mark - 右下
- (void)rightBottomNameLabelAndDescLabel
{
    
    [self addSubview:self.rightBottomView];
    
    [self.rightBottomView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:30.f];
    [self.rightBottomView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.f];
    [self.rightBottomView autoSetDimension:ALDimensionWidth toSize:110];
    [self.rightBottomView autoSetDimension:ALDimensionHeight toSize:50];
    
    [self performSelector:@selector(leftCenterNameLabelAndDescLabel) withObject:nil afterDelay:TimeWait];
}

#pragma mark - 左中
- (void)leftCenterNameLabelAndDescLabel
{
    
    [self addSubview:self.leftCenterView];
    
    [self.leftCenterView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.leftTopView withOffset:2.f];
    [self.leftCenterView autoPinEdgeToSuperviewEdge:ALEdgeLeading withInset:10.f];
    [self.leftCenterView autoSetDimension:ALDimensionWidth toSize:110];
    [self.leftCenterView autoSetDimension:ALDimensionHeight toSize:50];
    
    
}
#pragma mark - 懒加载
- (UIView *)leftTopView
{
    if (!_leftTopView) {
        _leftTopView = [EnnProductNewLeftTopView newAutoLayoutView];
        _leftTopView.backgroundColor = [UIColor clearColor];
    }
    return _leftTopView;
}

- (UIView *)rightTopView
{
    if (!_rightTopView) {
        _rightTopView = [EnnProduceRightTop newAutoLayoutView];
        _rightTopView.backgroundColor = [UIColor clearColor];
    }
    return _rightTopView;
}

- (UIView *)leftCenterView
{
    if (!_leftCenterView) {
        _leftCenterView = [EnnProductNewLeftTopView newAutoLayoutView];
        _leftCenterView.backgroundColor = [UIColor clearColor];
    }
    return _leftCenterView;
}

- (UIView *)leftBottomView
{
    if (!_leftBottomView) {
        _leftBottomView = [EnnProductNewLeftBottom newAutoLayoutView];
        _leftBottomView.backgroundColor = [UIColor clearColor];
    }
    return _leftBottomView;
}

- (UIView *)rightBottomView
{
    if (!_rightBottomView) {
        _rightBottomView = [EnnproductNewRightBottom newAutoLayoutView];
        _rightBottomView.backgroundColor = [UIColor clearColor];
    }
    return _rightBottomView;
}

@end
