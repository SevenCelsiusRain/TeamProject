//
//  QDDestinationController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDDestinationController.h"

#import "QDCustomSegment.h"

#warning ---模型（可能需要统一）
#import "AFNetworking.h"
#import "QDDestModel.h"
#import "QDScenicSpotModel.h"

#import "QDDestCollectionCell.h"
#import "QDColHeaderView.h"
#import "QDDDetailsController.h"


@interface QDDestinationController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@property (nonatomic, assign) NSInteger index;

@end

@implementation QDDestinationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BckColor;
    
    [self initView];
    
  
}

- (void)initView {
    
    NSArray *items = @[@"国内", @"国外"];
    
    [QDCustomSegment segmentWithInstalView:self.view Items:items fontSize:20 selectIndex:^(NSInteger selectedSegmentIndex) {
        
        self.index = selectedSegmentIndex;
        
    }];
    
    
    [self creatColView];
    
}

- (NSMutableArray *)dataSource {
    
        
    [self request];
    
    return _dataSource;
}


- (void)creatColView {
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.layout.minimumLineSpacing = 10;
    self.layout.minimumInteritemSpacing = 0;
    self.layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
    self.layout.itemSize = CGSizeMake(165,220);
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:self.layout];
    self.collectionView.y = 115;
    self.collectionView.backgroundColor = BckColor;
    self.collectionView.height = self.view.height - 165;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.view addSubview:self.collectionView];
    
    
    
    NSString *className = NSStringFromClass([QDDestCollectionCell class]);
    [self.collectionView registerNib:[UINib nibWithNibName:className bundle:nil] forCellWithReuseIdentifier:className];
    
    // 头部
    NSString *headerName = NSStringFromClass([QDColHeaderView class]);
    [self.collectionView registerNib:[UINib nibWithNibName:headerName bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerName];
    
    
}

#pragma mark - +++ 每组元素数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    QDDestModel *destModel = self.dataSource[section];
    return destModel.destinations.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    QDDestCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([QDDestCollectionCell class]) forIndexPath:indexPath];
    
    QDDestModel *destModel = self.dataSource[indexPath.section];
    
    cell.secSpotModel = destModel.destinations[indexPath.row];
   
    return cell;
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    QDColHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:NSStringFromClass([QDColHeaderView class]) forIndexPath:indexPath];
    
    QDDestModel *destModel = self.dataSource[indexPath.section];
    headerView.continent = destModel.continent;
    
    return headerView;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(375, 30);
}

#warning ---- 攻略二级页面跳转
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    QDDDetailsController *dDetailsVc = [[QDDDetailsController alloc] init];
    
    QDDestModel *destModel = self.dataSource[indexPath.section];
    
   QDScenicSpotModel *secSpotModel = destModel.destinations[indexPath.row];

    
    dDetailsVc.page = secSpotModel.Id.integerValue;
    
    [self.navigationController pushViewController:dDetailsVc animated:YES];
    
}


- (void)request {
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSMutableArray *domesticM = [NSMutableArray array];
    NSMutableArray *overseasM = [NSMutableArray array];
    
    [manager GET:DEST_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        for (NSDictionary *dict in array) {
            
            QDDestModel *destModel = [QDDestModel destModelWithDict:dict];
            
            if (destModel.category.integerValue > 50) {
                
                [domesticM addObject:destModel];
                
            }else {
                
                [overseasM addObject:destModel];
                
            }
            
        }
        
        NSArray *containA = @[domesticM, overseasM];
        
        self.dataSource = containA[self.index];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
          [self.collectionView reloadData];
            
        });

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        QDLOG(@"%@ failure:%@",NSStringFromClass([self class]), error);
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
