//
//  EnnProductNewPointView.h
//  EnNew
//
//  Created by  enniu on 16/5/25.
//  Copyright © 2016年 EnNew. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "EnnProductNewLeftTopView.h"
#import "EnnProduceRightTop.h"
#import "EnnProductNewLeftBottom.h"
#import "EnnproductNewRightBottom.h"

@interface EnnProductNewPointView : UIView

@property (nonatomic, strong) EnnProductNewLeftTopView *leftTopView;;

@property (nonatomic, strong) EnnProduceRightTop *rightTopView;

@property (nonatomic, strong) EnnProductNewLeftTopView *leftCenterView;

@property (nonatomic, strong) EnnProductNewLeftBottom *leftBottomView;

@property (nonatomic, strong) EnnproductNewRightBottom *rightBottomView;

@end
