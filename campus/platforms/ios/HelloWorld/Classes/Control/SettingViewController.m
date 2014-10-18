//
//  SettingViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-8.
//
//

#import "SettingViewController.h"
#import "MyTableViewCell.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_setTableView;
    NSArray *_titleArray;
}
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = [NSArray arrayWithObjects:@"修改密码",@"消除缓存",@"关于我们",@"服务条款",@"检查更新",@"意见反馈", nil];
    [self createTableView];
}
- (void)createTableView
{
    _setTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _setTableView.dataSource = self;
    _setTableView.delegate = self;
    _setTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_setTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = (MyTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.title = _titleArray[indexPath.row];
    cell.rightImage = [UIImage imageNamed:@"main_three.png"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
