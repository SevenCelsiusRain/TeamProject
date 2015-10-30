//
//  QDDestModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDDestModel : QDBaseModel

@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) NSArray *destinations;

@property (nonatomic, strong) NSString<Optional> *continent;

+ (id)destModelWithDict:(NSDictionary *)dict;
@end
