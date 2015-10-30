//
//  QDNotesModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDNotesModel : QDBaseModel

@property (nonatomic, strong) NSNumber<Optional> *Id;

@property (nonatomic, assign) CGFloat photos_count;
@property (nonatomic, assign) CGFloat level;
@property (nonatomic, assign) CGFloat privacy;
@property (nonatomic, assign) CGFloat front_cover_photo_id;
@property (nonatomic, assign) CGFloat views_count;
@property (nonatomic, assign) CGFloat comments_count;
@property (nonatomic, assign) CGFloat likes_count;
@property (nonatomic, assign) CGFloat favorites_count;
@property (nonatomic, assign) CGFloat serial_next_id;
@property (nonatomic, assign) CGFloat updated_at;
@property (nonatomic, assign) CGFloat current_user_favorite;



@property (nonatomic, strong) NSArray *trip_days;
@property (nonatomic, strong) NSDictionary *user;
@property (nonatomic , strong) NSArray *notes_likes_comments;

@property (nonatomic, strong) NSNumber<Optional> *serial_id;
@property (nonatomic, strong) NSNumber<Optional> *serial_position;

@property (nonatomic, copy) NSString<Optional> *password;
@property (nonatomic, copy) NSString<Optional> *upload_token;
@property (nonatomic, copy) NSString<Optional> *start_date;
@property (nonatomic, copy) NSString<Optional> *end_date;
@property (nonatomic, copy) NSString<Optional> *state;
@property (nonatomic, copy) NSString<Optional> *source;
@property (nonatomic, copy) NSString<Optional> *name;
@property (nonatomic, copy) NSString<Optional> *front_cover_photo_url;

+ (id)notesModelWithDict:(NSDictionary *)dict;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;

@end
