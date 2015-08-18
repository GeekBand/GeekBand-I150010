//
//  GBMSquareData.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/18.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMSquareData.h"

// 建立静态变量
static GBMSquareData * shared = nil;

@interface GBMSquareData()

@property (nonatomic, strong) GBMSquareDataModel * squareData;

@end

@implementation GBMSquareData

- (NSMutableArray *)squaredataArray {
    if (!_squaredataArray) {
        _squaredataArray = [[NSMutableArray alloc] init];
    }
    return _squaredataArray;
}

- (GBMSquareData *)init {
    for (int i = 0; i < 10; i++) {
        NSMutableArray * squareDataModels = [[NSMutableArray alloc] init];
        for (int j = 0; j < 10; j++) {
            GBMSquareDataModel *squareDataModel = [[GBMSquareDataModel alloc] init];
            squareDataModel.coordinateX = i;
            squareDataModel.coordinateY = j;
            squareDataModel.photoURL    = [NSString stringWithFormat:@"%i", (arc4random() % 6 + 1)];
            squareDataModel.photoNote   = [NSString stringWithFormat:@"这里是第%i行的，第%i条信息。", i, j];
            [squareDataModels addObject:squareDataModel];
        }
        [self.squaredataArray addObject:squareDataModels];
    }
    
    return self;
}

//@property (nonatomic, strong) NSArray * squaredataArray;
// 重写 alloc 方法，确保不会被重新分配新的实例内存。
+ (instancetype)alloc {
    @synchronized(self) {
        if (shared == nil) {
            shared = [super alloc];
            return shared;
        }
    }
    return shared;
}

// 重写 allocWithZone
+ (id)allocWithZone:(struct _NSZone *)zone {
    @synchronized(self) {
        if (shared == nil) {
            shared = [super allocWithZone:zone];
            return shared;
        }
    }
    return nil;
}

// 重写 copyWithZone
+ (id)copyWithZone:(NSZone *)zone {
    return self;
}


@end
