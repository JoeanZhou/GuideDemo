//
//  GuideController.m
//  Guide
//
//  Created by dajie on 15/1/27.
//  Copyright (c) 2015年 dajie. All rights reserved.
//

#import "GuideController.h"
#import "ZXGuideView.h"
#define RGBColor(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
@interface GuideController ()<UIScrollViewDelegate>
/** pageControl */
@property(nonatomic, weak)UIPageControl *pageControl;

@end

@implementation GuideController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZXGuideView *guide = [[ZXGuideView alloc] initWithFrame:self.view.bounds];
    guide.delegate = self;
    self.view.backgroundColor = RGBColor(17,165,19);
    [self.view addSubview:guide];
    
    //  添加pageController
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.9, 100, 20)];
    pageControl.center = CGPointMake(self.view.bounds.size.width * 0.5, self.view.bounds.size.height * 0.98);
    pageControl.numberOfPages = 4;
    _pageControl = pageControl;
    [self.view addSubview:pageControl];
}

#pragma mark - 监听scrollewView的滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    CGFloat x = scrollView.contentOffset.x;
    int page = x / self.view.bounds.size.width;
    _pageControl.currentPage = page;
    
}

@end
