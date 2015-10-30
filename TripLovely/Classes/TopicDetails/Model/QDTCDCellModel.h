//
//  QDTCDCellModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDTCDCellModel : QDBaseModel

@property (nonatomic,copy) NSString<Optional> *title;
@property (nonatomic,copy) NSString<Optional> *image_url;
@property (nonatomic,copy) NSString<Optional> *desc;

@property (nonatomic, assign) CGFloat image_width;
@property (nonatomic, assign) CGFloat image_height;
@property (nonatomic, strong) NSDictionary<Optional> *description_user_ids;
@property (nonatomic, strong) NSDictionary<Optional> *attraction;
@property (nonatomic, strong) NSDictionary<Optional> *note;

+ (id)tcdCellWithDict:(NSDictionary *)dict;

@end
