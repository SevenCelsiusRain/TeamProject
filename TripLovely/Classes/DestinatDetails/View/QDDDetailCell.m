//
//  QDDDetailCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDDDetailCell.h"

#import "QDDDetailModel.h"

@interface QDDDetailCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (weak, nonatomic) IBOutlet UIButton *offlineBtn;

@property (weak, nonatomic) IBOutlet UILabel *chNameL;

@property (weak, nonatomic) IBOutlet UILabel *enNameL;
@property (weak, nonatomic) IBOutlet UIView *btomView;

@end

@implementation QDDDetailCell

+ (id)dDetailCellWithTableView:(UITableView *)tableView {
    
    
    return [self cellWithTableView:tableView];
}

- (void)setDDetailModel:(QDDDetailModel *)dDetailModel {
    
    _dDetailModel = dDetailModel;
    
    self.chNameL.text = dDetailModel.name_zh_cn;
    [self.chNameL setTextColor:[UIColor whiteColor] fontSize:20];
    
    self.enNameL.text = dDetailModel.name_en;
    [self.enNameL setTextColor:[UIColor colorWithRed:0.929 green:1.000 blue:0.988 alpha:1.000] fontSize:14];
    
    [QDNetRequestFunction setImageWithImageView:self.imgView urlStr:dDetailModel.image_url plhImageType:PlhINilType];
    
}

#warning -----攻略详情按钮
- (IBAction)notesBtnClick:(id)sender {
}

- (IBAction)tripBtnClick:(id)sender {
}
- (IBAction)traDestBtnClick:(id)sender {
}

- (IBAction)topicBtnClick:(id)sender {
}

- (IBAction)offlineBtnClick:(id)sender {
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.backgroundColor = [UIColor colorWithRed:0.929 green:0.937 blue:0.941 alpha:1.000];
    
    self.offlineBtn.layer.cornerRadius = 20;
    
    self.offlineBtn.clipsToBounds = YES;
    
    self.btomView.layer.borderWidth = 1;
    self.btomView.layer.borderColor = BORDER_COLOR.CGColor;

}



@end
