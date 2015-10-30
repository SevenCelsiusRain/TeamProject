//
//  QDTCDetailsModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDTCDetailsModel : QDBaseModel

@property (nonatomic, strong) NSNumber<Optional> *Id;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image_url;

@property (nonatomic, assign) CGFloat comments_count;
@property (nonatomic, assign) CGFloat destination_id;
@property (nonatomic, assign) CGFloat commentable;
@property (nonatomic, assign) CGFloat current_user_favorite;
@property (nonatomic, assign) CGFloat updated_at;

@property (nonatomic, strong) NSArray *article_sections;

+ (id)detailModelWithDict:(NSDictionary *)dict;

@end
