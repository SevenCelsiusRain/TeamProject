//
//  QDDDetailCell.h
//  TripLovely
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseTableCell.h"


@class QDDDetailModel;
@interface QDDDetailCell : QDBaseTableCell

@property (nonatomic, strong) QDDDetailModel *dDetailModel;

+ (id)dDetailCellWithTableView:(UITableView *)tableView;

@end
