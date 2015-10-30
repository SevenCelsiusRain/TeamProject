//
//  QDImgCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDImgCell.h"

@interface QDImgCell ()

@property (weak, nonatomic) IBOutlet UIButton *starBtn;

@property (weak, nonatomic) IBOutlet UIButton *favBtn;

@property (weak, nonatomic) IBOutlet UIButton *comCbtn;
@property (weak, nonatomic) IBOutlet UILabel *descL;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation QDImgCell

+ (id)imgCellWithTableView:(UITableView *)tableView {
    
    
    
    return [self cellWithTableView:tableView];
}

- (void)setModel:(QDCellModel *)model {
    
    _model = model;
}


@end
