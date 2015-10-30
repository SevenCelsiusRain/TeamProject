//
//  QDTabBarController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTabBarController.h"
#import "QDNaviController.h"

#import "QDTravelNotesController.h"
#import "QDDestinationController.h"
#import "QDToolBoxController.h"
#import "QDPersonalController.h"
#import "QDOfflineController.h"

@interface QDTabBarController ()

@end

@implementation QDTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TabBarBackground"]];
    
    // 游记
    QDTravelNotesController *travelNotes = [[QDTravelNotesController alloc] init];
    [self addChildVc:travelNotes title:@"蝉游记" itemTitle:@"游记" image:@"TabBarIconFeaturedNormal" selImage:@"TabBarIconFeatured"];
    
    // 攻略
    QDDestinationController *destination = [[QDDestinationController alloc] init];
    [self addChildVc:destination title:@"旅行攻略" itemTitle:@"攻略" image:@"TabBarIconDestinationNormal" selImage:@"TabBarIconDestination"];
    
    // 工具箱
    QDToolBoxController *toolBox = [[QDToolBoxController alloc] init];
    [self addChildVc:toolBox title:@"旅行工具箱" itemTitle:@"工具箱" image:@"TabBarIconToolboxNormal" selImage:@"TabBarIconToolbox"];
    
    // 我的
    QDPersonalController *personal = [[QDPersonalController alloc] init];
    [self addChildVc:personal title:@"" itemTitle:@"我的" image:@"TabBarIconMyNormal" selImage:@"TabBarIconMy"];
    
    
    // 离线
    QDOfflineController *offline = [[QDOfflineController alloc] init];
    [self addChildVc:offline title:@"" itemTitle:@"离线" image:@"TabBarIconOfflineNormal" selImage:@"TabBarIconOffline"];
    
    
    
}


- (void)addChildVc:(UIViewController *)vc title:(NSString *)title itemTitle:(NSString *)itemTitle image:(NSString *)image selImage:(NSString *)selImage {
    
    vc.title = title;
    
    vc.tabBarItem.title = itemTitle;
    [vc.tabBarItem setImage:[[UIImage imageNamed:image] originalImage]];
    [vc.tabBarItem setSelectedImage:[[UIImage imageNamed:selImage] originalImage]];
    NSDictionary *selAttri = @{NSForegroundColorAttributeName:[UIColor colorWithRed:0.188 green:0.557 blue:0.765 alpha:1.000]};
    [vc.tabBarItem setTitleTextAttributes:selAttri forState:UIControlStateSelected];
    
    QDNaviController *nav = [[QDNaviController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
