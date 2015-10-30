//
//  QDTravelCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTravelCell.h"

#import "QDTravelModel.h"

@interface QDTravelCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bckImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLable;

@property (weak, nonatomic) IBOutlet UILabel *descLable;

@property (weak, nonatomic) IBOutlet UIButton *userIconBtn;
@property (weak, nonatomic) IBOutlet UIButton *actbtn;

@end

@implementation QDTravelCell

+ (id)travelCellWithTableView:(UITableView *)tableView {
    
    
    return [self  cellWithTableView:tableView];
    
}


- (void)setTravelModel:(QDTravelModel *)travelModel {
    
    self.accessoryType = UITableViewCellAccessoryNone;
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.890 green:0.929 blue:0.953 alpha:1.000];
    
    _travelModel = travelModel;
    
    // 背景图片
    [QDNetRequestFunction setImageWithImageView:self.bckImageView urlStr:travelModel.front_cover_photo_url plhImageType:PlhIPlanCellType];
    
    // 标题
    self.nameLable.text = travelModel.name;
    
    self.nameLable.font = [UIFont systemFontOfSize:20];
    self.nameLable.textColor = [UIColor colorWithRed:1.000 green:0.984 blue:1.000 alpha:1.000];
    self.nameLable.numberOfLines = 0;
    
    // 概要
    self.descLable.text = travelModel.desc;
    self.descLable.font = [UIFont systemFontOfSize:14];
    self.descLable.textColor = [UIColor colorWithRed:0.792 green:0.827 blue:0.847 alpha:1.000];
    
    // 用户头像
    [QDNetRequestFunction setImageWithButton:self.userIconBtn urlStr:travelModel.user[@"image"] plhImageType:PlhIAvatarType];

    self.userIconBtn.layer.cornerRadius = 20;
    self.userIconBtn.clipsToBounds = YES;
}

@end
