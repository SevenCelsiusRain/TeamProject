//
//  QDArtiCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDArtiCell.h"

@interface QDArtiCell ()
@property (weak, nonatomic) IBOutlet UILabel *descL;
@property (weak, nonatomic) IBOutlet UIButton *localBtn;
@property (weak, nonatomic) IBOutlet UIButton *favBtn;
@property (weak, nonatomic) IBOutlet UIButton *comBtn;



@end

@implementation QDArtiCell

+ (id)artiCellWithTableView:(UITableView *)tableView {
    
    
    return [self cellWithTableView:tableView];
}


- (void)setModel:(QDCellModel *)model {
    
    _model = model;
    
    
}

@end
