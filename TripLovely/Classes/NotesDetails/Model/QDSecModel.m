//
//  QDSecModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDSecModel.h"
#import "QDCellModel.h"

@implementation QDSecModel

+ (id)secModelWithDict:(NSDictionary *)dict array:(NSArray *)array {
    
    QDSecModel *model = [[QDSecModel alloc] initWithDictionary:dict error:nil];
    
    model.Id = dict[@"id"];
    
    NSMutableArray *dataM = [NSMutableArray array];
    for (NSDictionary *diction in model.notes) {
        
        QDCellModel *cellModel = [QDCellModel cellModelWithDict:diction];
        
        if (cellModel.row_order) {
            
            cellModel.comment = dict[@"comment"];
            
        }
        
        cellModel.entry_id = dict[@"entry_id"];
        cellModel.entry_name = dict[@"entry_name"];
        cellModel.user_entry = dict[@"user_entry"];
        
        [self handel:array cellModel:cellModel];
        
        [dataM addObject:cellModel];
        
    }
    
    model.notes = dataM;
    return model;
    
}


+ (void) handel:(NSArray *)array  cellModel:(QDCellModel *)cellModel {
    
    for (NSDictionary *dict in array) {
        
        if ([cellModel.Id isEqual:dict[@"id"]]) {
            
            cellModel.likModel = [LikesModel likesModelWithDict:dict];
            
        }
        
    }
    
}

@end
