//
//  EnnProductNewLeftTopView.m
//  EnNew
//
//  Created by  enniu on 16/5/25.
//  Copyright © 2016年 EnNew. All rights reserved.
//

#import "EnnProductNewLeftTopView.h"

@interface EnnProductNewLeftTopView()
@property (nonatomic,strong) UIImageView *leftTopGIFImage;

@property (nonatomic, strong) UIImageView *leftTopCircleImage;

@end

@implementation EnnProductNewLeftTopView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubKongJian];
    }
    return self;
}

- (void)addSubKongJian{
    
    [self addSubview:self.leftTopGIFImage];
    [self.leftTopGIFImage autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0.f];
    [self.leftTopGIFImage autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0.f];
    
    
    [self performSelector:@selector(circleAnimation) withObject:nil afterDelay:1];
}

- (void)circleAnimation{
    [self addSubview:self.leftTopCircleImage];
    [self.leftTopCircleImage autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [self.leftTopCircleImage autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:7];
    [AnimationLineTool circleScaleAndZoomInView:self.leftTopCircleImage];
    
    [self performSelector:@selector(nameLabelAnimation) withObject:nil afterDelay:0.5];
}

- (void)nameLabelAnimation{
    [self.leftTopCircleImage addSubview:self.leftTopNameLabel];
    [self.leftTopNameLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.leftTopNameLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [self.leftTopNameLabel autoSetDimension:ALDimensionHeight toSize:15];
    
    [self performSelector:@selector(descLabelAnimation) withObject:nil afterDelay:0.5];
}

- (void)descLabelAnimation{
    [self addSubview:self.leftTopDesLabel];
    
    [self.leftTopDesLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.leftTopCircleImage withOffset:0.f];
    [self.leftTopDesLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.leftTopGIFImage withOffset:0.f];
    [self.leftTopDesLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10.f];
    [self.leftTopDesLabel autoSetDimension:ALDimensionHeight toSize:10];
}

- (UILabel *)leftTopDesLabel{
    if (!_leftTopDesLabel) {
        _leftTopDesLabel = [UILabel newAutoLayoutView];
        _leftTopDesLabel.textAlignment = NSTextAlignmentCenter;
        _leftTopDesLabel.text = @"描述最多六字";
        _leftTopDesLabel.font = [UIFont systemFontOfSize:9];
        _leftTopDesLabel.textColor = UIColorFromRGB(0xff7b1b);;
    }
    return _leftTopDesLabel;
}

- (UILabel *)leftTopNameLabel{
    if (!_leftTopNameLabel) {
        _leftTopNameLabel = [UILabel newAutoLayoutView];
        _leftTopNameLabel.textAlignment = NSTextAlignmentCenter;
        _leftTopNameLabel.text = @"创新";
        _leftTopNameLabel.font = [UIFont systemFontOfSize:9];
        _leftTopNameLabel.textColor = UIColorFromRGB(0xff7b1b);//[UIColor orangeColor];
    }
    return _leftTopNameLabel;
}

- (UIImageView *)leftTopCircleImage{
    if (!_leftTopCircleImage) {
        _leftTopCircleImage = [UIImageView newAutoLayoutView];
        _leftTopCircleImage.image = [UIImage imageNamed:@"circle"];
    }
    return _leftTopCircleImage;
}

-(UIImageView*)leftTopGIFImage{
    if (!_leftTopGIFImage) {
        _leftTopGIFImage = [UIImageView newAutoLayoutView];
        NSArray *aniImages = @[[UIImage imageNamed:@"flash1"],
                               [UIImage imageNamed:@"flash2"],
                               [UIImage imageNamed:@"flash3"],
                               [UIImage imageNamed:@"flash4"],
                               [UIImage imageNamed:@"flash5"],
                               [UIImage imageNamed:@"flash6"]];
        
        _leftTopGIFImage.animationImages = aniImages;
        _leftTopGIFImage.animationDuration = aniImages.count * 0.1;
        
        [_leftTopGIFImage startAnimating];
    }
    return _leftTopGIFImage;
}

- (void)drawRect:(CGRect)rect{
    
    CGPoint pointA = CGPointMake(95, 43);
    CGPoint pointB = CGPointMake(35, 43);
    CGPoint pointC = CGPointMake(27, 33);
    
    [AnimationLineTool moveA:pointA andMoveB:pointB andMoveC:pointC andView:self];
}

@end
