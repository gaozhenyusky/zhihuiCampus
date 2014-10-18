//
//  SignInViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-7.
//
//

#import "SignInViewController.h"
#import "Header.h"
#import <SMS_SDK/SMS_SDK.h>

//短信验证
#import <SMS_SDK/SMS_SDK.h>
#import "RegViewController.h"

//
#import "AFNetworking.h"

//
#import "SMS_MBProgressHUD+Add.h"
//
#import "UIViewController+navigationItem.h"
//
#import "SignOnViewController.h"


//注意:请用户自己填入所申请的短信SDK的appkey和appsecret
#define appKey @"25a64c839b5f"
#define appSecret @"9a639150fcb464d9a1c1ab926648ca3f"


@interface SignInViewController ()<TabBarDelegate, NSURLConnectionDataDelegate, UIAlertViewDelegate> {
    UITabBarController *_tabBarCtr;
    UITextField *_textField;
    AFHTTPSessionManager *_manager;
    UIAlertView *_alertView;
}

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化短信SDK
    [SMS_SDK registerApp:appKey withSecret:appSecret];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setNavigationItem];
    [self createConfirm];
    [self createTextField];
    [self createGorgetBtn];
   

}

#pragma mark - 忘记密码按钮
- (void)createGorgetBtn {
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    forgetBtn.frame = CGRectMake(self.view.frame.size.width - 80, _textField.frame.origin.y + _textField.frame.size.height +10, 60, 40);
    [forgetBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [self.view addSubview:forgetBtn];

}


#pragma mark - 手机号输入框
- (void)createTextField {
    UIImageView *V = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"main_top_right.png"]];
    V.backgroundColor = [UIColor grayColor];
    
    _textField = [[UITextField alloc] init];
    _textField.frame = CGRectMake(10, 20, self.view.frame.size.width-20, 55);
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.layer.borderWidth = 1;
    _textField.layer.cornerRadius = 5;
    _textField.placeholder = @"手机号码";
    _textField.leftView = V;
    _textField.leftViewMode = UITextFieldViewModeAlways;
    _textField.clearButtonMode = UITextFieldViewModeUnlessEditing;
    [self.view addSubview:_textField];
}


