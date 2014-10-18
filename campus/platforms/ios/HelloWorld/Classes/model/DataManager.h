//
//  DataManager.h
//  HelloWorld
//
//  Created by admin on 14-10-13.
//
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

+ (instancetype)shareManager;
- (NSArray *)getData;

@end
