//
//  QDADDetailTableCell.m
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDADDetailTableCell.h"

#import "QDADModel.h"

@interface QDADDetailTableCell ()

@property (weak, nonatomic) IBOutlet UILabel *descLable;

@end

@implementation QDADDetailTableCell

+ (id)adCellWithTableView:(UITableView *)tableView {
    
    return [self cellWithTableView:tableView];
}

- (void)setAdModel:(QDADModel *)adModel {
    
    _adModel = adModel;
    
    _descLable.text = adModel.desc;
    
    self.descLable.frame = adModel.descFrame.CGRectValue;
    
    self.backgroundColor = [UIColor colorWithRed:0.894 green:0.929 blue:0.949 alpha:1.000];
}

- (void)drawRect:(CGRect)rect {
#warning -----Banner 详情分隔线
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    
    //上分割线，
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    CGContextStrokeRect(context, CGRectMake(5, -1, rect.size.width - 10, 5));
    
    //下分割线
//    CGContextSetStrokeColorWithColor(context, [UIColor colorWithPatternImage:[UIImage imageNamed:@"DottedSeparator"]].CGColor);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextStrokeRect(context, CGRectMake(5, rect.size.height, rect.size.width - 10, 15));
//
    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
//    CGContextFillRect(context, rect);
//    
//    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:0xE2/255.0f green:0xE2/255.0f blue:0xE2/255.0f alpha:1].CGColor);
//    CGContextStrokeRect(context, CGRectMake(0, rect.size.height - 1, rect.size.width, 1));
    
    
    
    
}

@end
