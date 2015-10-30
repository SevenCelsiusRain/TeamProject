//
//  UIBarButtonItem+QDExtension.h
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (QDExtension)

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highlightedImage:(NSString *)highImage;

@end
