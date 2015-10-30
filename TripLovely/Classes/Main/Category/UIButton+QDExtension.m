//
//  UIButton+QDExtension.m
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "UIButton+QDExtension.h"

@implementation UIButton (QDExtension)

- (void)setBtnTextColor:(UIColor *)color fontSize:(CGFloat)font {
    
    [self setTitleColor:color forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:font];
    
}
@end
