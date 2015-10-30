//
//  UIImage+QDOriginal.m
//  WeiBo
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "UIImage+QDOriginal.h"

@implementation UIImage (QDOriginal)

- (UIImage *)originalImage {
    
    UIImage *image = self;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    return image;
}
@end
