//
//  Utility.m
//  HelloWorld
//
//  Created by admin on 14-10-11.
//
//

#import "Utility.h"
#import "AppDelegate.h"


@interface Utility(){

}
@end
@implementation Utility

//获取经纬度
- (void)getCoordinate:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult *pluginResult = nil;
    NSString *myarg = [command.arguments objectAtIndex:0];

       if (myarg == nil) {
//        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[NSString stringWithFormat:@"latitude: %f ,longtitue: %f",latitude,longitude]];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"arg was null"];
    }

}

//活动指示器是否显示
- (void)shouldShowActivity:(CDVInvokedUrlCommand *)command
{
    UIActivityIndicatorView * activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicatorView.frame = CGRectMake(120, 150, 80, 80);

    CDVViewController *view = [[CDVViewController alloc] init];
    view.customActivityIndicatorView = activityIndicatorView;
    
}

//调起一个新的页面
- (void)newWorked:(CDVInvokedUrlCommand *)command
{
    CDVViewController *view = [[CDVViewController alloc] init];
    view.view.backgroundColor= [UIColor clearColor];
    NSString *str = command.arguments[0];
    [view.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    UITabBarController *tabBar = (UITabBarController *)delegate.window.rootViewController.presentedViewController;
    UINavigationController *homeNav = (UINavigationController *)tabBar.selectedViewController;
    NSLog(@"%@", homeNav);
    [homeNav pushViewController:view animated:YES];

    
}


@end
