//
//  NearbyViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-7.
//
//

#import "NearbyViewController.h"
#import "UIViewController+navigationItem.h"

@interface NearbyViewController ()

@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationItem];
    // Do any additional setup after loading the view.
}

#pragma mark - 创建导航条
- (void)setNavigationItem {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    leftBtn.tintColor = [UIColor whiteColor];
    //    [leftBtn setImage:[UIImage imageNamed:@"main_top_left_png"] forState:UIControlStateNormal];
    
    //    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    //    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    //    [rightBtn setImage:[UIImage imageNamed:@"main_top_right.png"] forState:UIControlStateNormal];
    
    
    [self CustomNavigation:@"附近" titleColor:[UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1] textColor:nil leftBtn:leftBtn rightBtn:nil];
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
