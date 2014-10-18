//
//  MyViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-7.
//
//

#import "MyViewController.h"
#import "MyTableViewCellImage.h"
#import "SettingViewController.h"
#import "UIViewController+navigationItem.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_personalTableView;
    NSArray *_titleArray;
    UIImageView *_personalImageView;
}
@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTableView];
    [self setNavigationItem];
}
#pragma mark - 创建导航条
- (void)setNavigationItem {
//    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    leftBtn.frame = CGRectMake(0, 0, 30, 30);
//    [leftBtn setTitle:@"" forState:UIControlStateNormal];
//    leftBtn.tintColor = [UIColor whiteColor];
    //    [leftBtn setImage:[UIImage imageNamed:@"main_top_left_png"] forState:UIControlStateNormal];
    
//    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    rightBtn.frame = CGRectMake(0, 0, 30, 30);
//    [rightBtn setImage:[UIImage imageNamed:@"main_top_right.png"] forState:UIControlStateNormal];
    
    [self CustomNavigation:@"我的" titleColor:[UIColor whiteColor] textColor:[UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1] leftBtn:nil rightBtn:nil];
}

- (void)createTableView
{
    _titleArray = [NSArray arrayWithObjects:@"个人主页",@"积分商城",@"我的求职",@"跳蚤市场",@"邀请好友",@"设置", nil];
    _personalTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 69) style:UITableViewStylePlain];
    _personalTableView.dataSource = self;
    _personalTableView.delegate = self;
    _personalTableView.tableHeaderView = [self createTableHeaderView];
    _personalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_personalTableView];

}

- (UIView *)createTableHeaderView
{
    UIGraphicsBeginImageContext(CGSizeMake(self.view.frame.size.width, 200));;
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor colorWithRed:42.0/255 green:160.0/255 blue:86.0/255 alpha:14] set];
    CGContextAddRect(context, CGRectMake(0, 0, self.view.frame.size.width, 200));
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGContextRelease(context);
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    imageView.image = image;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap)];
    [imageView addGestureRecognizer:tap];
    return imageView;
}
- (void)didTap
{
    NSLog(@"已点击");
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCellImage *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[MyTableViewCellImage alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.leftImage = [UIImage imageNamed:@"main_four.png"];
    cell.rightImage = [UIImage imageNamed:@"main_six.png"];
    cell.title = _titleArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    switch (indexPath.row) {
        case 0:
            break;
        case 1:
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
        default:
        {
            SettingViewController *setCtrl = [[SettingViewController alloc] init];
            [self.navigationController pushViewController:setCtrl animated:YES];
        }
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
