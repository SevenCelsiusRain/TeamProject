//
//  QDNaviController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDNaviController.h"

@interface QDNaviController ()

@end

@implementation QDNaviController


+ (void)initialize {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor = [UIColor colorWithRed:0.071 green:0.537 blue:0.859 alpha:1.000];
    
    
    NSDictionary *titleAttri = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:20], NSForegroundColorAttributeName:[UIColor colorWithRed:0.718 green:0.969 blue:1.000 alpha:1.000]};
    
    [self.navigationBar setTitleTextAttributes:titleAttri];
    
    
//    self.s
    
}


#warning !!!!!!!! --- 写到 重写 push 方法，从而使所有界面 nav 的左右 item 相同
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    
    if (self.viewControllers.count > 0) {
        
        
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"CustomBarBackground"] forBarMetrics:UIBarMetricsDefault];
        
//         UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:@"BackBorderBarButton" style:UIBarButtonItemStyleDone target:self action:@selector(backPreviousCon)];
        
//        UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"NavBar_Share_Normal"] style:UIBarButtonItemStyleDone target:self action:@selector(shareAction)];
        
//        UIBarButtonItem *favItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"FavoriteBarButtonHighlight"] style:UIBarButtonItemStyleDone target:self action:@selector(favItemAction)];
        
//        UIBarButtonItem *offlineItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"OfflineBorderBarButton"] style:UIBarButtonItemStyleDone target:self action:@selector(offlineAction)];
        
//        UIBarButtonItem *commentItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"comment"] style:UIBarButtonItemStyleDone target:self action:@selector(commentAction)];
        
        
        UIBarButtonItem *leftItem = [UIBarButtonItem itemWithTarget:self action:@selector(backPreviousCon) image:@"BackBorderBarButton" highlightedImage:@"BackBorderBarButtonHighlight"];
        
        viewController.navigationItem.leftBarButtonItem = leftItem;
        

        UIBarButtonItem *shareItem = [UIBarButtonItem itemWithTarget:self action:@selector(shareAction) image:@"ShareBorderBarButton" highlightedImage:@"ShareBorderBarButtonHighlight"];
        

        UIBarButtonItem *favItem = [UIBarButtonItem itemWithTarget:self action:@selector(favItemAction) image:@"FavoriteBarButton" highlightedImage:@"FavoriteBarButtonHighlight"];
        

        UIBarButtonItem *offlineItem = [UIBarButtonItem itemWithTarget:self action:@selector(offlineAction) image:@"OfflineBorderBarButton" highlightedImage:@"OfflineBorderBarButtonHighlight"];
        

        UIBarButtonItem *commentItem = [UIBarButtonItem itemWithTarget:self action:@selector(commentAction) image:@"CommentBorderBarButton" highlightedImage:@"CommentBorderBarButtonHighlight"];
        
        viewController.navigationItem.rightBarButtonItems = @[commentItem, shareItem, favItem, offlineItem];
        
//        self.navigationBar.translucent = NO;
//
//        self.navigationBar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"CustomBarBackground"]];
//        self.navigationBar.layer.backgroundColor = [UIColor clearColor].CGColor;
//        self.navigationBar.tintColor = [UIColor whiteColor];
        
       
    }
    
    [super pushViewController:viewController animated:animated];
    
   
    
}

- (void)backPreviousCon {
    
    
    
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    [self popViewControllerAnimated:YES];
    
}


- (void)favItemAction {
    
    
}

- (void)shareAction {
    
    
}

- (void)offlineAction {
    
    
}

- (void)commentAction {
    
    
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
