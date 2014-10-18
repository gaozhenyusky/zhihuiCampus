//
//  MyTableViewCellImage.m
//  CustomTableViewCell
//
//  Created by admin on 14-10-8.
//  Copyright (c) 2014年 haolai. All rights reserved.
//

#import "MyTableViewCellImage.h"
@interface MyTableViewCellImage()
{
    UIImageView *leftImageView;
    UIImageView *rightImageView;
    UILabel *titleLabel;
    UIView *view;
}
@end
@implementation MyTableViewCellImage

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        view = [[UIView alloc] init];
        view.layer.borderWidth = 0.5;
        view.layer.borderColor = [UIColor grayColor].CGColor;
        view.layer.cornerRadius = 3;
        view.layer.masksToBounds = YES;
        [self.contentView addSubview:view];
        leftImageView = [[UIImageView alloc] init];
        rightImageView = [[UIImageView alloc] init];
        titleLabel = [[UILabel alloc] init];
        [view addSubview:leftImageView];
        [view addSubview:titleLabel];
        [view addSubview:rightImageView];
    }
    return self;
}
- (void)setLeftImage:(UIImage *)leftImage
{
    _leftImage = leftImage;
    leftImageView.image = _leftImage;
}
- (void)setRightImage:(UIImage *)rightImage
{
    _rightImage = rightImage;
    rightImageView.image = _rightImage;
}
- (void)setTitle:(NSString *)title
{
    _title = title;
    titleLabel.text = title;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    view.frame = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.height - 12);

//    leftImageView.center = CGPointMake(15, view.frame.size.height/2);
//    leftImageView.contentMode = UIViewContentModeCenter;
//    rightImageView.contentMode = UIViewContentModeCenter;
//    rightImageView.center = CGPointMake(view.frame.size.width-30, view.frame.size.height/2);
    leftImageView.frame = CGRectMake(10, (view.frame.size.height -20)/2, 20, 20);
    rightImageView.frame = CGRectMake(view.frame.size.width - 30, (view.frame.size.height -20)/2, 20, 20);
    titleLabel.frame = CGRectMake(35, 0, 200, view.frame.size.height);
}

@end
