//
//  QDADModel.m
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDADModel.h"

@implementation QDADModel


+ (id)adModelWithDict:(NSDictionary *)dict {
    
    QDADModel *adModel = [[QDADModel alloc] initWithDictionary:dict error:nil];
    
    adModel.desc = dict[@"description"];
    
    
#warning +++++需适配
    
    CGFloat descX = 10;
    CGFloat descY = 10;
    CGFloat descW = 340;
    
    NSDictionary *descAttri = @{NSFontAttributeName:[UIFont systemFontOfSize:17], NSForegroundColorAttributeName:[UIColor colorWithRed:0.388 green:0.396 blue:0.404 alpha:1.000], NSKernAttributeName:@10};

    
    CGSize size = [adModel.desc boundingRectWithSize:CGSizeMake(340, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:descAttri context:nil].size;
    
    CGFloat descH = size.height;
    CGRect descFrame = CGRectMake(descX, descY, descW, descH);
    adModel.descFrame = [NSValue valueWithCGRect:descFrame];
    
    adModel.cellHeight = [NSNumber numberWithFloat:size.height + 20];
    
    return adModel;
    
}
@end
