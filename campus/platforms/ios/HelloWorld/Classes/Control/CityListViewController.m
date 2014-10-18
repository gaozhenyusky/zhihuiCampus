//
//  CityListViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-9.
//
//

#import "CityListViewController.h"
#import "DataManager.h"

@interface CityListViewController () <UITableViewDataSource, UITableViewDelegate> {
    UITableView *_tableView;
    NSArray *_totalArray;
    
    NSInteger _btnTag;
}

@end

@implementation CityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
    
    // 获取数据库中的数据
    NSArray *array = [[DataManager shareManager] getData];
    _provinceArray = array[0];
    _cityArray = array[1];
    
    [self initArray];
    [self createTableView];

}

- (void)initArray {
    _btnTag = -1;
    NSArray *cityArray0 = [_cityArray subarrayWithRange:NSMakeRange(0, 1)]; // 北京市 1
    NSArray *cityArray1 = [_cityArray subarrayWithRange:NSMakeRange(1, 1)]; // 天津市 1
    NSArray *cityArray2 = [_cityArray subarrayWithRange:NSMakeRange(2, 11)]; // 河北省 11
    NSArray *cityArray3 = [_cityArray subarrayWithRange:NSMakeRange(13, 11)]; // 山西省 11
    NSArray *cityArray4 = [_cityArray subarrayWithRange:NSMakeRange(24, 12)]; // 内蒙古 12
    NSArray *cityArray5 = [_cityArray subarrayWithRange:NSMakeRange(36, 14)]; // 辽宁省 14
    NSArray *cityArray6 = [_cityArray subarrayWithRange:NSMakeRange(50, 9)]; // 吉林省 9
    NSArray *cityArray7 = [_cityArray subarrayWithRange:NSMakeRange(59, 13)]; // 黑龙江 13
    NSArray *cityArray8 = [_cityArray subarrayWithRange:NSMakeRange(72, 2)]; // 上海市 2
    NSArray *cityArray9 = [_cityArray subarrayWithRange:NSMakeRange(74, 13)]; // 江苏省 13
    NSArray *cityArray10 = [_cityArray subarrayWithRange:NSMakeRange(87, 11)]; // 浙江省 11
    NSArray *cityArray11 = [_cityArray subarrayWithRange:NSMakeRange(98, 17)]; // 安徽省 17
    NSArray *cityArray12 = [_cityArray subarrayWithRange:NSMakeRange(115, 9)]; // 福建省 9
    NSArray *cityArray13 = [_cityArray subarrayWithRange:NSMakeRange(124, 11)]; // 江西省 11
    NSArray *cityArray14 = [_cityArray subarrayWithRange:NSMakeRange(135, 17)]; // 山东省 17
    NSArray *cityArray15 = [_cityArray subarrayWithRange:NSMakeRange(152, 17)]; // 河南省 18
    NSArray *cityArray16 = [_cityArray subarrayWithRange:NSMakeRange(169, 14)]; // 湖北省 14
    NSArray *cityArray17 = [_cityArray subarrayWithRange:NSMakeRange(183, 14)]; // 湖南省 14
    NSArray *cityArray18 = [_cityArray subarrayWithRange:NSMakeRange(197, 21)]; // 广东省 21
    NSArray *cityArray19 = [_cityArray subarrayWithRange:NSMakeRange(218, 14)]; // 广西 14
    NSArray *cityArray20 = [_cityArray subarrayWithRange:NSMakeRange(232, 3)]; // 海南省 3
    NSArray *cityArray21 = [_cityArray subarrayWithRange:NSMakeRange(235, 3)]; // 重庆市 3
    NSArray *cityArray22 = [_cityArray subarrayWithRange:NSMakeRange(238, 21)]; // 四川省 21
    NSArray *cityArray23 = [_cityArray subarrayWithRange:NSMakeRange(259, 9)]; // 贵州省 9
    NSArray *cityArray24 = [_cityArray subarrayWithRange:NSMakeRange(268, 16)]; // 云南省 16
    NSArray *cityArray25 = [_cityArray subarrayWithRange:NSMakeRange(284, 7)]; // 西藏 7
    NSArray *cityArray26 = [_cityArray subarrayWithRange:NSMakeRange(291, 10)]; // 陕西省 10
    NSArray *cityArray27 = [_cityArray subarrayWithRange:NSMakeRange(301, 14)]; // 甘肃省 14
    NSArray *cityArray28 = [_cityArray subarrayWithRange:NSMakeRange(315, 8)]; // 青海省 8
    NSArray *cityArray29 = [_cityArray subarrayWithRange:NSMakeRange(323, 5)]; // 宁夏 5
    NSArray *cityArray30 = [_cityArray subarrayWithRange:NSMakeRange(328, 15)]; // 新疆 15
    NSArray *cityArray31 = [_cityArray subarrayWithRange:NSMakeRange(343, 1)]; // 台湾省 1
    NSArray *cityArray32 = [_cityArray subarrayWithRange:NSMakeRange(344, 1)]; // 香港 1
    NSArray *cityArray33 = [_cityArray subarrayWithRange:NSMakeRange(345, 1)]; // 澳门 1
    _totalArray = [NSArray arrayWithObjects:cityArray0, cityArray1, cityArray2, cityArray3, cityArray4, cityArray5, cityArray6, cityArray7, cityArray8, cityArray9, cityArray10, cityArray11, cityArray12, cityArray13, cityArray14, cityArray15, cityArray16, cityArray17, cityArray18, cityArray19, cityArray20, cityArray21, cityArray22, cityArray23, cityArray24, cityArray25, cityArray26, cityArray27, cityArray28, cityArray29, cityArray30, cityArray31, cityArray32, cityArray33, nil];
}

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableHeaderView = [self createTableHeaderView];
    [self.view addSubview:_tableView];
}

- (UIView *)createTableHeaderView {
    UIView *V = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    V.backgroundColor = [UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1];

    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 80, V.frame.size.height);
//    leftBtn.backgroundColor = [UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1];
    [leftBtn setTitle:@"返回" forState:UIControlStateNormal];
    [leftBtn setTitle:@"返回" forState:UIControlStateHighlighted];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    leftBtn.titleLabel.tintColor =[UIColor blackColor];
    [leftBtn addTarget:self action:@selector(backHomaPage:) forControlEvents:UIControlEventTouchUpInside];
    [V addSubview:leftBtn];
    
    return V;
}

- (void)backHomaPage:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource、UITableViewDelegate方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%d", section);
    if (_btnTag == section) {
        return [_totalArray[section] count];
    } else {
        return 0;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _provinceArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIButton *sectionButton = [[UIButton alloc] initWithFrame:self.view.bounds];
    [sectionButton setTitle:_provinceArray[section] forState:UIControlStateNormal];
    sectionButton.tag = section;
//    sectionButton.backgroundColor = [UIColor colorWithRed:112/255.0 green:112/255.0 blue:112/255.0 alpha:1];
    sectionButton.backgroundColor = [UIColor whiteColor];
//    sectionButton.alpha = 1;
    sectionButton.layer.borderWidth = 0.2;
    sectionButton.layer.cornerRadius = 2;
    [sectionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sectionButton addTarget:self action:@selector(sectionButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    return sectionButton;
}

- (void)sectionButtonClick:(UIButton *)sender {
    NSLog(@"点击了第%ld个section", (long)sender.tag);
    _btnTag = sender.tag;
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:indentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = _totalArray[indexPath.section][indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.homeViewController.cityName = _totalArray[indexPath.section][indexPath.row];
    self.signOnViewController.cityName = _totalArray[indexPath.section][indexPath.row];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
