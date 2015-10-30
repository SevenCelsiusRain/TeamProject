//
//  QDADDetailTableCell.h
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseTableCell.h"

@class QDADModel;
@interface QDADDetailTableCell : QDBaseTableCell

@property (nonatomic, strong) QDADModel *adModel;

+ (id)adCellWithTableView:(UITableView *)tableView;

@end
