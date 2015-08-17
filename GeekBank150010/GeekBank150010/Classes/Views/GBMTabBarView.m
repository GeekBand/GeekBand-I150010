//
//  GBMTabBarView.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/17.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import "GBMTabBarView.h"

@implementation GBMTabBarView

#pragma mark - 初始化

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.cameraButton.center = CGPointMake(self.frame.size.width / 2, 0);
    [self addSubview:self.cameraButton];
    return self;
}

- (GBMCameraButton *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [[GBMCameraButton alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
    }
    
    return _cameraButton;
}

- (UIButton *)squareButton {
    if (!_squareButton) {
        _squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _squareButton;
}

- (UIButton *)accountButton {
    if (!_accountButton) {
        _accountButton = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _accountButton;
}


- (void)drawRect:(CGRect)rect {
    UIBezierPath * roundPath = [UIBezierPath bezierPathWithRect:self.bounds];
    roundPath.lineWidth = 1;
    [[UIColor colorWithRed: 216 / 255.0 green: 216 / 255.0 blue: 216 / 255.0 alpha:0.9] setStroke];
    [roundPath stroke];
}


@end
