//
//  QDHeaderView.m
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDHeaderView.h"

#import "QDDtailModel.h"

@interface QDHeaderView ()

@property (weak, nonatomic) IBOutlet UIImageView *bckImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@end

@implementation QDHeaderView

+ (id)headerView {
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)setDetialModel:(QDDtailModel *)detialModel {
    
    self.nameLable.text = detialModel.name;
    self.nameLable.textColor = [UIColor colorWithRed:0.796 green:0.831 blue:0.902 alpha:1.000];
    self.nameLable.font = [UIFont boldSystemFontOfSize:35];
    self.titleLable.text = detialModel.title;
    
    [self.titleLable setTextColor:[UIColor colorWithRed:0.761 green:0.847 blue:0.976 alpha:1.000] fontSize:20];
    
    [QDNetRequestFunction setImageWithImageView:self.bckImageView urlStr:detialModel.image_url plhImageType:PlhINilType];
    
}

@end
