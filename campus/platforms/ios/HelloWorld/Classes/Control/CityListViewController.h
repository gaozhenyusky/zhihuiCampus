//
//  CityListViewController.h
//  HelloWorld
//
//  Created by admin on 14-10-9.
//
//

#import <UIKit/UIKit.h>
#import "HomeViewController.h"
#import "SignOnViewController.h"

@interface CityListViewController : UIViewController

@property (nonatomic, copy, readonly)NSArray *cityArray;
@property (nonatomic, copy, readonly)NSArray *provinceArray;
@property (nonatomic, strong)HomeViewController *homeViewController;
@property (nonatomic, strong)SignOnViewController *signOnViewController;
@end
