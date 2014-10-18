//
//  UIViewController+navigationItem.h
//  导航条分类
//
//  Created by admin on 14-10-9.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (navigationItem)


- (void)CustomNavigation:(NSString *)title titleColor:(UIColor *)titleColor textColor:(UIColor *)textColor leftBtn:(UIButton *)leftBtn rightBtn:(UIButton *)rightBtn;
@end
