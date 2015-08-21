//
//  GBMSquareTableViewController.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/20.
//  Copyright (c) 2015年 MuRan. All rights reserved.
//

#import "GBMSquareTableViewController.h"

@interface GBMSquareTableViewController ()
@property (nonatomic, strong) NSMutableArray * dataArrays;
@property (nonatomic, strong) NSMutableArray * dataArray;
@end

@implementation GBMSquareTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 提取数据
    GBMSquareData * squareDataArray = [[GBMSquareData alloc] init];
    self.dataArrays  = [[NSMutableArray alloc] initWithArray:squareDataArray.squaredataArray];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrays.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell  * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.row < [self.dataArrays count]) {
        
        [self cleanCellSubviews:cell];
        
        // 设置图标
        UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location"]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.frame = CGRectMake(6, 13, 12, 12);
        [cell addSubview:imageView];
        
        // 设置标签
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(24, 7, cell.bounds.size.width - 24, 25)];
        label.text = [NSString stringWithFormat:@"This is the %li cell", (long)indexPath.row];
        label.textColor = [UIColor colorWithRed:152 / 255.0 green:152 / 255.0 blue:152 / 255.0 alpha:1];
        [cell addSubview:label];

        // 设置集合视图
        GBMSquareCollectionView * squareCollectionView = [[GBMSquareCollectionView alloc] initWithFrame:CGRectMake(15, 32, cell.bounds.size.width - 15, cell.bounds.size.height - 32)];
        [squareCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
        
        squareCollectionView.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        squareCollectionView.delegate = self;
        squareCollectionView.dataSource = self;
        self.dataArray = self.dataArrays[indexPath.row];
        [cell addSubview:squareCollectionView];
    }
    return cell;

}
// 清空单元格
- (void)cleanCellSubviews:(UIView *)cell {
    while (cell.subviews.count > 0) {
        [cell.subviews.lastObject removeFromSuperview];
    }
}

// 设置表格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 182;
}

#pragma mark - 集合视图方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    if (indexPath.row < self.dataArray.count) {
        
        GBMSquareDataModel * data = self.dataArray[indexPath.row];
        // 配置图片
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 95)];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.image = [UIImage imageNamed:data.photoURL];
        
        // 配置文字
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.numberOfLines = 0;
        UIFont * font = [UIFont systemFontOfSize:12];
        CGRect rect = [[data photoNote] boundingRectWithSize:CGSizeMake(140, 31) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil];
        label.frame = CGRectMake(0, 104, 140, rect.size.height);
        label.font = font;
        label.text = data.photoNote;
        
        // 添加视图
        [self cleanCellSubviews:cell];
        [cell addSubview:imageView];
        [cell addSubview:label];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(140, 130);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 6;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"you did selection the cell");
}

@end
