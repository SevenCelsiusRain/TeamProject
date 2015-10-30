//
//  QDTravelModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDTravelModel : QDBaseModel

@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *photos_count;
@property (nonatomic, copy)NSString *start_date;
@property (nonatomic, copy)NSString *end_date;
@property (nonatomic, copy)NSString *source;
@property (nonatomic, copy)NSString *front_cover_photo_url;

@property (nonatomic, strong)NSNumber *days;
@property (nonatomic, strong)NSNumber *level;
@property (nonatomic, strong)NSNumber *views_count;
@property (nonatomic, strong)NSNumber *comments_count;
@property (nonatomic, strong)NSNumber *likes_count;
@property (nonatomic, strong)NSNumber *featured;
@property (nonatomic, strong)NSDictionary *user;

@property (nonatomic, strong)NSNumber<Optional> *Id;
@property (nonatomic, copy) NSString<Optional> *desc;

+ (id)travelModelWithDict:(NSDictionary *)dict;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;


@end


