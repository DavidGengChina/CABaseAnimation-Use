//
//  EnnProductNewLeftBottom.m
//  HDTest
//
//  Created by shen on 16/5/25.
//  Copyright © 2016年 shen. All rights reserved.
//

#import "EnnProductNewLeftBottom.h"

@interface EnnProductNewLeftBottom()
@property (nonatomic, strong) UIImageView *leftBottonGIFImage;

@property (nonatomic, strong) UIImageView *leftBottonCircleImage;

@end

@implementation EnnProductNewLeftBottom

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addLeftBottonView];
    }
    return self;
}

- (void)addLeftBottonView{
    [self addSubview:self.leftBottonGIFImage];
    [self.leftBottonGIFImage autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.f];
    [self.leftBottonGIFImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7.f];
    
    [self performSelector:@selector(circleImageAnimation) withObject:nil afterDelay:1];
}

- (void)circleImageAnimation{
    [self addSubview:self.leftBottonCircleImage];
    [self.leftBottonCircleImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5.f];
    [self.leftBottonCircleImage autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.f];
    [AnimationLineTool circleScaleAndZoomInView:self.leftBottonCircleImage];
    
    [self performSelector:@selector(nameLabelAnimation) withObject:nil afterDelay:0.5];
}

- (void)nameLabelAnimation{
    [self.leftBottonCircleImage addSubview:self.leftBottonNameLabel];
    [self.leftBottonNameLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.leftBottonNameLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.leftBottonNameLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [self performSelector:@selector(descLabelAnimation) withObject:nil afterDelay:0.5];
}

- (void)descLabelAnimation{
    [self addSubview:self.leftBottonDescLabel];
    
    [self.leftBottonDescLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.leftBottonCircleImage withOffset:0.f];
    [self.leftBottonDescLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.leftBottonGIFImage withOffset:0.f];
    [self.leftBottonDescLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:1.f];
    [self.leftBottonDescLabel autoSetDimension:ALDimensionHeight toSize:10];
}

- (UILabel *)leftBottonDescLabel{
    if (!_leftBottonDescLabel) {
        _leftBottonDescLabel = [UILabel newAutoLayoutView];
        _leftBottonDescLabel.textAlignment = NSTextAlignmentCenter;
        _leftBottonDescLabel.text = @"描述最多六字";
        _leftBottonDescLabel.font = [UIFont systemFontOfSize:9];
        _leftBottonDescLabel.textColor = [UIColor orangeColor];
    }
    return _leftBottonDescLabel;
}

- (UILabel *)leftBottonNameLabel{
    if (!_leftBottonNameLabel) {
        _leftBottonNameLabel = [UILabel newAutoLayoutView];
        _leftBottonNameLabel.textAlignment = NSTextAlignmentCenter;
        _leftBottonNameLabel.text = @"工艺";
        _leftBottonNameLabel.font = [UIFont systemFontOfSize:9];
        _leftBottonNameLabel.textColor = [UIColor orangeColor];
    }
    return _leftBottonNameLabel;
}

- (UIImageView *)leftBottonCircleImage{
    if (!_leftBottonCircleImage) {
        _leftBottonCircleImage = [UIImageView newAutoLayoutView];
        _leftBottonCircleImage.image = [UIImage imageNamed:@"circle"];
    }
    return _leftBottonCircleImage;
}

- (UIImageView *)leftBottonGIFImage{
    if (!_leftBottonGIFImage) {
        _leftBottonGIFImage = [UIImageView newAutoLayoutView];
        NSArray *aniImages = @[[UIImage imageNamed:@"flash1"],
                               [UIImage imageNamed:@"flash2"],
                               [UIImage imageNamed:@"flash3"],
                               [UIImage imageNamed:@"flash4"],
                               [UIImage imageNamed:@"flash5"],
                               [UIImage imageNamed:@"flash6"]];
        
        _leftBottonGIFImage.animationImages = aniImages;
        _leftBottonGIFImage.animationDuration = aniImages.count * 0.1;
        
        [_leftBottonGIFImage startAnimating];
    }
    return _leftBottonGIFImage;
}

- (void)drawRect:(CGRect)rect{
    CGPoint pointA = CGPointMake(95, 14);
    CGPoint pointB = CGPointMake(35, 14);
    CGPoint pointC = CGPointMake(29, 26);
    
    
    [AnimationLineTool moveA:pointA andMoveB:pointB andMoveC:pointC andView:self];
}


@end
