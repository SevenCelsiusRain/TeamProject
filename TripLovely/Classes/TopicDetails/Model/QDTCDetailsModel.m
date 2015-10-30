//
//  QDTCDetailsModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTCDetailsModel.h"
#import "QDTCDCellModel.h"

@implementation QDTCDetailsModel

+ (id)detailModelWithDict:(NSDictionary *)dict {
    
    QDTCDetailsModel *model = [[QDTCDetailsModel alloc] initWithDictionary:dict error:nil];
    
    model.Id = dict[@"id"];
    
    NSMutableArray *dataM = [NSMutableArray array];
    
    for (NSDictionary *diction in model.article_sections) {
        
        
        QDTCDCellModel *cellModel = [QDTCDCellModel tcdCellWithDict:diction];
        
        [dataM addObject:cellModel];
        
    }
    
    model.article_sections = dataM;
    
    return model;
    
}

@end
