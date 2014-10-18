//
//  HomeViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-7.
//
//

#import "HomeViewController.h"
#import "CycleScrollView.h"
#import "MicroHospitalCell.h"
#import "MicroHospitalHandler.h"
#import "MyCampusViewController.h"
#import "UIViewController+navigationItem.h"
#import "MacroUtils.h"
#import "FMDatabase.h"
#import "CityListViewController.h"
#import <Cordova/CDV.h>
#import "Utility.h"
#import "UniversalSearchViewController.h"
#import <MAMapKit/MAMapKit.h>
#import "AppDelegate.h"
#import "DataManager.h"



@interface HomeViewController ()<MicroHospitalHandlerDataSource, MicroHospitalHandlerDelegate, MAMapViewDelegate> {
//    MyScrollView *_bannerView;
    UIPageControl *_pageControl;
    NSArray *_imageArray;
    NSArray *_titleArray;

//    NSString *_cityPath;
    NSMutableArray *_cityArray;
    NSMutableArray *_provinceArray;
    
    MAMapView *_mapView;
    CLLocationManager *_locationManager;
    double latitude;
    double longitude;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArray = @[@"main_one.png", @"main_two.png", @"main_three.png", @"main_four.png", @"main_five.png", @"main_six.png", @"main_seven.png", @"main_eight.png", @"main_nine.png", @"main_ten.png"];
    _titleArray = @[@"我的校园", @"学子服务", @"学友尊享", @"万能查询", @"校区联盟", @"学长专区", @"职场专栏", @"手游下载", @"帮助中心", @"配送中心"];
    
    
    // 自动调节滚动视图，这样scrollView才不会乱滚
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    _cityPath = [[NSBundle mainBundle] pathForResource:@"city" ofType:@"s3db"];
//    NSLog(@"dbbb : %@", _cityPath);
    NSArray *array = [NSArray array];
    array = [[DataManager shareManager] getData];
    _provinceArray = array[0];
    _cityArray = array[1];
    
    self.view.backgroundColor = [UIColor whiteColor];
//    [self queryData];
    [self createHeaderScrollView];
    [self createBetweenView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self initLocation];
    [self setNavigationItem];
}
#pragma mark - 定位
- (void)initLocation {
    _locationManager = [[CLLocationManager alloc] init];
    [_locationManager requestAlwaysAuthorization];
    [_locationManager requestWhenInUseAuthorization];
    _mapView = [[MAMapView alloc] init];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;

 
}

- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation
{
    latitude = userLocation.coordinate.latitude;
    longitude = userLocation.coordinate.longitude;
    
    CLLocation *location = userLocation.location;
    CLLocationCoordinate2D location2D = location.coordinate;
    CLLocationDegrees latitude = location2D.latitude;
    CLLocationDegrees longitude = location2D.longitude;
    NSLog(@"latitude : %f  longitude: %f",latitude,longitude);
}

/*!
 @brief 定位失败后，会调用此函数
 @param mapView 地图View
 @param error 错误号，参考CLError.h中定义的错误号
 */
- (void)mapView:(MAMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location fail: %@", error);
}

#pragma mark - 创建头部滚动视图
- (void)createHeaderScrollView {

    CycleScrollView *cycle = [[CycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 180) animationDuration:4];
    NSArray *colorArray = @[[UIColor cyanColor],[UIColor blueColor],[UIColor greenColor],[UIColor yellowColor],[UIColor purpleColor]];
    NSMutableArray *viewsArray = [NSMutableArray array];
    for (int i = 0; i < 5; i ++) {
//        UIView *v = [[UIView alloc] initWithFrame:cycle.bounds];
//        v.backgroundColor = (UIColor *)[colorArray objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:cycle.bounds];
        imageView.image = [UIImage imageNamed:@"bannar_one.png"];
        [viewsArray addObject:imageView];
    }
    cycle.fetchContentViewAtIndex = ^UIView *(NSInteger pageIndex){
        return viewsArray[pageIndex];
    };
    cycle.totalPagesCount = ^NSInteger(void){
        return 5;
    };
    cycle.TapActionBlock = ^(NSInteger pageIndex){
//        NSLog(@"点击了第%ld个",(long)pageIndex);
    };
    [self.view addSubview:cycle];
    
}




#pragma mark - 创建导航条
- (void)setNavigationItem {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 60, 30);
    [leftBtn setTitle:@"长沙" forState:UIControlStateNormal];
    if (_cityName != nil) {
        [leftBtn setTitle:_cityName forState:UIControlStateNormal];
    }
    leftBtn.tintColor = [UIColor whiteColor];
    leftBtn.contentHorizontalAlignment =  UIControlContentHorizontalAlignmentLeft;
    //    [leftBtn setImage:[UIImage imageNamed:@"main_top_left_png"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(cityListClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
    [rightBtn setImage:[UIImage imageNamed:@"main_top_right.png"] forState:UIControlStateNormal];
    

    [self CustomNavigation:@"智慧校园" titleColor:[UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1] textColor:nil leftBtn:leftBtn rightBtn:rightBtn];
}

