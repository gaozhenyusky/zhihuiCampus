//
//  SenderMessageStyleOneViewController.m
//  testViewController
//
//  Created by admin on 14-10-9.
//  Copyright (c) 2014年 haolai. All rights reserved.
//

#import "SenderMessageStyleOneViewController.h"

@interface SenderMessageStyleOneViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITextField *_nameTextField;
    UITextField *_priceTextField;
    UITextField *_timeTextField;
    UITextField *_phoneTextField;
    UITextView *_introduceTextView;
    UIImageView *_imageViewOne;
    UIImageView *_imageViewTwo;
    UIImageView *_imageViewThree;
    UIImageView *_imageViewFour;
    UILabel *placeLabel;
    UIView *placeImageView;
    float x;
}
@end

@implementation SenderMessageStyleOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createView];
}

- (void)createView
{
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 70, self.view.frame.size.width - 20, 40)];
    _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    UILabel *nameTextFieldleftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 40)];
    nameTextFieldleftLabel.text = @"  物品名称:";
    nameTextFieldleftLabel.font = [UIFont systemFontOfSize:20];
    _nameTextField.leftViewMode = UITextFieldViewModeAlways;
    _nameTextField.leftView = nameTextFieldleftLabel;
    [self.view addSubview:_nameTextField];
    
    _priceTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 120, self.view.frame.size.width - 20, 40)];
    _priceTextField.borderStyle = UITextBorderStyleRoundedRect;
    UILabel *priceTextFieldleftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 50)];
    priceTextFieldleftLabel.text = @"  出售价格:";
    priceTextFieldleftLabel.font = [UIFont systemFontOfSize:20];
    _priceTextField.leftViewMode = UITextFieldViewModeAlways;
    _priceTextField.leftView = priceTextFieldleftLabel;
    [self.view addSubview:_priceTextField];
    
    _timeTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 170, self.view.frame.size.width - 20, 40)];
    _timeTextField.borderStyle = UITextBorderStyleRoundedRect;
    UILabel *timeTextFieldleftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 50)];
    timeTextFieldleftLabel.text = @"  实效时间:";
    timeTextFieldleftLabel.font = [UIFont systemFontOfSize:20];
    _timeTextField.leftViewMode = UITextFieldViewModeAlways;
    _timeTextField.leftView = timeTextFieldleftLabel;
    [self.view addSubview:_timeTextField];
    
    _phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 220, self.view.frame.size.width - 20, 40)];
    _phoneTextField.borderStyle = UITextBorderStyleRoundedRect;
    UILabel *phoneTextFieldleftLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 40)];
    phoneTextFieldleftLabel.text = @"  联系电话:";
    phoneTextFieldleftLabel.font = [UIFont systemFontOfSize:20];
    _phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    _phoneTextField.leftView = phoneTextFieldleftLabel;
    [self.view addSubview:_phoneTextField];
    
    UILabel *introduceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 270, 100, 40)];
    introduceLabel.text = @"物品介绍:";
    introduceLabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:introduceLabel];
    
    _introduceTextView = [[UITextView alloc] initWithFrame:CGRectMake(120, 270, self.view.frame.size.width - 130, 150)];
    placeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, self.view.frame.size.width - 130, 40)];
    placeLabel.text = @"请输入250个字以内";
    [_introduceTextView addSubview:placeLabel];
    _introduceTextView.font = [UIFont systemFontOfSize:14];
    _introduceTextView.layer.borderWidth = 0.3;
    _introduceTextView.layer.cornerRadius = 3;
    _introduceTextView.delegate = self;
    _introduceTextView.layer.borderColor = [UIColor grayColor].CGColor;
    [self.view addSubview:_introduceTextView];
    
    UILabel *promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 420, self.view.frame.size.width - 40, 40)];
    promptLabel.font = [UIFont systemFontOfSize:20];
    promptLabel.text = @"上传照片（4张照片以内）";
    [self.view addSubview:promptLabel];
    
    placeImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 460, self.view.frame.size.width, self.view.frame.size.height - 480)];
    placeImageView.backgroundColor = [UIColor colorWithRed:245.0/255 green:245.0/255 blue:245.0/255 alpha:1];
    [self.view addSubview:placeImageView];
    [self createImageView];
}

- (void)createImageView
{
    _imageViewOne = [[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 70, placeImageView.frame.size.height - 16)];
    _imageViewOne.backgroundColor = [UIColor redColor];
    _imageViewOne.image = [UIImage imageNamed:@"place.png"];
    [placeImageView addSubview:_imageViewOne];

    
    _imageViewTwo = [[UIImageView alloc] initWithFrame:CGRectMake(86, 8, 70, placeImageView.frame.size.height - 16)];
    _imageViewTwo.backgroundColor = [UIColor redColor];
    _imageViewTwo.image = [UIImage imageNamed:@"place.png"];
    [placeImageView addSubview:_imageViewTwo];
    
    _imageViewThree = [[UIImageView alloc] initWithFrame:CGRectMake(86+78, 8, 70, placeImageView.frame.size.height - 16)];
    _imageViewThree.backgroundColor = [UIColor redColor];
    _imageViewThree.image = [UIImage imageNamed:@"place.png"];
    [placeImageView addSubview:_imageViewThree];
    
    _imageViewFour = [[UIImageView alloc] initWithFrame:CGRectMake(86+78+78, 8, 70, placeImageView.frame.size.height - 16)];
    _imageViewFour.backgroundColor = [UIColor redColor];
    _imageViewFour.image = [UIImage imageNamed:@"place.png"];
    [placeImageView addSubview:_imageViewFour];
    
    _imageViewOne.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [_imageViewOne addGestureRecognizer:tap1];

    _imageViewTwo.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [_imageViewTwo addGestureRecognizer:tap2];

    _imageViewThree.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [_imageViewThree addGestureRecognizer:tap3];

    _imageViewFour.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap4 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTap:)];
    [_imageViewFour addGestureRecognizer:tap4];

}
- (void)didTap:(UITapGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:self.view];
    x=point.x;
    UIImagePickerController *imagePick = [[UIImagePickerController alloc] init];
    imagePick.delegate = self;
//    imagePick.allowsEditing = YES;
//    BOOL a = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
//    BOOL b = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePick animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    if (x < 80) {
        _imageViewOne.image = image;
    } else if (x < 160) {
        _imageViewTwo.image = image;
    } else if (x < 240) {
        _imageViewThree.image = image;
    } else {
        _imageViewFour.image = image;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%@",info);
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [placeLabel removeFromSuperview];
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, -200, self.view.frame.size.width, self.view.frame.size.height);
    }];
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.3 animations:^{
        self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
