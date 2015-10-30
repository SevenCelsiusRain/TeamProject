//
//  QDNotesDetailController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDNotesDetailController.h"
#import "AFNetworking.h"

#import "QDFactoryCell.h"
#import "QDNotesRootCell.h"

#warning -----需完善 Model
#import "QDSectionModel.h"
#import "QDSecModel.h"
#import "QDCellModel.h"
#import "QDNotesModel.h"

@interface QDNotesDetailController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSArray *dataSource;

@end

@implementation QDNotesDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = BckColor;
    
     [self requestData];
    
    [self creatTableView];
    // Do any additional setup after loading the view.
}


//- (NSArray *)dataSource {
//    
//    if (!_dataSource) {
//        
//       
//        
//    }
//    
//    return _dataSource;
//}


- (void)creatTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.view addSubview:self.tableView];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 300;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    QDSectionModel *sectionModel = self.dataSource[section];
    
    UIView *btom = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 40)];
    
    UILabel *day = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 60, 30)];
    
    day.text = sectionModel.day;
    
    [day setTextColor:[UIColor colorWithRed:0.161 green:0.161 blue:0.165 alpha:1.000] fontSize:20];
    
    [btom addSubview:day];
    
    UILabel *date = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 150, 20)];
    date.text = sectionModel.trip_date;
    [date setTextColor:[UIColor colorWithRed:0.549 green:0.549 blue:0.557 alpha:1.000] fontSize:15];
    
    [btom addSubview:date];
    
    btom.backgroundColor = [UIColor colorWithRed:0.992 green:1.000 blue:1.000 alpha:1.000];
    return btom;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
   QDSectionModel *sectionModel = self.dataSource[indexPath.section];
    QDCellModel *cellModel = sectionModel.cellArray[indexPath.row];
    
    
    QDNotesRootCell *cell = [QDFactoryCell factoryCellWithTableView:tableView model:cellModel];
    
    cell.backgroundColor = [UIColor colorWithRed:0.949 green:0.949 blue:0.953 alpha:1.000];
    
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataSource.count;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    QDSectionModel *sectionModel = self.dataSource[section];
    
    
    return sectionModel.cellArray.count;
}


- (void)requestData {
    
    NSString *url = [NSString stringWithFormat:@"%@/%@.json", NOTES_URL, self.urlStr];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        QDNotesModel *notesModel = [QDNotesModel notesModelWithDict:dict];
        
        
        self.dataSource = notesModel.trip_days;
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
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
