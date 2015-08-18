//
//  GBMTabBarView.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/18.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMTabBarView.h"

@interface GBMTabBarView() {
    CGFloat _height;
    CGFloat _width;
    UIEdgeInsets _cameraEdge;
    UIEdgeInsets _buttonEdage;
    UIEdgeInsets _titleEdage;
}

@end

@implementation GBMTabBarView


#pragma mark - 初始化

- (void)setFrame {
    _height = self.frame.size.height;
    _width  = self.frame.size.width;
    _cameraEdge  = UIEdgeInsetsMake(8, 10, 8, 10);
    _buttonEdage = UIEdgeInsetsMake(2, 13, 20, 13);
    _titleEdage     = UIEdgeInsetsMake(22, 0, 2, 0);
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    [self setFrame];
    
    self.cameraButton.center = CGPointMake(_width / 2, 0);
    [self addSubview:self.cameraButton];
    self.squareButton.center = CGPointMake(_width / 4, _height / 2);
    [self addSubview:self.squareButton];
    return self;
}

#pragma mark - 配置按钮

- (GBMCameraButton *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [[GBMCameraButton alloc] initWithFrame:CGRectMake(0, 0, _height, _height)];
        [_cameraButton setImage:[UIImage imageNamed:@"Camera"] forState:UIControlStateNormal];
        _cameraButton.imageEdgeInsets = _cameraEdge;
        _cameraButton.tag = 10;
        [_cameraButton addTarget:self action:@selector(tabBarViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraButton;
}

- (UIButton *)squareButton {
    if (!_squareButton) {
        _squareButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, _height, _height)];
        
        [_squareButton setImage:[UIImage imageNamed:@"Camera"] forState:UIControlStateNormal];
        _squareButton.imageEdgeInsets = _buttonEdage;
        [_squareButton setTitle:@"Square" forState:UIControlStateNormal];
        _squareButton.titleEdgeInsets    = _titleEdage;
        _squareButton.titleLabel.font = [UIFont systemFontOfSize:10];
        [_squareButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        
        _squareButton.tag = 11;
        [_squareButton addTarget:self action:@selector(tabBarViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _squareButton;
}

- (UIButton *)accountButton {
    if (!_accountButton) {
        _accountButton = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    return _accountButton;
}

#pragma mark - 按钮事件
- (void)tabBarViewButtonAction:(UIButton *)sender {
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Action" message:@"some button" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil ];
    [alert show];
}

#pragma mark - 绘制图形

- (void)drawRect:(CGRect)rect {
    UIBezierPath * roundPath = [UIBezierPath bezierPathWithRect:self.bounds];
    roundPath.lineWidth = 1;
    [[UIColor colorWithRed: 216 / 255.0 green: 216 / 255.0 blue: 216 / 255.0 alpha:0.9] setStroke];
    [roundPath stroke];
}


@end
