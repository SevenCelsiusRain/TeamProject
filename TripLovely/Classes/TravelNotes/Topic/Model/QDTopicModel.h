//
//  QDTopicModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDTopicModel : QDBaseModel

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGFloat destination_id;
@property (nonatomic, assign) CGFloat updated_at;

@property (nonatomic, strong) NSNumber<Optional> *Id;

+ (id)topicModelWithDict:(NSDictionary *)dict;

@end
