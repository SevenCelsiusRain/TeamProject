//
//  QDTravelModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTravelModel.h"

@implementation QDTravelModel


+ (id)travelModelWithDict:(NSDictionary *)dict {
    
    QDTravelModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    model.Id = dict[@"id"];
    
    [model.start_date stringByReplacingOccurrencesOfString:@"-" withString:@"."];
    
    model.desc = [NSString stringWithFormat:@"%@/%@天/%@图", model.start_date, model.days, model.photos_count];
    
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    
}
@end
