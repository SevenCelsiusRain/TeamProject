//
//  QDTopicCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTopicCell.h"
#import "QDTopicModel.h"

@interface QDTopicCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;


@end

@implementation QDTopicCell

+ (id)topicCellWithTableView:(UITableView *)tableView {
    
    
    return [self cellWithTableView:tableView];
}

- (void)setTopicModel:(QDTopicModel *)topicModel {
    
    self.backgroundColor = [UIColor colorWithRed:0.894 green:0.929 blue:0.949 alpha:1.000];
    
    _topicModel = topicModel;
    
    self.nameLable.text = topicModel.name;
    
    [self.nameLable setTextColor:[UIColor colorWithRed:0.980 green:1.000 blue:0.996 alpha:1.000] boldFontSize:20];
    
    self.titleLable.text = topicModel.title;
    
    [self.titleLable setTextColor:[UIColor colorWithRed:0.925 green:0.925 blue:0.929 alpha:1.000] boldFontSize:14];
    
    [QDNetRequestFunction setImageWithImageView:self.imgView urlStr:topicModel.image_url plhImageType:PlhIPlanMaskType];
    
}


@end
