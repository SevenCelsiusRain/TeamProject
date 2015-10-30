//
//  QDNotesRootCell.h
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseTableCell.h"

@class QDCellModel;
@interface QDNotesRootCell : QDBaseTableCell
{
    QDCellModel *_model;
}

@property (nonatomic, strong) QDCellModel *model;

@end
