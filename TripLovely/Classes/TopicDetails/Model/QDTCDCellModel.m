//
//  QDTCDCellModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTCDCellModel.h"

@implementation QDTCDCellModel


+ (id)tcdCellWithDict:(NSDictionary *)dict {
    
    
    QDTCDCellModel *model = [[QDTCDCellModel alloc] initWithDictionary:dict error:nil];
    
    model.desc = dict[@"description"];
    return model;
    
}

@end
