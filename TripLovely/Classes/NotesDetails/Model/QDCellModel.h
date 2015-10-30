//
//  QDCellModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@class LikesModel;
@interface QDCellModel : QDBaseModel

@property (nonatomic, strong) NSNumber<Ignore> *Id;
@property (nonatomic, assign) NSInteger updated_at;
@property (nonatomic, assign) NSInteger row_order;

@property (nonatomic, strong) NSNumber<Optional> *col;
@property (nonatomic, copy) NSString<Optional> *layout;
@property (nonatomic, copy) NSString<Optional> *desc;
@property (nonatomic, strong) NSDictionary<Optional> *photo;

@property (nonatomic, copy) NSString<Ignore> *comment;
@property (nonatomic, strong) NSNumber<Ignore> *user_entry;
@property (nonatomic, strong) NSString<Ignore> *entry_name;
@property (nonatomic, strong) NSNumber<Ignore> *entry_id;

@property (nonatomic, strong) LikesModel<Ignore> *likModel;


+ (id)cellModelWithDict:(NSDictionary *)dict;
@end

@interface LikesModel : QDBaseModel

@property (nonatomic, strong) NSNumber<Ignore> *Id;

@property (nonatomic, assign) CGFloat comments_count;
@property (nonatomic, assign) CGFloat likes_count;
@property (nonatomic, assign) NSInteger current_user_like;
@property (nonatomic, assign) NSInteger current_user_comment;

+ (id)likesModelWithDict:(NSDictionary *)dict;

@end

