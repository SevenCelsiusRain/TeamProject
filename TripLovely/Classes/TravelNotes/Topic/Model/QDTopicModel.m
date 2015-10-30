//
//  QDTopicModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTopicModel.h"

@implementation QDTopicModel

+ (id)topicModelWithDict:(NSDictionary *)dict {
    
    QDTopicModel *model = [[QDTopicModel alloc] initWithDictionary:dict error:nil];
    
    model.Id = dict[@"id"];
    
    return model;
    
}

@end
