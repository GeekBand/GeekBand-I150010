//
//  GBMSquareTableViewCell.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/18.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMSquareTableViewCell.h"

@implementation GBMSquareTableViewCell

#pragma mark - 初始化
- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 20)];
    }
    return _label;
}

- (GBMSquareCollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[GBMSquareCollectionView alloc] initWithFrame:CGRectMake(0, 20, self.bounds.size.width, self.bounds.size.height - 40)];
    }
    return _collectionView;
}

- (instancetype)init {
    self = [super init];
    self.label.text = @"sdsd";
    [self addSubview:self.label];
    [self addSubview:self.collectionView];
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
