//
//  QDHeaderView.h
//  TripLovely
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QDDtailModel;
@interface QDHeaderView : UITableViewCell

@property (nonatomic, strong)QDDtailModel *detialModel;

+ (id)headerView;

@end
