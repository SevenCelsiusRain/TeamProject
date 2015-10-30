//
//  QDCellModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDCellModel.h"

@implementation QDCellModel

+ (id)cellModelWithDict:(NSDictionary *)dict {
    
    QDCellModel *model = [[QDCellModel alloc] initWithDictionary:dict error:nil];
    
    model.col = dict[@"col"];
    
    model.Id = dict[@"id"];
    model.desc = dict[@"description"];
    return model;
}
@end

@implementation LikesModel

+ (id)likesModelWithDict:(NSDictionary *)dict {
    
    LikesModel *likModel = [[LikesModel alloc] initWithDictionary:dict error:nil];
    
    likModel.Id = dict[@"id"];
    
    return likModel;
    
}

@end
