//
//  EnnProduceRightTop.m
//  HDTest
//
//  Created by shen on 16/5/25.
//  Copyright © 2016年 shen. All rights reserved.
//

#import "EnnProduceRightTop.h"
@interface EnnProduceRightTop()
@property (nonatomic, strong) UIImageView *rightTopGIFImage;

@property (nonatomic, strong) UIImageView *rightTopCircleImage;

@end

@implementation EnnProduceRightTop

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addRightTopView];
    }
    return self;
}

- (void)addRightTopView{
    [self addSubview:self.rightTopGIFImage];
    
    [self.rightTopGIFImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.f];
    [self.rightTopGIFImage autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.f];
    
    [self performSelector:@selector(circleImageViewAnimation) withObject:nil afterDelay:1];
}
#pragma mark - 圆动画
- (void)circleImageViewAnimation{
    [self addSubview:self.rightTopCircleImage];
    [self.rightTopCircleImage autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:9.f];
    [self.rightTopCircleImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7.f];
    
    [AnimationLineTool circleScaleAndZoomInView:self.rightTopCircleImage];
    
    [self performSelector:@selector(nameLabelAnimation) withObject:nil afterDelay:0.5];
}
#pragma mark - 名字label动画
- (void)nameLabelAnimation{
    [self.rightTopCircleImage addSubview:self.rightTopNameLabel];
    
    [self.rightTopNameLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.rightTopNameLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.rightTopNameLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [self performSelector:@selector(descLabelAnimation) withObject:nil afterDelay:0.5];
}
#pragma mark - 描述label动画
- (void)descLabelAnimation{
    [self addSubview:self.rightTopDescLabel];
    [self.rightTopDescLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.rightTopGIFImage withOffset:0.f];
    [self.rightTopDescLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rightTopCircleImage withOffset:0.f];
    [self.rightTopDescLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10.f];
    [self.rightTopDescLabel autoSetDimension:ALDimensionHeight toSize:10];
}
#pragma mark - 懒加载
- (UILabel *)rightTopDescLabel{
    if (!_rightTopDescLabel) {
        _rightTopDescLabel = [UILabel newAutoLayoutView];
        _rightTopDescLabel.textAlignment = NSTextAlignmentCenter;
        _rightTopDescLabel.text = @"描述最多六字";
        _rightTopDescLabel.font = [UIFont systemFontOfSize:9];
        _rightTopDescLabel.textColor = [UIColor orangeColor];
    }
    return _rightTopDescLabel;
}

- (UILabel *)rightTopNameLabel{
    if (!_rightTopNameLabel) {
        _rightTopNameLabel = [UILabel newAutoLayoutView];
        _rightTopNameLabel.textAlignment = NSTextAlignmentCenter;
        _rightTopNameLabel.text = @"创新";
        _rightTopNameLabel.font = [UIFont systemFontOfSize:9];
        _rightTopNameLabel.textColor = [UIColor orangeColor];
    }
    return _rightTopNameLabel;
}

- (UIImageView *)rightTopCircleImage{
    if (!_rightTopCircleImage) {
        _rightTopCircleImage = [UIImageView newAutoLayoutView];
        _rightTopCircleImage.image = [UIImage imageNamed:@"circle"];
    }
    return _rightTopCircleImage;
}

- (UIImageView *)rightTopGIFImage{
    if (!_rightTopGIFImage) {
        _rightTopGIFImage = [UIImageView newAutoLayoutView];
        NSArray *aniImages = @[[UIImage imageNamed:@"flash1"],
                               [UIImage imageNamed:@"flash2"],
                               [UIImage imageNamed:@"flash3"],
                               [UIImage imageNamed:@"flash4"],
                               [UIImage imageNamed:@"flash5"],
                               [UIImage imageNamed:@"flash6"]];
        
        _rightTopGIFImage.animationImages = aniImages;
        _rightTopGIFImage.animationDuration = aniImages.count * 0.1;
        
        [_rightTopGIFImage startAnimating];
    }
    return _rightTopGIFImage;
}
#pragma mark - 画线
- (void)drawRect:(CGRect)rect{
    CGPoint pointA = CGPointMake(13, 43);
    CGPoint pointB = CGPointMake(69, 43);
    CGPoint pointC = CGPointMake(77, 31);
    
    
    [AnimationLineTool moveA:pointA andMoveB:pointB andMoveC:pointC andView:self];
}

@end
