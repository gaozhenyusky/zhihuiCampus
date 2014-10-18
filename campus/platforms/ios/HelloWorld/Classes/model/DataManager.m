//
//  DataManager.m
//  HelloWorld
//
//  Created by admin on 14-10-13.
//
//

#import "DataManager.h"
#import "FMDatabase.h"

@interface  DataManager () {
    NSMutableArray *_cityArray;
    NSMutableArray *_provinceArray;
    NSString *_cityDBPath;
}

@end

@implementation DataManager


+ (instancetype)shareManager {
    static DataManager *shareInstance = nil;
    static dispatch_once_t oncetoken;
    dispatch_once(&oncetoken, ^{
        shareInstance = [[DataManager alloc] init];
    });
    return shareInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        _cityDBPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"s3db"];
        [self queryData];
    }
    return self;
}

#pragma mark -从数据库获取城市数据
- (void)queryData {
    _cityArray = [NSMutableArray array];
    _provinceArray = [NSMutableArray array];
    FMDatabase * db = [FMDatabase databaseWithPath:_cityDBPath];
    if ([db open]) {
        NSString * sql = @"select * from city";
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            NSData * data = [rs dataForColumn:@"name"];
            NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            NSString *name = [[NSString alloc]initWithData:data encoding:enc];
            [_cityArray addObject:name];
            //            NSLog(@"user id = %d, name = %@", userId, name);
        }
        
        NSString *sql3 = @"select * from province";
        FMResultSet *rs3 = [db executeQuery:sql3];
        while ([rs3 next]) {
            NSData * data = [rs3 dataForColumn:@"name"];
            NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
            NSString *name = [[NSString alloc]initWithData:data encoding:enc];
            [_provinceArray addObject:name];
            //            NSLog(@"user id = %d, name = %@", userId, name);
        }
        [db close];
    }
}

- (NSArray *)getData {
    NSMutableArray  *array = [NSMutableArray arrayWithObjects:_provinceArray, _cityArray, nil];
    return array;
}
@end
