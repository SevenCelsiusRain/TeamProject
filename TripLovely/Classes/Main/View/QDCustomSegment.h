//
//  QDCustomSegment.h
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QDCustomSegment : UIView

@property (nonatomic, copy) NSArray *viewControllers;

+ (void)segmentWithInstalView:(UIView *)insView Items:(NSArray *)items fontSize:(CGFloat)font selectIndex:(void (^)(NSInteger selectedSegmentIndex))selectIndex;

@end
