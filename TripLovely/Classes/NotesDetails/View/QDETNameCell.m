//
//  QDETNameCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDETNameCell.h"

@interface QDETNameCell ()

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@property (weak, nonatomic) IBOutlet UILabel *etNameL;

@property (weak, nonatomic) IBOutlet UIButton *starBtn;
@property (weak, nonatomic) IBOutlet UILabel *commentL;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *descL;
@property (weak, nonatomic) IBOutlet UIButton *localBtn;
@property (weak, nonatomic) IBOutlet UIButton *favBtn;
@property (weak, nonatomic) IBOutlet UIButton *comNBtn;

@end

@implementation QDETNameCell

+ (id)eTNameCellWithTableView:(UITableView *)tableView {
    
    
    return [self cellWithTableView:tableView];
}


- (void)setModel:(QDCellModel *)model {
    
    _model = model;
    
}

@end
