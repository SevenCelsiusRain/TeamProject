//
//  QDDDetailModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDDDetailModel.h"

@implementation QDDDetailModel

+ (id)dDetailModelWithDict:(NSDictionary *)dict {
    
    
    QDDDetailModel *model = [[QDDDetailModel alloc] initWithDictionary:dict error:nil];
    
    model.Id = dict[@"id"];
    
    return model;
    
}

@end
