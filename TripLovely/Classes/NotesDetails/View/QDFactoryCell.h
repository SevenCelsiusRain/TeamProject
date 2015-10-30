//
//  QDFactoryCell.h
//  TripLovely
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class QDCellModel;
@interface QDFactoryCell : NSObject

+ (id)factoryCellWithTableView:(UITableView *)tableView model:(QDCellModel *)model;

@end
