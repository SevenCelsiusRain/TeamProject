//
//  QDDDetailModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDDDetailModel : QDBaseModel

@property (nonatomic, strong) NSNumber<Optional> *Id;

@property(nonatomic, copy) NSString *name_zh_cn;
@property(nonatomic, copy) NSString *name_en;
@property(nonatomic, copy) NSString *image_url;

@property (nonatomic, assign) CGFloat poi_count;
@property (nonatomic, assign) CGFloat plans_count;
@property (nonatomic, assign) CGFloat articles_count;
@property (nonatomic, assign) CGFloat contents_count;
@property (nonatomic, assign) CGFloat destination_trips_count;
@property (nonatomic, assign) CGFloat locked;
@property (nonatomic, assign) CGFloat wiki_app_publish;
@property (nonatomic, assign) CGFloat updated_at;
@property (nonatomic, assign) CGFloat guides_count;

@property (nonatomic, strong) NSDictionary<Optional> *intro;
@property (nonatomic, strong) NSArray<Optional> *destination_contents;
@property (nonatomic, strong) NSArray<Optional> *weather;

+ (id)dDetailModelWithDict:(NSDictionary *)dict;

@end
