//
//  QDSectionModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDSectionModel.h"
#import "QDSecModel.h"

@implementation QDSectionModel

+ (id)sectionModelWithDict:(NSDictionary *)dict array:(NSArray *)array {
    
    QDSectionModel *model = [[QDSectionModel alloc] initWithDictionary:dict error:nil];
    
    NSMutableArray *dataM = [NSMutableArray array];
    
    model.cellArray = [NSMutableArray array];
    
    for (NSDictionary *diction in model.nodes) {
        
        QDSecModel *secModel = [QDSecModel secModelWithDict:diction array:array];
        
        
        [model.cellArray addObjectsFromArray:secModel.notes];
        [dataM addObject:secModel];
        
    }
    
    
    model.trip_date = [self handleTripDate:model.trip_date];
    
    model.day = [NSString stringWithFormat:@"DAY%@", dict[@"day"]];
    
    model.nodes = dataM;
    
    model.Id = dict[@"id"];
    
    return model;
    
}

+ (NSString *)handleTripDate:(NSString *)str {
    
    
    NSArray *array = [str componentsSeparatedByString:@"-"];
    
    str = [NSString stringWithFormat:@"%@年%@月%@日", array[0], array[1], array[2]];
    
    return str;
    
}


@end
