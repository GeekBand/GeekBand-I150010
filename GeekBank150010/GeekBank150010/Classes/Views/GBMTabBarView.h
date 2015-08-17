//
//  GBMTabBarView.h
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/17.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GBMCameraButton.h"

@interface GBMTabBarView : UIView

@property (nonatomic, strong) GBMCameraButton * cameraButton;
@property (nonatomic, strong) UIButton * squareButton;
@property (nonatomic, strong) UIButton * accountButton;

@end
