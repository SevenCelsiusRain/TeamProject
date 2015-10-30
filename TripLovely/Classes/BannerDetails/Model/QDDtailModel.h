//
//  QDDtailModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDDtailModel : QDBaseModel

@property (nonatomic, copy) NSString<Optional> *Id;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger comments_count;
@property (nonatomic, assign) NSInteger current_user_favorite;
@property (nonatomic, assign) CGFloat updated_at;
@property (nonatomic, assign) NSNumber<Optional> *destination_id;
@property (nonatomic, assign) NSInteger commentable;

@property (nonatomic, strong) NSArray *article_sections;

+ (id)detailModelWithDict:(NSDictionary *)dict;

@end
