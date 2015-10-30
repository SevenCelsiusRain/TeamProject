//
//  QDHeaderModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBannerModel.h"

@implementation QDBannerModel

+ (id)bannerModelWithDict:(NSDictionary *)dict {
    
    QDBannerModel *bannerModel = [[self alloc] initWithDictionary:dict error:nil];
    
    return bannerModel;
    
}
@end
