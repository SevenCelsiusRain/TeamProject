//
//  UIView+QDFastFrame.m
//  WeiBo
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "UIView+QDFastFrame.h"

@implementation UIView (QDFastFrame)

@dynamic x, y, width, height, minX, maxX, minY, maxY, midX, midY, size, origin;

// 重写x
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x {
    return self.frame.origin.x;
}

// 重写y
- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y {
    return self.frame.origin.y;
}

// 重写width
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width {
    return self.frame.size.width;
}

// 重写height
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height {
    return self.frame.size.height;
}

// 重写minX
- (CGFloat)minX {
    return CGRectGetMinX(self.frame);
}
// 重写maxX
- (CGFloat)maxX {
    return CGRectGetMaxX(self.frame);
}
// 重写minY
- (CGFloat)minY {
    return CGRectGetMinY(self.frame);
}
// 重写maxY
- (CGFloat)maxY {
    return CGRectGetMaxY(self.frame);
}

// 重写midX
- (CGFloat)midX {
    return CGRectGetMidX(self.frame);
}
// 重写midY
- (CGFloat)midY {
    return CGRectGetMidY(self.frame);
}

- (CGFloat)centerX {
    return CGRectGetMidX(self.bounds);
}

- (CGFloat)centerY {
    return CGRectGetMidY(self.bounds);
}


- (void)setSize:(CGSize)size {
    
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
    
}

- (CGSize)size {
    
    return self.frame.size;
}

- (void)setOrigin:(CGPoint)origin {
    
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin {
    
    return self.frame.origin;
}

@end
