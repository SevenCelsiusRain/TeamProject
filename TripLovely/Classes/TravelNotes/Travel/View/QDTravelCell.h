//
//  QDTravelCell.h
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseTableCell.h"

@class QDTravelModel;
@interface QDTravelCell : QDBaseTableCell

@property (nonatomic, strong)QDTravelModel *travelModel;

+ (id)travelCellWithTableView:(UITableView *)tableView;
@end
