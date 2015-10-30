//
//  QDLoginController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDLoginController.h"

@interface QDLoginController ()

@property (nonatomic, strong) UITextField *emailField;
@property (nonatomic, strong) UITextField *passwordField;

@end

@implementation QDLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initView];
}


- (void)initView {
    
    self.emailField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    
    
    UIButton *weBoBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    UIButton *qqBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    
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
