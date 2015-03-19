//
//  ZXGuideTool.m
//  引导页
//
//  Created by ZhouXu on 26/1/15.
//  Copyright (c) 2015年 ZhouXu. All rights reserved.
//

#import "ZXGuideTool.h"
#import "GuideController.h"
//#import "LoginController.h"

#define ZXVersionKey @"version"

@implementation ZXGuideTool
+ (void)chooseRootViewController:(UIWindow *)window{
    
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    NSString *versionKey = (__bridge NSString *)kCFBundleVersionKey;
    NSString *currentKey = dict[versionKey];
    //  获取之前存储的版本
    NSString *lastVesion = [[NSUserDefaults standardUserDefaults] objectForKey:ZXVersionKey];
        if ([currentKey isEqualToString:lastVesion] && [[NSUserDefaults standardUserDefaults] objectForKey:@"didClick"]) {  //  没有新的版本
#warning 跳转到主页面
//            [Navigator showLoginController];
    
        }else{  //  有新的版本跳转到引导页
            
            [[NSUserDefaults standardUserDefaults] setObject:currentKey forKey:ZXVersionKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            GuideController *guideVc = [[GuideController alloc] init];
            window.rootViewController = guideVc;
        }

}
@end
