//
//  MyCampusViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-8.
//
//

#import "MyCampusViewController.h"
#import "MicroHospitalCell.h"
#import "MicroHospitalHandler.h"
#import "UIViewController+navigationItem.h"

@interface MyCampusViewController () <MicroHospitalHandlerDataSource, MicroHospitalHandlerDelegate> {
    NSArray *_imageArray;
    NSArray *_titleArray;
}

@end

@implementation MyCampusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageArray = @[@"main_one_one.png", @"main_one_two.png", @"main_one_three.png", @"main_one_four.png", @"main_one_five.png", @"main_one_six.png"];
    _titleArray = @[@"校园介绍", @"校园咨询", @"招生专线", @"最新公告", @"校园相册", @"我要吐槽"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationItem];
    [self createBetweenView];
    

    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"my_school.png"]];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 180);
    [self.view addSubview:imageView];
}

#pragma mark - 创建导航条
- (void)setNavigationItem {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    leftBtn.tintColor = [UIColor whiteColor];
    [leftBtn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    //    [leftBtn setImage:[UIImage imageNamed:@"main_top_left_png"] forState:UIControlStateNormal];
    
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
//    [rightBtn setImage:[UIImage imageNamed:@"main_top_right.png"] forState:UIControlStateNormal];
    

    [self CustomNavigation:@"我的校园" titleColor:[UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1] textColor:nil leftBtn:leftBtn rightBtn:rightBtn];
}

- (void)leftBtnClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
    //    NSArray *array = @[];
    
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
    NSLog(@"点击了：%ld", index);
    switch (index) {
        case 0: {

        }
            break;
            
        default:
            break;
    }
    
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
