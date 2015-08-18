//
//  GBMSquareViewController.m
//  GeekBank150010
//
//  Created by 黄穆斌 on 15/8/18.
//  Copyright (c) 2015年 MuRan. All rights reserved.
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
    //    [squareTableView registerClass:[GBMSquareTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    squareTableView.dataSource = self;
    squareTableView.delegate   = self;
    
    // 插入底栏
    GBMTabBarView * tabBarView = [[GBMTabBarView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    tabBarView.backgroundColor = [UIColor colorWithRed: 245 / 255.0 green: 244 / 255.0 blue:241 / 255.0 alpha:1];
    [self.view addSubview:tabBarView];
    
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
    GBMSquareTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.row < [self.dataArrays count]) {
        //        cell.label.text = [NSString stringWithFormat:@"This is the %li cell", (long)indexPath.row];
        //        [cell.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CollectionCell"];
        //        cell.collectionView.layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //        cell.collectionView.dataSource = self;
        //        cell.collectionView.delegate = self;
        //        cell.label.backgroundColor = [UIColor blackColor];
        //        NSLog(@"%lf", cell.label.bounds.size.height);
        
        [self cleanCellSubviews:cell];
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.bounds.size.width, 20)];
        label.text = [NSString stringWithFormat:@"This is the %li cell", (long)indexPath.row];
        [cell addSubview:label];
        
        GBMSquareCollectionView * squareCollectionView = [[GBMSquareCollectionView alloc] initWithFrame:CGRectMake(0, 20, cell.bounds.size.width, cell.bounds.size.height - 20)];
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
    return CGSizeMake(150, 100);
}


@end
