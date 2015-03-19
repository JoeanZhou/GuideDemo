//
//  guideView.h
//  Guide
//
//  Created by dajie on 15/1/27.
//  Copyright (c) 2015年 dajie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXGuideView : UIScrollView
/** 记录是否点击了进入按钮 */
@property(assign, nonatomic, getter=isDidClick)BOOL didClick;
@end
