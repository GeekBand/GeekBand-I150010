//
//  GBMSquareCollectionView.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/18.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMSquareCollectionView.h"

@implementation GBMSquareCollectionView

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _layout;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame collectionViewLayout:self.layout];
    self.backgroundColor = [UIColor whiteColor];
    return self;
}

@end
