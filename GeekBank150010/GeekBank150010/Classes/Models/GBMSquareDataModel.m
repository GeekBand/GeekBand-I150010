//
//  GBMSquareDataModel.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/18.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMSquareDataModel.h"

@implementation GBMSquareDataModel

- (NSString *)photoURL {
    if (!_photoURL) {
        _photoURL = [[NSString alloc] init];
    }
    return _photoURL;
}

- (NSString *)photoNote {
    if (!_photoNote) {
        _photoNote = [[NSString alloc] init];
    }
    return _photoNote;
}

@end
