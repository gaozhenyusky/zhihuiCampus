//
//  UIViewController+navigationItem.m
//  导航条分类
//
//  Created by admin on 14-10-9.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "UIViewController+navigationItem.h"

@implementation UIViewController (navigationItem)

- (void)CustomNavigation:(NSString *)title titleColor:(UIColor *)titleColor textColor:(UIColor *)textColor leftBtn:(UIButton *)leftBtn rightBtn:(UIButton *)rightBtn
{
    UIGraphicsBeginImageContext(CGSizeMake(self.view.frame.size.width, 44));;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [titleColor set];
    CGContextAddRect(context, CGRectMake(0, 0, self.view.frame.size.width, 44));
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGContextRelease(context);
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.text = title;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:20];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = textColor;
    if (textColor == nil) {
        label.textColor = [UIColor whiteColor];
    }
    self.navigationController.navigationItem.titleView = label;
    self.navigationItem.titleView = label;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

@end
