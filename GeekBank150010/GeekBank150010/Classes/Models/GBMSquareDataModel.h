//
//  SquareDataModel.h
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/16.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GBMSquareDataModel : NSObject

@property (nonatomic) float coordinateX;
@property (nonatomic) float coordinateY;
@property (nonatomic, strong) NSString * photoURL;
@property (nonatomic, strong) NSString * photoNote;

@end
