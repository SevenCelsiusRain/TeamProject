//
//  QDNetRequestFunction.h
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PlhImageType){
    
    PlhIAvatarIpadType,
    PlhIAvatarType,
    PlhIEmptyType,
    PlhIAvatarQQType,
    PlhIAvatarWeiboType,
    PlhIIconType,
    PlhIMyTripCellPhotoType,
    PlhIPhotoType,
    PlhIPlanCellType,
    PlhITripUserAvatarType,
    PlhIUpSellType,
    PlhIMyTripCellVideoType,
    PlhIDestCoverMaskType,
    PlhINilType,
    PlhIPlanMaskType
    
};

@interface QDNetRequestFunction : NSObject

+ (void)setImageWithImageView:(UIImageView *)imageView urlStr:(NSString *)urlStr plhImageType:(PlhImageType)type;

+ (void)setImageWithButton:(UIButton *)btn urlStr:(NSString *)urlStr plhImageType:(PlhImageType)type;

@end
