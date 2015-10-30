//
//  QDBannerView.m
//  TripLovely
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 abc. All rights reserved.
//

#import "QDBannerView.h"
#import "AFNetworking.h"

#import "QDBannerModel.h"


#import "UIImageView+WebCache.h"

#define BTNTAG 100


@interface QDBannerView ()<UIScrollViewDelegate>

@property (nonatomic, copy) NSString *urlStr;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, strong) UIPageControl *pageCont;
@property (nonatomic, strong) UIScrollView *scrollView;


@end

@implementation QDBannerView

+ (id)bannerView {
    
    return [[self alloc] init];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    
    
        self.frame = newSuperview.bounds;
    self.height = 200;
    
        [self initData];
    
    
}

- (void)initData {
    
        _imageArray = [[NSMutableArray alloc] initWithCapacity:0];
        _dataSource = [[NSMutableArray alloc] initWithCapacity:0];
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:BANNER_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            for (NSDictionary *dict in array) {
                
                QDBannerModel *bannerModel = [QDBannerModel bannerModelWithDict:dict];
                
                [self.dataSource addObject:bannerModel];
                [self.imageArray addObject:dict[@"image_url"]];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self initView];
            });
            
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
        }];
        
}

#pragma mark - banner 设计
- (void)initView {
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    
    [self addSubview:self.scrollView];
    CGFloat btnY = 0;
    CGFloat btnW = self.scrollView.width;
    CGFloat btnH = self.scrollView.height;
    
    NSInteger num = self.imageArray.count;
    
    for (int i = 0; i < num + 2; i++) {
        
        CGFloat btnX = btnW * i;
        
        
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        if (i == 0) {
            
            [QDNetRequestFunction setImageWithButton:btn urlStr:self.imageArray[num - 1] plhImageType:PlhINilType];
            
        }else if (i == num + 1) {
            
            [QDNetRequestFunction setImageWithButton:btn urlStr:self.imageArray[0] plhImageType:PlhINilType];
            
        }else {
            
            [QDNetRequestFunction setImageWithButton:btn urlStr:self.imageArray[i - 1] plhImageType:PlhINilType];
            
            btn.tag = BTNTAG + i - 1;
        }
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
       
        self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX(btn.frame), btnH);
        [self.scrollView addSubview:btn];
    }
    
    self.pageCont = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height - 44, self.width, 44)];
    self.pageCont.numberOfPages = num;
    
//    self.pageCont.pageIndicatorTintColor = [UIColor greenColor];
    self.pageCont.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageCont.currentPage = 0;
    
    [self addSubview:self.pageCont];
    
    self.scrollView.contentOffset = CGPointMake(self.scrollView.width * 1, self.scrollView.height);
    
}

// btn 点击事件
- (void)btnClick:(UIButton *)button {
    
    if (self.btnBlock) {
        
        QDBannerModel *model = self.dataSource[button.tag - BTNTAG];
        self.btnBlock(model, model.content);
    }
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self aboutPage:scrollView];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    [self aboutPage:scrollView];
}

- (void)aboutPage:(UIScrollView *)scrollView {
    
    
    if(scrollView == self.scrollView) {
        
        CGFloat width = scrollView.frame.size.width;
        
        int pages = scrollView.contentOffset.x / width;
        
        if (pages == 0) {
            
            self.pageCont.currentPage = self.imageArray.count - 1;
            scrollView.contentOffset = CGPointMake(width * self.imageArray.count, 0);
            
        }else if (pages == self.imageArray.count + 1) {
            
            self.pageCont.currentPage = 0;
            scrollView.contentOffset = CGPointMake(width, 0);
            
        }else {
            
            self.pageCont.currentPage = pages - 1;
        }
        
        
    }
    
}



@end
