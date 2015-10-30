//
//  QDBannerView.h
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QDBannerModel;
@interface QDBannerView : UIView

@property (nonatomic, copy)void(^btnBlock)(QDBannerModel *bannerModel, NSString *content);

+ (id)bannerView;

@end
