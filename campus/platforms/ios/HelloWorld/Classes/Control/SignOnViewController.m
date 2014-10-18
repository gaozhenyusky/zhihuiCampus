//
//  SignOnViewController.m
//  HelloWorld
//
//  Created by admin on 14-10-13.
//
//

#import "SignOnViewController.h"
#import "CityListViewController.h"

@interface SignOnViewController () <UITextFieldDelegate>{
    UITextField *_mobileNumberTextField;
    UITextField *_passwordTextField;
    UITextField *_repeatPasswordTextField;
    UITextField *_locationPasswordTextField;
    UITextField *_schoolTextField;
    
    UIView *_barView;
    
    UIButton *_leftButton;
    UIButton *_rightButton;
    
    UIButton *_signOnButton;
    
    CGFloat x;
    CGFloat width;
    CGFloat hight;
}


@end

static int i = 0;


@implementation SignOnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    x = 5;
    width = self.view.frame.size.width - 2*x;
    hight = 50;


    _mobileNumberTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, 15, width, hight)];
    _mobileNumberTextField.borderStyle = UITextBorderStyleRoundedRect;
    _mobileNumberTextField.placeholder = @"请输入手机号码";
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, _mobileNumberTextField.frame.origin.y + _mobileNumberTextField.frame.size.height+10, width, hight)];
    _passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passwordTextField.placeholder = @"请输入密码";
    
    _repeatPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, _passwordTextField.frame.origin.y + _passwordTextField.frame.size.height+10, width, hight)];
    _repeatPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _repeatPasswordTextField.placeholder = @"请重新输入密码";
    
    _locationPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, _repeatPasswordTextField.frame.origin.y + _repeatPasswordTextField.frame.size.height +10, width, hight)];
    [_locationPasswordTextField addTarget:self action:@selector(getCity:) forControlEvents:UIControlEventEditingDidBegin];
    _locationPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    _locationPasswordTextField.placeholder = @"所在地";
    
    _schoolTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, _locationPasswordTextField.frame.origin.y + _locationPasswordTextField.frame.size.height+10, width, hight)];
    _schoolTextField.borderStyle = UITextBorderStyleRoundedRect;
    _schoolTextField.placeholder = @"学校";
    
    _mobileNumberTextField.delegate = self;
    _passwordTextField.delegate = self;
    _repeatPasswordTextField.delegate = self;
    _locationPasswordTextField.delegate = self;
    _schoolTextField.delegate = self;

    
    _barView = [[UIView alloc] initWithFrame:CGRectMake(0, _schoolTextField.frame.origin.y + _schoolTextField.frame.size.height+10, self.view.frame.size.width, 1)];
    _barView.backgroundColor = [UIColor blackColor];
    
    _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftButton addTarget:self action:@selector(protocolClick:) forControlEvents:UIControlEventTouchUpInside];
    _leftButton.frame = CGRectMake(15, _barView.frame.origin.y + _barView.frame.size.height+15, 20, 20);
    _leftButton.layer.borderWidth = 1;

    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(15+_leftButton.frame.size.width+10, _barView.frame.origin.y + 16, 180, 20);
    [_rightButton setTitle:@"注册同意启菲校园的协议与条款" forState:UIControlStateNormal];
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [_rightButton addTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
    [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_rightButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    
    _signOnButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _signOnButton.layer.cornerRadius = 3;
    _signOnButton.frame = CGRectMake(20, _rightButton.frame.origin.y + 40, self.view.frame.size.width - 40, 50);
    [_signOnButton setTitle:@"注册" forState:UIControlStateNormal];
    [_signOnButton addTarget:self action:@selector(signOnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_signOnButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_signOnButton setBackgroundColor:[UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1]];
    [_signOnButton setBackgroundImage:[UIImage imageNamed:@"main_button_bgcolor.png"] forState:UIControlStateNormal];
    
    [self.view addSubview:_mobileNumberTextField];
    [self.view addSubview:_passwordTextField];
    [self.view addSubview:_repeatPasswordTextField];
    [self.view addSubview:_locationPasswordTextField];
    [self.view addSubview:_schoolTextField];
    [self.view addSubview:_barView];
    [self.view addSubview:_leftButton];
    [self.view addSubview:_rightButton];
    [self.view addSubview:_signOnButton];
}

#warning 返回值
- (void)viewDidAppear:(BOOL)animated {
    if (!(_cityName == nil)) {
        _locationPasswordTextField.text = _cityName;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField == _schoolTextField) {
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    if (textField == _schoolTextField) {
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height);
        }];
    }
    return YES;
}

- (void)protocolClick:(UIButton *)sender {
    if (i==0) {
        _leftButton.backgroundColor = [UIColor colorWithRed:44/255.0 green:165/255.0 blue:89/255.0 alpha:1];
        i = 1;
    } else {
        _leftButton.backgroundColor = [UIColor whiteColor];
        i = 0;
    }
}

- (void)getCity:(UITextField *)sender  {
    CityListViewController *CLVC = [[CityListViewController alloc] init];
    [self presentViewController:CLVC animated:YES completion:nil];
}

- (void)signOnClick:(UIButton *)sender {
    if (([_mobileNumberTextField.text isEqual:nil] && [_passwordTextField.text isEqual:nil] && [_repeatPasswordTextField.text isEqual:nil] && [_locationPasswordTextField.text isEqual:nil] && [_schoolTextField.text isEqual:nil])) {
        NSLog(@"1:%@, 2:%@, 3:%@, 4:%@, 5:%@", _mobileNumberTextField.text, _passwordTextField.text, _repeatPasswordTextField.text, _locationPasswordTextField.text, _schoolTextField.text);
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"输入不能为空" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    } else {
            NSLog(@"1:%@, 2:%@, 3:%@, 4:%@, 5:%@", _mobileNumberTextField.text, _passwordTextField.text, _repeatPasswordTextField.text, _locationPasswordTextField.text, _schoolTextField.text);
        NSLog(@"注册成功");
    }
    
    NSLog(@"1:%@, 2:%@, 3:%@, 4:%@, 5:%@", _mobileNumberTextField.text, _passwordTextField.text, _repeatPasswordTextField.text, _locationPasswordTextField.text, _schoolTextField.text);
}


@end
