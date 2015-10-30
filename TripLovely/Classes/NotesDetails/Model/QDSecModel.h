//
//  QDSecModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDSecModel : QDBaseModel

@property (nonatomic, strong) NSNumber<Ignore> *Id;

@property (nonatomic, assign) NSInteger row_order;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, assign) NSInteger lat;
@property (nonatomic, assign) NSInteger lng;
@property (nonatomic, assign) NSInteger updated_at;

@property (nonatomic, strong) NSArray *notes;

@property (nonatomic, copy) NSString<Optional> *entry_type;
@property (nonatomic, copy) NSString<Optional> *attraction_type;
@property (nonatomic, copy) NSString<Optional> *tips;
@property (nonatomic, strong) NSDictionary<Optional> *memo;


+ (id)secModelWithDict:(NSDictionary *)dict array:(NSArray *)array;
@end
