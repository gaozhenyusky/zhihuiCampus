//
//  Utility.h
//  HelloWorld
//
//  Created by admin on 14-10-11.
//
//

#import <Cordova/CDV.h>

@interface Utility : CDVPlugin
- (void)getCoordinate:(CDVInvokedUrlCommand*)command;
- (void)newWorked:(CDVInvokedUrlCommand*)command;
- (void)shouldShowActivity:(CDVInvokedUrlCommand*)command;

@end
