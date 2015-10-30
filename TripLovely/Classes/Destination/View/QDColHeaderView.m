//
//  QDColHeaderView.m
//  TripLovely
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDColHeaderView.h"

@interface QDColHeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *PlaceLable;

@end
@implementation QDColHeaderView

- (void)setContinent:(NSString *)continent {
    
    _continent = continent;
    self.PlaceLable.text = continent;
}
@end
