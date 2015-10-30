//
//  QDFactoryCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDFactoryCell.h"

#import "QDCellModel.h"

#import "QDNotesRootCell.h"
#import "QDETNameCell.h"
#import "QDArtiCell.h"
#import "QDImgCell.h"

@implementation QDFactoryCell

+ (id)factoryCellWithTableView:(UITableView *)tableView model:(QDCellModel *)model {
    
    QDNotesRootCell *cell;
    
    
    
    if (!model.row_order) {
        
        cell = [QDETNameCell eTNameCellWithTableView:tableView];
        
        cell.model = model;
        
    }else {
        
        if (model.photo) {
            
            cell = [QDImgCell imgCellWithTableView:tableView];
            
            cell.model = model;
            
        }else {
            
            cell = [QDArtiCell artiCellWithTableView:tableView];
            cell.model = model;
            
        }
        
        
    }
    
    return cell;
    
}

@end
