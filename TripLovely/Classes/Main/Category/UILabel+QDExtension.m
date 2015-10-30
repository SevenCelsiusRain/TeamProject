//
//  UILabel+QDExtension.m
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "UILabel+QDExtension.h"

@implementation UILabel (QDExtension)

- (void)setTextColor:(UIColor *)color fontSize:(CGFloat)font {
    
    self.textColor = color;
    
    self.font = [UIFont systemFontOfSize:font];
    
}

- (void)setTextColor:(UIColor *)color boldFontSize:(CGFloat)font {
    
    self.textColor = color;
    self.font = [UIFont boldSystemFontOfSize:font];
    
}


@end
