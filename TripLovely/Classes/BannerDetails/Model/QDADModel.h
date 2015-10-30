//
//  QDADModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDADModel : QDBaseModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString<Optional> *desc;
@property (nonatomic, assign) NSInteger image_width;
@property (nonatomic, assign) NSInteger image_height;
@property (nonatomic, strong) NSDictionary *description_user_ids;

@property (nonatomic, strong) NSValue<Ignore> *cellFrame;
@property (nonatomic, strong) NSValue<Ignore> *descFrame;
@property (nonatomic, strong) NSNumber<Ignore> *cellHeight;

+ (id)adModelWithDict:(NSDictionary *)dict;
@end
