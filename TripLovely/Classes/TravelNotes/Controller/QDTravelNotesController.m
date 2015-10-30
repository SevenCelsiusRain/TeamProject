//
//  QDTravelNotesController.m
//  TripLovely
//
//  Created by qianfeng on 15/10/21.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDTravelNotesController.h"

#warning ---测试用，需完善
#import "QDTopicController.h"
#import "QDTravelController.h"
#import "QDCustomSegment.h"

@interface QDTravelNotesController ()

@property (nonatomic, strong) QDCustomSegment *segment;

@property (nonatomic, strong) QDTopicController *topic;
@property (nonatomic, strong) QDTravelController *travel;

@end

@implementation QDTravelNotesController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning ++++++
    self.view.backgroundColor = BckColor;
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(test) image:@"SettingBarButton" highlightedImage:@"SettingBarButtonHighlight"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(test2) image:@"NavBar_Search_Normal" highlightedImage:@"NavBar_Search_Pressed"];
    
    
    [self initView];
    
    
}

- (QDTopicController *)topic {
    
    if (!_topic) {
        
        QDTopicController *topic = [[QDTopicController alloc] init];
        
        topic.view.origin = CGPointMake(0, 115);
        
        _topic = topic;
    }
    
    return _topic;
}

- (QDTravelController *)travel {
    
    if (!_travel) {
        
        QDTravelController *travel = [[QDTravelController alloc] init];
        
        travel.view.origin = CGPointMake(0, 115);
        
        _travel = travel;
    }
    return _travel;
}

#warning ---segment 需完善
- (void)initView {
    
    NSArray *items = [NSArray arrayWithObjects:@"游记", @"专题", nil];
    
    [QDCustomSegment segmentWithInstalView:self.view Items:items fontSize:20 selectIndex:^(NSInteger selectedSegmentIndex) {
        
        switch (selectedSegmentIndex) {
            case 0:{
                
                [self.view addSubview:self.travel.view];
                
                [self addChildViewController:self.travel];
                
            }
                break;
            case 1:
            {
                
                [self.view addSubview:self.topic.view];
                [self addChildViewController:self.topic];
                
                
            }
                break;
            default:
                break;
        }

        
    }];
    
    
    
}


- (void)test {
    
    
    NSLog(@"+++++");
}
- (void)test2 {
    
    
    NSLog(@"-----");
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
