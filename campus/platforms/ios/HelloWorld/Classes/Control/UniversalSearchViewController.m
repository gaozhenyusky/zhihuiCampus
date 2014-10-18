//
//  UniversalSearchViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-13.
//
//

#import "UniversalSearchViewController.h"
#import "MicroHospitalCell.h"
#import "MicroHospitalHandler.h"
#import "SearchWebViewViewController.h"

@interface UniversalSearchViewController ()<MicroHospitalHandlerDataSource, MicroHospitalHandlerDelegate> {
    NSArray *_imageArray;
    NSArray *_imageName;
    NSArray *_searchLink;
}

@end

@implementation UniversalSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initArray];
    [self createView];
}

- (void)initArray {
    _imageArray = @[@"wanneng.png", @"yingwen.png", @"huayu.png", @"dianziditu.png", @"caipu.png", @"tianqiyubao", @"suanming.png", @"xingzuo.png", @"meng.png", @"zaixianqianming.png", @"huafeichongzhi.png", @"kuaidichaxun.png", @"huochepaio.png", @"hangbang.png", @"qichepiao.png", @"xingmingcashi" ];
    _imageName = @[@"成语大全", @"英文名大全", @"花语大全", @"电子地图", @"菜谱大全", @"天气预报", @"免费算命", @"星座运势", @"周公解梦", @"在线签名设计", @"话费充值查询", @"快递查询", @"火车票查询", @"航班查询", @"汽车票查询", @"姓名测试"];
    _searchLink = @[@"http://tools.2345.com/chengyu/", // 成语大全
                    @"http://tools.2345.com/yule/ywm.htm", // 英文名大全
                    @"http://tools.2345.com/yule/flower.htm", // 花语大全
                    @"http://tools.2345.com/map.htm", // 电子地图
                    @"http://tools.2345.com/meishi/", // 菜谱大全
                    @"http://tianqi.2345.com/changsha/57687.htm", // 天气预报
                    @"http://tools.2345.com/suanming.htm", // 免费算命
                    @"http://tools.2345.com/xingzuoyc.htm", // 星座运势
                    @"http://tools.2345.com/zhgjm.htm", // 周公解梦
                    @"http://tools.2345.com/yule/qianming.htm", // 在线签名设计
                    @"https://auth.alipay.com/login/index.htm?goto=https%3A%2F%2Febppprod.alipay.com%2Frecharge%2Frecharge.htm", // 话费充值查询
                    @"http://tools.2345.com/kuaidi.htm", // 快递查询
                    @"http://tools.2345.com/lieche.htm", // 火车票查询
                    @"", // 航班查询
                    @"", // 汽车票查询
                    @"", // 姓名测试
                    
                    ];
}

- (void)createView {
    MicroHospitalHandler *view = [[MicroHospitalHandler alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64)];
    view.dataSource = self;
    view.delegate = self;
    view.spacing = 0;
    view.numberOfColumns = 2;
    [self.view addSubview:view];
    [view reloadData];
}

- (NSInteger)numberOFViewInMicroHospital:(MicroHospitalHandler *)MicroHospital {
    return _imageArray.count;
}

- (MicroHospitalCell *)microHospital:(MicroHospitalHandler *)microHospital cellAtIndex:(NSInteger)index {
    MicroHospitalCell *cell = [[MicroHospitalCell alloc] initWithFrame:self.view.bounds];


    cell.button.frame = CGRectMake(0, 0, self.view.frame.size.width/2,70);
    [cell.button addTarget:self action:@selector(didClick:) forControlEvents:UIControlEventTouchUpInside];
    cell.button.tag = index;
    cell.button.layer.borderWidth = 0.3;
    cell.button.layer.borderColor = [UIColor grayColor].CGColor;
    [cell.button setImage:[UIImage imageNamed:_imageArray[index]] forState:UIControlStateNormal];
    [cell.button setBackgroundImage:[UIImage imageNamed:@"universalSearch.png"] forState:UIControlStateHighlighted];
    [cell.button setTitle:_imageName[index] forState:UIControlStateNormal];
    [cell.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return cell;
}

- (CGFloat)microHospital:(MicroHospitalHandler *)microHospital cellHeigthAtIndex:(NSInteger)index {
    return 70;
}

- (void)didClick:(UIButton *)sender {
    
    
    SearchWebViewViewController *SWVVC = [[SearchWebViewViewController alloc] init];
    SWVVC.linkString = _searchLink[sender.tag];
    [self.navigationController pushViewController:SWVVC animated:YES];
}

- (void)microHospital:(MicroHospitalHandler *)microHospital didSelectedIndex:(NSInteger)index  {

    
}


@end
