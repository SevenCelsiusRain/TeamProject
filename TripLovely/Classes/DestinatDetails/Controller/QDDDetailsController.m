//
//  QDDDetailsController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDDDetailsController.h"

#import "AFNetworking.h"
#import "QDDDetailCell.h"
#import "QDDDetailModel.h"

@interface QDDDetailsController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation QDDDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *shareItem = [UIBarButtonItem itemWithTarget:self action:@selector(shareAction) image:@"ShareBorderBarButton" highlightedImage:@"ShareBorderBarButtonHighlight"];
    
    self.navigationItem.rightBarButtonItems = @[shareItem];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NavigationBarShadow"] forBarMetrics:UIBarMetricsDefault];
    
    [self initView];
    
}

- (void) shareAction {
    
    NSLog(@"+++++++");
    
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
        [self requestData];
        
    }
    
    return _dataSource;
}

- (void)initView {
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.height = SCREEN_HEIGHT - 46;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.929 green:0.937 blue:0.941 alpha:1.000];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QDDDetailCell *cell = [QDDDetailCell dDetailCellWithTableView:tableView];
    
    cell.dDetailModel = self.dataSource[indexPath.row];
    
    return cell;
    
}

#warning +++++++ 需适配
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    return 300;
}


- (void)requestData {
   
    NSString *urlStr = [NSString stringWithFormat:DDETAIL_URL, self.page];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in array) {
            
            
            QDDDetailModel *model = [QDDDetailModel dDetailModelWithDict:dict];
            
            [self.dataSource addObject:model];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            
            [self.tableView reloadData];
            
        });
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
