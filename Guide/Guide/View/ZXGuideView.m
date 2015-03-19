//
//  guideView.m
//  Guide
//
//  Created by dajie on 15/1/27.
//  Copyright (c) 2015年 dajie. All rights reserved.
//

#import "ZXGuideView.h"
#define ZXPageCount 4

@interface ZXGuideView ()
@property(nonatomic, weak)UIButton *btn;
@end

@implementation ZXGuideView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(self.bounds.size.width * ZXPageCount, 0);
        self.showsHorizontalScrollIndicator = NO;
        self.pagingEnabled = YES;
        self.bounces = NO;
        
        [self addViews];
        
    }
    return self;
}

#pragma mrak - 添加ImageView
- (void)addViews{
    for (int i = 0; i < ZXPageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"pic_0%d", i + 1]];
        [self addSubview:imageView];
    }
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    _btn = btn;
    [self addSubview:btn];
}

#pragma mark - 点击立即体验
#warning 点击按钮跳转控制器
- (void)start{
    self.didClick = YES;
    NSString *isStart = [NSString stringWithFormat:@"%d",self.didClick];
    [[NSUserDefaults standardUserDefaults] setObject:isStart forKey:@"didClick"];
    [[NSUserDefaults standardUserDefaults] synchronize];
//    [Navigator showLoginController];

}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    for (int i = 0; i < ZXPageCount; i++) {
        UIImageView *imageView = self.subviews[i];
        CGFloat y = (168 / 1334.0) * self.bounds.size.height;
        imageView.frame = CGRectMake(i * self.bounds.size.width, y, self.bounds.size.width, self.bounds.size.height - 2 * y);
    }
    [_btn sizeToFit];
    _btn.center = CGPointMake(self.bounds.size.width * 0.5 + (ZXPageCount - 1) * self.bounds.size.width, self.bounds.size.height * (1190 / 1334.0));
}

@end
