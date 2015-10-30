//
//  QDScenicSpotModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDScenicSpotModel.h"

@implementation QDScenicSpotModel

+ (id)scenSpotModelWithDict:(NSDictionary *)dict {
    
    QDScenicSpotModel *scenSpotModel = [[QDScenicSpotModel alloc] initWithDictionary:dict error:nil];
    
    
    scenSpotModel.Id = dict[@"id"];
    scenSpotModel.poiStr = [NSString stringWithFormat:@"旅行地 %ld", (long)scenSpotModel.poi_count];
    
    return scenSpotModel;
    
}

@end
