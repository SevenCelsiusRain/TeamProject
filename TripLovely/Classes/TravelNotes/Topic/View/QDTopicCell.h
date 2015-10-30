//
//  QDTopicCell.h
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseTableCell.h"

@class QDTopicModel;
@interface QDTopicCell : QDBaseTableCell

@property (nonatomic, strong) QDTopicModel *topicModel;

+ (id)topicCellWithTableView:(UITableView *)tableView;
@end
