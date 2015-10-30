//
//  QDTopicController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTopicController.h"
#import "AFNetworking.h"
#import "QDTopicCell.h"

#import "QDTopicModel.h"
#import "QDTCDetailsController.h"

@interface QDTopicController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation QDTopicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BckColor;
   
    [self initView];
    
    [self aboutRefresh];
    
}

- (void)aboutRefresh {
    
    
    __weak typeof(self) ws = self;
    
    
    [_tableView addRefreshHeaderViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        
        double delayInSeconds = 2.0;
        
        dispatch_time_t delayInNanoSeconds = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC);
        dispatch_after(delayInNanoSeconds, dispatch_get_main_queue(), ^{
            
            ws.page = 1;
            
            [ws.tableView reloadData];
            
            [ws.tableView headerEndRefreshingWithResult:JHRefreshResultSuccess];
            
        });
        
    }];
    
    [_tableView addRefreshFooterViewWithAniViewClass:[JHRefreshCommonAniView class] beginRefresh:^{
        
        double delay = 2.0;
        
        dispatch_time_t delayNano = dispatch_time(DISPATCH_TIME_NOW, delay *NSEC_PER_SEC);
        
        dispatch_after(delayNano, dispatch_get_main_queue(), ^{
            
            [ws.tableView reloadData];
            
            [ws.tableView footerEndRefreshing];
            
        });
        
    }];
    

    
}

- (void)initView {
    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.height = SCREEN_HEIGHT - 160;
    
    [self.view addSubview:self.tableView];
    
}

- (NSMutableArray *)dataSource {
    
    if (!_dataSource) {
        
        _dataSource = [NSMutableArray array];
        
        self.page = 1;
        
        [self requestData];
    }
    
    return _dataSource;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QDTopicCell *cell = [QDTopicCell topicCellWithTableView:tableView];
    
    cell.topicModel = self.dataSource[indexPath.row];
    
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 200;
}


#warning ----专题详情跳转出
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QDTCDetailsController *tcDetailsVc = [[QDTCDetailsController alloc] init];
    
    QDTopicModel *model = self.dataSource[indexPath.row];
    
    tcDetailsVc.page = model.Id.integerValue;
    
    [self.navigationController pushViewController:tcDetailsVc animated:YES];
    
}


- (void)requestData {
    
    
    NSString *urlStr = [NSString stringWithFormat:@"%@%ld", TOPIC_URL, self.page];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in array) {
            
            QDTopicModel *topicModel = [QDTopicModel topicModelWithDict:dict];
            
            [self.dataSource addObject:topicModel];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
             [self.tableView reloadData];
            
        });
        
       
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        QDLOG(@"%@ failure:%@", NSStringFromClass([self class]), error);
        
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
