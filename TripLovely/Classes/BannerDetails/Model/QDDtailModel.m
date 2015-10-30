//
//  QDDtailModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDDtailModel.h"
#import "QDADModel.h"

@implementation QDDtailModel

+ (id)detailModelWithDict:(NSDictionary *)dict {
    
    QDDtailModel *detailModel = [[QDDtailModel alloc] initWithDictionary:dict error:nil];
    
    detailModel.Id = dict[@"id"];
    
    
    NSMutableArray *dataM = [NSMutableArray array];
    
    for (NSDictionary *diction in detailModel.article_sections) {
        
        QDADModel *adModel = [QDADModel adModelWithDict:diction];
        
        [dataM addObject:adModel];
    }
    
    detailModel.article_sections = dataM;
    return detailModel;
    
}

@end
