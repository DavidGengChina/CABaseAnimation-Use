//
//  EnnproductNewRightBottom.m
//  HDTest
//
//  Created by shen on 16/5/25.
//  Copyright © 2016年 shen. All rights reserved.
//

#import "EnnproductNewRightBottom.h"

@interface EnnproductNewRightBottom()
@property (nonatomic, strong) UIImageView *rightBottomGIFImage;

@property (nonatomic, strong) UIImageView *rightBottomCircleImage;

@end

@implementation EnnproductNewRightBottom

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addRightBottomView];
    }
    return self;
}

- (void)addRightBottomView{
    [self addSubview:self.rightBottomGIFImage];
    
    [self.rightBottomGIFImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0.f];
    [self.rightBottomGIFImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7.f];
    
    [self performSelector:@selector(rightBottomCircleImageAnimation) withObject:nil  afterDelay:1];
}

- (void)rightBottomCircleImageAnimation{
    [self addSubview:self.rightBottomCircleImage];
    
    [self.rightBottomCircleImage autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:9];
    [self.rightBottomCircleImage autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    [AnimationLineTool circleScaleAndZoomInView:self.rightBottomCircleImage];
    
    [self performSelector:@selector(rightBottomNameLabelAnimation) withObject:nil afterDelay:0.5];
}

- (void)rightBottomNameLabelAnimation{
    [self.rightBottomCircleImage addSubview:self.rightBottomNameLabel];
    
    [self.rightBottomNameLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.rightBottomNameLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.rightBottomNameLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [self performSelector:@selector(rightBottomDescLabelAnimation) withObject:nil afterDelay:0.5];
}

- (void)rightBottomDescLabelAnimation{
    [self addSubview:self.rightBottomDescLabel];
    
    [self.rightBottomDescLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.rightBottomGIFImage withOffset:0.f];
    [self.rightBottomDescLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.rightBottomCircleImage withOffset:0.f];
    [self.rightBottomDescLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0.f];
    [self.rightBottomDescLabel autoSetDimension:ALDimensionHeight toSize:10];
}

- (UILabel *)rightBottomDescLabel{
    if (!_rightBottomDescLabel) {
        _rightBottomDescLabel = [UILabel newAutoLayoutView];
        _rightBottomDescLabel.textAlignment = NSTextAlignmentCenter;
        _rightBottomDescLabel.text = @"描述最多六字";
        _rightBottomDescLabel.font = [UIFont systemFontOfSize:9];
        _rightBottomDescLabel.textColor = [UIColor orangeColor];
    }
    return _rightBottomDescLabel;
}

- (UILabel *)rightBottomNameLabel{
    if (!_rightBottomNameLabel) {
        _rightBottomNameLabel = [UILabel newAutoLayoutView];
        _rightBottomNameLabel.textAlignment = NSTextAlignmentCenter;
        _rightBottomNameLabel.text = @"创新";
        _rightBottomNameLabel.font = [UIFont systemFontOfSize:9];
        _rightBottomNameLabel.textColor = [UIColor orangeColor];
    }
    return _rightBottomNameLabel;
}

- (UIImageView *)rightBottomCircleImage{
    if (!_rightBottomCircleImage) {
        _rightBottomCircleImage = [UIImageView newAutoLayoutView];
        _rightBottomCircleImage.image = [UIImage imageNamed:@"circle"];
    }
    return _rightBottomCircleImage;
}

- (UIImageView *)rightBottomGIFImage{
    if (!_rightBottomGIFImage) {
        _rightBottomGIFImage = [UIImageView newAutoLayoutView];
        NSArray *aniImages = @[[UIImage imageNamed:@"flash1"],
                               [UIImage imageNamed:@"flash2"],
                               [UIImage imageNamed:@"flash3"],
                               [UIImage imageNamed:@"flash4"],
                               [UIImage imageNamed:@"flash5"],
                               [UIImage imageNamed:@"flash6"]];
        
        _rightBottomGIFImage.animationImages = aniImages;
        _rightBottomGIFImage.animationDuration = aniImages.count * 0.1;
        
        [_rightBottomGIFImage startAnimating];
    }
    return _rightBottomGIFImage;
}

- (void)drawRect:(CGRect)rect{
    CGPoint pointA = CGPointMake(13, 14);
    CGPoint pointB = CGPointMake(71, 14);
    CGPoint pointC = CGPointMake(77, 25);
    
    
    [AnimationLineTool moveA:pointA andMoveB:pointB andMoveC:pointC andView:self];
}

@end
