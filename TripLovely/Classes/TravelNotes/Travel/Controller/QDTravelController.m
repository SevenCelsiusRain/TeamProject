//
//  QDTravelController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTravelController.h"
#import "AFNetworking.h"

#import "QDTravelModel.h"
#import "QDTravelCell.h"
#import "QDBannerView.h"
#import "QDBanDetailsController.h"


#import "QDNotesDetailController.h"


@interface QDTravelController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataSource;

@end

@implementation QDTravelController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BckColor;
    
    
    
    [self creatTableView];
}


- (NSArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        self.page = 1;
        
        [self requestData];
        
    }
    return _dataSource;
    
}

- (void)requestData {
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%ld",TRAVEL_URL, self.page];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in array) {
            
            QDTravelModel *model = [QDTravelModel travelModelWithDict:dict];
            [self.dataSource addObject:model];
            
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        QDLOG(@"failure:%@", error);
        
    }];

    
}

- (void)creatTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.height = SCREEN_HEIGHT - 160;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = BckColor;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
#warning -----头部 banner 页面跳转
    QDBannerView *banner = [QDBannerView bannerView];
    [banner setBtnBlock:^(QDBannerModel *bannerModel, NSString *content) {
        
        QDBanDetailsController *bDvc = [[QDBanDetailsController alloc] init];
        bDvc.contentStr = content;
        [self.navigationController pushViewController:bDvc animated:YES];
        
    }];
    
    self.tableView.tableHeaderView = banner;
    
    [self.view addSubview:self.tableView];
    
   
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QDTravelCell *cell = [QDTravelCell travelCellWithTableView:tableView];
    cell.travelModel = self.dataSource[indexPath.row];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}

#warning ----游记二级页面跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    QDNotesDetailController *notesDetailVc = [[QDNotesDetailController alloc] init];
    [self.navigationController pushViewController:notesDetailVc animated:YES];
    
    QDTravelModel *model = self.dataSource[indexPath.row];
    notesDetailVc.urlStr = model.Id.stringValue;
    
    NSLog(@"%@", notesDetailVc.urlStr);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
