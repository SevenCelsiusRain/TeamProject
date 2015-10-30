//
//  QDDestModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDDestModel.h"

#pragma mark - 景点模型
#import "QDScenicSpotModel.h"

@implementation QDDestModel

+ (id)destModelWithDict:(NSDictionary *)dict {
    
    QDDestModel *destModel = [[QDDestModel alloc] initWithDictionary:dict error:nil];
    
    NSMutableArray *dataM = [NSMutableArray array];
    
    for (NSDictionary *diction in destModel.destinations) {
        
        QDScenicSpotModel *sceSpotModel = [QDScenicSpotModel scenSpotModelWithDict:diction];
        [dataM addObject:sceSpotModel];
        
    }
    destModel.destinations = dataM;
    
    
    destModel.continent = [self contientWithCatStr:destModel.category];
    
    
    return destModel;
    
}

+ (NSString *)contientWithCatStr:(NSString *)catStr {
    
    NSString *str;
    
    switch (catStr.integerValue) {
        case 1:
            
            str = @"亚洲";
            break;
        case 2:
            
            str = @"欧洲";
            break;
        case 3:
            
            str = @"美洲";
            break;
        case 99:
            
            str = @"台港澳";
            break;
        case 999:
            
            str = @"内地";
            break;
            
        default:
            break;
    }
    
    return str;
    
}


@end