- (void)cityListClick:(UIButton *)sender {
    CityListViewController *CLVC = [[CityListViewController alloc] init];
//    CLVC.cityArray = _cityArray;
//    CLVC.provinceArray = _provinceArray;
    CLVC.homeViewController = self;
    [self presentViewController:CLVC animated:YES completion:nil];
}


#pragma mark - 
- (void)createBetweenView {
    MicroHospitalHandler *microHospital = [[MicroHospitalHandler alloc] initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, self.view.frame.size.height-300)];
    microHospital.dataSource = self;
    microHospital.delegate = self;
//        microHospital.edgeInset = UIEdgeInsetsMake(0, 0, 10, 10);
    microHospital.spacing = 0;
    microHospital.numberOfColumns = 4;
    [self.view addSubview:microHospital];
    [microHospital reloadData];
}

- (NSInteger)numberOFViewInMicroHospital:(MicroHospitalHandler *)MicroHospital {
    return _imageArray.count;
}

- (MicroHospitalCell *)microHospital:(MicroHospitalHandler *)microHospital cellAtIndex:(NSInteger)index {
    MicroHospitalCell *cell = [[MicroHospitalCell alloc] initWithFrame:self.view.bounds];

    cell.imageView.frame = CGRectMake(10, 10, 60, 60);
    
    cell.imageView.image = [UIImage imageNamed:_imageArray[index]];
    cell.label.frame = CGRectMake(0, 50, 80, 60);
    cell.label.textAlignment = NSTextAlignmentCenter;
    cell.label.font = [UIFont systemFontOfSize:12];
    cell.label.text = _titleArray[index];
    
    
    return cell;
}

- (CGFloat)microHospital:(MicroHospitalHandler *)microHospital cellHeigthAtIndex:(NSInteger)index {
    return 90;
}

- (void)microHospital:(MicroHospitalHandler *)microHospital didSelectedIndex:(NSInteger)index  {
    NSLog(@"点击了：%ld", (long)index);
    switch (index) {
        case 0: {
            MyCampusViewController *MCVC = [[MyCampusViewController alloc] init];
            [self.navigationController pushViewController:MCVC animated:YES];
            }
            break;
        case 3:{
            UniversalSearchViewController *USVC = [[UniversalSearchViewController alloc] init];
            AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            
            delegate.window.rootViewController.presentedViewController.hidesBottomBarWhenPushed = YES;
            
            [self.navigationController pushViewController:USVC animated:YES];
        }
            break;
        default: {
//            Utility *utility = [[Utility alloc] init];
//            CDVInvokedUrlCommand *command = [[CDVInvokedUrlCommand alloc] initWithArguments:@[@"http://www.baidu.com"] callbackId:nil className:nil methodName:nil];
//
//            [utility newWorked:command];
//            [utility getCoordinate:command];
//            [utility shouldShowActivity:command];
        }
            break;
    }
    
}

#pragma mark -从数据库获取城市数据

//- (void)queryData {
//    debugMethod();
//    _cityArray = [NSMutableArray array];
//    _provinceArray = [NSMutableArray array];
//    FMDatabase * db = [FMDatabase databaseWithPath:_cityPath];
//    if ([db open]) {
//        NSString * sql = @"select * from city";
//        FMResultSet * rs = [db executeQuery:sql];
//        while ([rs next]) {
//            int userId = [rs intForColumn:@"id"];
//            NSData * data = [rs dataForColumn:@"name"];
//            NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//            NSString *name = [[NSString alloc]initWithData:data encoding:enc];
//            [_cityArray addObject:name];
//            debugLog(@"user id = %d, name = %@", userId, name);
////            NSLog(@"user id = %d, name = %@", userId, name);
//        }
//
//        NSString *sql3 = @"select * from province";
//        FMResultSet *rs3 = [db executeQuery:sql3];
//        while ([rs3 next]) {
//            int userId = [rs3 intForColumn:@"id"];
//            NSData * data = [rs3 dataForColumn:@"name"];
//            NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
//            NSString *name = [[NSString alloc]initWithData:data encoding:enc];
//            [_provinceArray addObject:name];
////            debugLog(@"user id = %d, name = %@", userId, name);
////            NSLog(@"user id = %d, name = %@", userId, name);
//        }
//
//        
//        [db close];
//    }
//    
//}





@end
