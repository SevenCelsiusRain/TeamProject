//
//  QDBaseTableCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBaseTableCell.h"

@implementation QDBaseTableCell

+ (id)cellWithTableView:(UITableView *)tableView {
    
    NSString *className = NSStringFromClass([self class]);
    
    UINib *nib = [UINib nibWithNibName:className bundle:nil];
    
    [tableView registerNib:nib forCellReuseIdentifier:className];
    
    QDBaseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
    
}

@end
