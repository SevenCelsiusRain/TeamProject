//
//  QDHeaderModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDBannerModel : QDBaseModel

@property (nonatomic, copy) NSString *position;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString *advert_type;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSNumber *rotation;

+ (id)bannerModelWithDict:(NSDictionary *)dict;

@end
