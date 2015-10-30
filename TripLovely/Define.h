//
//  Define.h
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#ifndef TripLovely_Define_h
#define TripLovely_Define_h

#define BANNER_URL @"http://chanyouji.com/api/adverts.json?name=app_featured_banner_ios"

// 国家攻略
#define DEST_URL @"http://chanyouji.com/api/destinations.json"

// 攻略详情
#define DDETAIL_URL @"http://chanyouji.com/api/destinations/%ld.json"

// 广告
#define BannAD_URL @"http://chanyouji.com/api/articles"

// 游记
#define TRAVEL_URL @"http://chanyouji.com/api/trips/featured.json?page="

// 游记详情
#define NOTES_URL @"http://chanyouji.com/api/trips"

// 专题
#define TOPIC_URL @"http://chanyouji.com/api/articles.json?destination_id=55&page="

// 专题详情
#define TCDETAIL_URL @"http://chanyouji.com/api/articles/%ld.json?page=1"

// segment Rect 参数
#define SegMX 10
#define SegMY 70
#define SegMH 37
#define SegMW (SCREEN_WIDTH - 2 * SegMX)

#define BORDER_COLOR  [UIColor colorWithRed:0.644 green:0.652 blue:0.658 alpha:1.000]

#endif
