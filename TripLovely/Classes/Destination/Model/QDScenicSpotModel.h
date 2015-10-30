//
//  QDScenicSpotModel.h
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseModel.h"

@interface QDScenicSpotModel : QDBaseModel

@property (nonatomic, strong) NSNumber<Optional> *Id;
@property (nonatomic, copy) NSString<Optional> *poiStr;

@property (nonatomic, copy) NSString *name_zh_cn;
@property (nonatomic, copy) NSString *name_en;
@property (nonatomic, copy) NSString *image_url;

@property (nonatomic, assign) NSInteger poi_count;


/**
 *  地理位置
 */
@property (nonatomic, assign) CGFloat lat;
@property (nonatomic, assign) CGFloat lng;

/**
 *  更新时间
 */
@property (nonatomic, assign) NSInteger updated_at;

+ (id)scenSpotModelWithDict:(NSDictionary *)dict;

@end
