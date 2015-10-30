//
//  QDSectionModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDSectionModel : QDBaseModel

@property (nonatomic, copy) NSString *trip_date;

@property (nonatomic, assign) NSInteger updated_at;
@property (nonatomic, strong) NSDictionary<Optional> *destination;
@property (nonatomic, copy) NSString<Ignore> *day;
@property (nonatomic, strong) NSArray *nodes;

@property (nonatomic, strong) NSNumber<Optional> *Id;

@property (nonatomic, strong) NSMutableArray<Ignore> *cellArray;

+ (id)sectionModelWithDict:(NSDictionary *)dict array:(NSArray *)array;

@end
