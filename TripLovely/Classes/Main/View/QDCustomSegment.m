//
//  QDCustomSegment.m
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDCustomSegment.h"

#define SEGTAG 50

@interface QDCustomSegment ()

@property (nonatomic, copy) void(^segBlock)(NSInteger selectedSegmentIndex);

@property (nonatomic, strong) UIImageView *selImgView;

@end

@implementation QDCustomSegment

+ (void)segmentWithInstalView:(UIView *)insView Items:(NSArray *)items fontSize:(CGFloat)font selectIndex:(void (^)(NSInteger selectedSegmentIndex))selectIndex {
    
   
    
    QDCustomSegment *segment = [[self alloc] initWithFrame:CGRectMake(SegMX, SegMY, SegMW, SegMH)];
    
    
#warning ---生命周期问题，需要让 segment 执行 block 前添加到父视图上
     [insView addSubview:segment];
    
    UIImageView *bckImage = [[UIImageView alloc] initWithFrame:segment.bounds];
    
    bckImage.image = [UIImage imageNamed:@"LYSegmentedSliderControlBackground"];
    [segment addSubview:bckImage];
    
    CGFloat btnY = 0;
    CGFloat btnW = SegMW/items.count;
    CGFloat btnH = SegMH;
    
    segment.selImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, btnY, btnW, btnH)];
    segment.selImgView.image = [UIImage imageNamed:@"LYSegmentedSliderControlSelected"];
    [segment addSubview:segment.selImgView];
    
    for (int i = 0; i < items.count; i++) {
        
        CGFloat btnX = btnW * i;
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        
        [btn setTitle:items[i] forState:UIControlStateNormal];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:font];
        [btn setTitleColor:[UIColor colorWithRed:0.325 green:0.592 blue:0.757 alpha:1.000] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithRed:0.318 green:0.325 blue:0.325 alpha:1.000] forState:UIControlStateNormal];
        
        btn.tag = SEGTAG + i;
        
        [btn addTarget:segment action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [segment addSubview:btn];
        
    }
    
#warning -- 注意生命周期
    segment.segBlock = selectIndex;
    
    UIButton *button = (UIButton *)[segment viewWithTag:SEGTAG];
    [segment btnAction:button];
    
   
}

- (void)btnAction:(UIButton *)btn {
    
    if (btn.selected) {
        
        btn.selected = NO;
        
    }else {
        
        btn.selected = YES;
    }
    
    if (self.segBlock) {
        
        self.segBlock(btn.tag - SEGTAG);
    }
    
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.selImgView.x = btn.width * (btn.tag - SEGTAG);
        self.selImgView.alpha = 0.5;
        


        
    } completion:^(BOOL finished) {
        
        if (finished) {
            
            [UIView animateWithDuration:0.2 animations:^{
                
                self.selImgView.alpha = 1.0;
                
            } completion:nil];
        }
        
    }];
    
}



@end
