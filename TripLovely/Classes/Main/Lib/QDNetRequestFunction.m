//
//  QDNetRequestFunction.m
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDNetRequestFunction.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@implementation QDNetRequestFunction

+ (void)setImageWithImageView:(UIImageView *)imageView urlStr:(NSString *)urlStr plhImageType:(PlhImageType)type {
    
    UIImage *plhImage = [[self imageWithPlhImageType:type] originalImage];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    imageView.layer.cornerRadius = 6;
    imageView.clipsToBounds = YES;
    
    [imageView sd_setImageWithURL:url placeholderImage:plhImage];
    
}

+ (void)setImageWithButton:(UIButton *)btn urlStr:(NSString *)urlStr plhImageType:(PlhImageType)type {
    
    UIImage *plhImage = [self imageWithPlhImageType:type];
    
    NSURL *url = [NSURL URLWithString:urlStr];
    
    [btn sd_setBackgroundImageWithURL:url forState:UIControlStateNormal placeholderImage:plhImage];
    btn.adjustsImageWhenHighlighted = NO;
    
}


+ (UIImage *)imageWithPlhImageType:(PlhImageType)type {
    
    UIImage *plhImage;
    
    if (type == PlhIAvatarType) {
        
        plhImage = [UIImage imageNamed:@"AvatarPlaceholder"];
        
    }else if (type == PlhIEmptyType) {
        
        plhImage = [UIImage imageNamed:@"EmptyPlaceholder"];
        
    }else if (type == PlhIIconType) {
        
        plhImage = [UIImage imageNamed:@"icon_placeholder"];
        
    }else if (type == PlhIPhotoType) {
        
        plhImage = [UIImage imageNamed:@"PhotoPlaceholder"];
        
    }else if (type == PlhIUpSellType) {
        
        plhImage = [UIImage imageNamed:@"upSell_placeholder"];
        
    }else if (type == PlhIAvatarQQType) {
        
        plhImage = [UIImage imageNamed:@"AvatarPlaceholdQQ"];
        
    }else if (type == PlhIPlanCellType) {
        
        plhImage = [UIImage imageNamed:@"PlanCellPlaceHolder"];
        
    }else if (type == PlhIAvatarIpadType) {
        
        plhImage = [UIImage imageNamed:@"avatar_placehold_ipad"];
        
    }else if (type == PlhIAvatarWeiboType) {
        
        plhImage = [UIImage imageNamed:@"AvatarPlaceholdWeibo"];
        
    }else if (type == PlhITripUserAvatarType) {
        
        plhImage = [UIImage imageNamed:@"TripUserAvatarPlaceholder"];
        
    }else if (type == PlhIMyTripCellPhotoType) {
        
        plhImage = [UIImage imageNamed:@"MyTripCellPhotoPlaceholder"];
        
    }else if (type == PlhIMyTripCellVideoType) {
        
        plhImage = [UIImage imageNamed:@"MyTripCellVideoPlaceholder"];
    }else if (type == PlhIDestCoverMaskType) {
        
        plhImage = [UIImage imageNamed:@"DestinationCoverMask"];
    }else if (type == PlhINilType) {
        
        plhImage = nil;
    }else if (type == PlhIPlanMaskType) {
        
        plhImage = [UIImage imageNamed:@"PlanCoverMask"];
        
    }

    return plhImage;
    
}

@end
