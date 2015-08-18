//
//  GBMCameraButton.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/18.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMCameraButton.h"

@implementation GBMCameraButton

#pragma mark - 绘制圆形的按钮
- (void)drawRect:(CGRect)rect {
    UIBezierPath * roundPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.bounds.size.width / 2];
    [roundPath addClip];
    [[UIColor orangeColor] setFill];
    UIRectFill(self.bounds);
    roundPath.lineWidth = 3;
    [[UIColor whiteColor] setStroke];
    [roundPath stroke];
}

@end