#pragma mark - 确认登录按钮
- (void)createConfirm {
    UIButton *signInBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    signInBtn.frame = CGRectMake(10, 130, self.view.frame.size.width-20, 45);
    [signInBtn setTitle:@"确定" forState:UIControlStateNormal];
    signInBtn.tintColor = [UIColor whiteColor];
    signInBtn.layer.cornerRadius = 5;
    signInBtn.backgroundColor = [UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1];
    [signInBtn addTarget:self action:@selector(signInConfirmClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signInBtn];

}

- (void)signInConfirmClick:(UIButton *)sender {
#warning
    [self initViewControl];


    _alertView.delegate = self;
    if ( _textField.text.length != 11 ) {
        _alertView = [[UIAlertView alloc] initWithTitle:@"您输入有误" message:@"请重新输入" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [_alertView show];
    } else {
//        NSString *str = @"{\"username\":\"15574604337\"}";
        NSString *str = [NSString stringWithFormat:@"{\"username\":\"%@\"}", _textField.text];

        NSDictionary *dict = @{@"data":str};
        NSLog(@"%@", dict);
        
        SMS_MBProgressHUD *sms = [[SMS_MBProgressHUD alloc] init];
        sms = [SMS_MBProgressHUD showMessag:@"正在登录中..." toView:self.view];


        _manager = [[AFHTTPSessionManager alloc] init];
        [_manager POST:@"http://192.168.1.101/smartshool/index.php?m=member&c=index&a=login" parameters:dict success:^(NSURLSessionDataTask *task, id responseObject) {
            [sms removeFromSuperview];
            NSLog(@"responseObject: %@", responseObject);
            NSLog(@"%@", [responseObject valueForKey:@"msg"]);
            if ([[responseObject valueForKey:@"state"]  isEqual: @1]) {
                [self initViewControl];
            } else {
                [SMS_MBProgressHUD showError:@"该用户不存在" toView:self.view];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"AF Error: %@", error);
            [sms removeFromSuperview];

            [SMS_MBProgressHUD showError:@"登录失败" toView:self.view];

        }];
    }
    

}

- (void)judgeInput {

}



#pragma mark - 创建导航条
- (void)setNavigationItem {
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 30, 30);
//    [leftBtn setTitle:@"长沙" forState:UIControlStateNormal];
    leftBtn.tintColor = [UIColor whiteColor];
    //    [leftBtn setImage:[UIImage imageNamed:@"main_top_left_png"] forState:UIControlStateNormal];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 30, 30);
//    [rightBtn setImage:[UIImage imageNamed:@"main_top_right.png"] forState:UIControlStateNormal];
    [rightBtn setTitle:@"注册" forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(registerUser) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tintColor = [UIColor whiteColor];
    
//    [self CustomNavigation:@"登录" Color:[UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1] LeftBtn:leftBtn  RightBtn:rightBtn];
    [self CustomNavigation:@"登录" titleColor:[UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1] textColor:nil leftBtn:leftBtn rightBtn:rightBtn];
}

// 注册按钮
-(void)registerUser
{
    SignOnViewController *SOVC = [[SignOnViewController alloc] init];
    [self.navigationController pushViewController:SOVC animated:YES];

    //    RegViewController* reg=[[RegViewController alloc] init];
//    [self presentViewController:reg animated:YES completion:^{
//        
//    }];
//    [self.navigationController pushViewController:reg animated:YES];
}


#pragma mark -设置底布导航条
- (void)initViewControl {
    _tabBarCtr = [[UITabBarController alloc] init];

    
    HomeViewController *HVC = [[HomeViewController alloc] init];
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:HVC];
    NearbyViewController *NVC = [[NearbyViewController alloc] init];
    UINavigationController *nearbyNavi = [[UINavigationController alloc] initWithRootViewController:NVC];
    ChatViewController *CVC = [[ChatViewController alloc] init];
    UINavigationController *chatNavi = [[UINavigationController alloc] initWithRootViewController:CVC];
    MyViewController *MVC = [[MyViewController alloc] init];
    UINavigationController *myNavi = [[UINavigationController alloc] initWithRootViewController:MVC];
    _tabBarCtr.hidesBottomBarWhenPushed = YES;
    _tabBarCtr.viewControllers = @[homeNavi, nearbyNavi, chatNavi, myNavi];
    [_tabBarCtr.tabBar addSubview:[self makeTabBar]];
    NSLog(@"%@", homeNavi);
//    self.window.rootViewController = _tabBarCtr;
    [self presentViewController:_tabBarCtr animated:YES completion:nil];
    
}

- (TabBar *)makeTabBar
{

    NSArray *imageArray = @[@"d1.png",
                            @"d2.png",
                            @"d3.png",
                            @"d4.png",
                            ];
    NSArray *titleArray = @[@"主页",
                            @"附近",
                            @"聊天",
                            @"我的",
                            ];
    
    NSMutableArray *itemsArray=[[NSMutableArray alloc]init];
    
    for (int i=0; i<4; i++)
    {
        UIImage *image=[UIImage imageNamed:imageArray[i]];
        NSString *string = [NSString stringWithString:titleArray[i]];
        Items *item=[[Items alloc]initWithImage:image title:nil];
        item.selectImage=[UIImage imageNamed:@"粉红.png"];
        [itemsArray addObject:item];
    }
    TabBar *tabBar=[[TabBar alloc]initWithFrame:_tabBarCtr.tabBar.bounds];
    tabBar.itemArray=itemsArray;
    tabBar.bgImage=[UIImage imageNamed:@"main_buttom_bgcolor.png"];
    tabBar.selectIndex=0;
    tabBar.delegate=self;
    return tabBar;
}

- (void)tabBar:(TabBar *)tabBar didTag:(NSInteger)tag {
    _tabBarCtr.selectedIndex = tag;
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
