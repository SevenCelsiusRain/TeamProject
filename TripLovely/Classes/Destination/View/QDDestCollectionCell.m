//
//  QDDestCollectionCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDDestCollectionCell.h"
#import "QDScenicSpotModel.h"

@interface QDDestCollectionCell ()

@property (weak, nonatomic) IBOutlet UIImageView *bckImageView;

@property (weak, nonatomic) IBOutlet UILabel *chName;
@property (weak, nonatomic) IBOutlet UILabel *enName;
@property (weak, nonatomic) IBOutlet UIButton *poiBtn;

@end

@implementation QDDestCollectionCell


- (void)setSecSpotModel:(QDScenicSpotModel *)secSpotModel {
    
    _secSpotModel = secSpotModel;
    self.chName.text = secSpotModel.name_zh_cn;
    [self.chName setTextColor:[UIColor colorWithRed:0.969 green:0.976 blue:0.980 alpha:1.000] fontSize:20];
    
    
    self.enName.text = secSpotModel.name_en;
    [self.enName setTextColor:[UIColor whiteColor] fontSize:15];
    
    [self.poiBtn setTitle:secSpotModel.poiStr forState:UIControlStateNormal];
    [self.poiBtn setBtnTextColor:[UIColor colorWithRed:0.902 green:0.925 blue:0.937 alpha:1.000] fontSize:12];
    
    self.poiBtn.backgroundColor = [UIColor colorWithRed:0.443 green:0.463 blue:0.475 alpha:0.8];
    self.poiBtn.layer.cornerRadius = 8;
    self.poiBtn.adjustsImageWhenHighlighted = NO;
    
    [QDNetRequestFunction setImageWithImageView:self.bckImageView urlStr:secSpotModel.image_url plhImageType:PlhIDestCoverMaskType];

}

@end
