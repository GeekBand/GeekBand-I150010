//
//  GBMSquareViewController.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/16.
//  Copyright (c) 2015年 huangmubin. All rights reserved.
//

#import "GBMSquareViewController.h"

@interface GBMSquareViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray * dataArrays;
@property (nonatomic, strong) NSMutableArray * dataArray;

@end

@implementation GBMSquareViewController

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];

    // 设置导航按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addMessageAction:)];
    
    // 插入并配置表格
    UITableView * squareTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:squareTableView];
    [squareTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    squareTableView.dataSource = self;
    squareTableView.delegate   = self;
    
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
}

#pragma mark - 按钮点击事件
- (void)addMessageAction:(UIBarButtonItem *)sender {
    
}

#pragma mark - 表格视图

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArrays.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.row < [self.dataArrays count]) {
        [self cleanCellSubviews:cell];
        GBMSquareCollectionView * squareCollectionView = [[GBMSquareCollectionView alloc] initWithFrame:cell.bounds];
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
    return 150;
}

#pragma mark - 集合视图方法

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
    if (indexPath.row < self.dataArray.count) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:cell.bounds];
        imageView.contentMode = UIViewContentModeScaleToFill;
        
        GBMSquareDataModel * data = self.dataArray[indexPath.row];
        imageView.image = [UIImage imageNamed:data.photoURL];
        [self cleanCellSubviews:cell];
        [cell addSubview:imageView];
    }
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(100, 100);
}

@end
