//
//  QDTCDetailsController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTCDetailsController.h"

#import "AFNetworking.h"

#import "QDTCDetailsModel.h"
#import "QDTCDetailCell.h"

@interface QDTCDetailsController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end

@implementation QDTCDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BckColor;
    
    [self initView];
    
}

- (void) initView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
}

- (NSArray *)dataSource {
    
    if (!_dataSource) {
        
        [self requestData];
        
    }
    
    return _dataSource;
    
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QDTCDetailCell *cell = [QDTCDetailCell tcDetailCellWithTableView:tableView];
    
    
    return cell;
    
}

- (void)requestData {
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *urlStr = [NSString stringWithFormat:TCDETAIL_URL, self.page];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        QDTCDetailsModel *model = [QDTCDetailsModel detailModelWithDict:dict];
        
        self.dataSource = model.article_sections;
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        QDLOG(@"%@ failure:%@", NSStringFromClass([self class]), error);
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
