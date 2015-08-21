//
//  GBMTabBarViewController.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/19.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMTabBarViewController.h"

@interface GBMTabBarViewController ()

@end

@implementation GBMTabBarViewController

- (GBMCameraButton *)cameraButton {
    if (!_cameraButton) {
        _cameraButton = [[GBMCameraButton alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.bounds.size.height, self.tabBar.bounds.size.height)];
        _cameraButton.center = CGPointMake(self.tabBar.bounds.size.width / 2, 0);
    }
    return _cameraButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 去除边线
    [self.tabBar setShadowImage:[UIImage new]];
    UIGraphicsBeginImageContext(self.tabBar.bounds.size);
    UIImage * image = [UIImage imageNamed:@"emptyImage"];
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:image];
    
    
    [self.tabBar addSubview:self.cameraButton];
    
}

@end
