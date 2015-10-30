//
//  QDBanDetailsController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/24.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBanDetailsController.h"
#import "AFNetworking.h"

#import "QDADDetailTableCell.h"

#warning ----测试Model
#import "QDDtailModel.h"
#import "QDADModel.h"
#import "QDHeaderView.h"

@interface QDBanDetailsController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@property (nonatomic, strong) QDDtailModel *detailModel;

#warning ----Header 实验
@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation QDBanDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BckColor;
    
    UIBarButtonItem *shareItem = [UIBarButtonItem itemWithTarget:self action:@selector(shareAction) image:@"ShareBorderBarButton" highlightedImage:@"ShareBorderBarButtonHighlight"];
    
    UIBarButtonItem *favoriteItem = [UIBarButtonItem itemWithTarget:self action:@selector(favoriteAction) image:@"FavoriteBarButton" highlightedImage:@"FavoriteBarButtonHighlight"];
    
    self.navigationItem.rightBarButtonItems = @[shareItem, favoriteItem];
    
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
  
    [self initView];
    
}



#warning -----分享调用
- (void) shareAction {
    
    
}

#warning ---- 收藏调用
- (void) favoriteAction {
    
    
}

- (NSArray *)dataSource {
    
    if (!_dataSource) {
        
        [self requesstData];
        
    }
    
    return _dataSource;
}

- (void) initView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
#warning --需完善，把头部进一步进行封装
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -64, 375, 600)];
    
    self.scrollView.userInteractionEnabled = NO;
    
    self.scrollView.backgroundColor = [UIColor clearColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 135)];
    
    headerView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = headerView;
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.scrollView];
    
}

- (void)creatHeaderView {

    QDHeaderView *view = [QDHeaderView headerView];
    view.detialModel = self.detailModel;
    
    self.scrollView.userInteractionEnabled = NO;
    [self.scrollView addSubview:view];
    
    self.scrollView.backgroundColor = [UIColor clearColor];
    
//    QDHeaderView *headerView = [QDHeaderView headerView];
//    headerView.detialModel = self.detailModel;
    
    
}


- (void)viewDidDisappear:(BOOL)animated {
    
    self.tableView.delegate = nil;
    self.tableView.dataSource = nil;
    
}

#warning !!!!!问题处
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    if (scrollView != self.scrollView) {
        
       
        if (scrollView.contentOffset.y < 72) {
            
            
            self.scrollView.contentOffset = self.tableView.contentOffset;
            
        }else {
            
            self.scrollView.contentOffset = CGPointMake(0, 71);
        }
        
        
    }
    
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataSource.count;
}

#warning -------Cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QDADDetailTableCell *cell = [QDADDetailTableCell adCellWithTableView:tableView];
    cell.adModel = self.dataSource[indexPath.section];
    
    return cell;
}

#warning ----Header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *botoomView;
    
    QDADModel *adModel = self.dataSource[section];
    
    if (adModel.title.length > 0) {
        
#warning +++++++需适配
        botoomView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
        
        UILabel *flag = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 5, 20)];
        flag.backgroundColor = [UIColor colorWithRed:0.000 green:0.471 blue:0.780 alpha:1.000];
        [botoomView addSubview:flag];
        
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 40)];
        
        lable.text = adModel.title;
        lable.textColor = [UIColor blackColor];
        [botoomView addSubview:lable];
        
        botoomView.backgroundColor = [UIColor colorWithRed:0.890 green:0.925 blue:0.941 alpha:1.000];
        
    }
    
    
    
    return botoomView;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}



- (void)requesstData {
    
    NSString *urlStr = [NSString stringWithFormat:@"%@/%@.json", BannAD_URL, self.contentStr];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        self.detailModel = [QDDtailModel detailModelWithDict:dict];
        
        self.dataSource = self.detailModel.article_sections;
        dispatch_async(dispatch_get_main_queue(), ^{
            
        [self creatHeaderView];
        [self.tableView reloadData];
            
            
        });
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        QDLOG(@"%@ failure:%@",[self class], error);
        
    }];
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QDADModel *adModel = self.dataSource[indexPath.section];
    
    return adModel.cellHeight.floatValue;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    QDADModel *adModel = self.dataSource[section];
    
    if (adModel.title.length > 0) {
    
    return 40;
        
}
    
    return 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
