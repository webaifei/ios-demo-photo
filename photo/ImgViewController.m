//
//  Image.m
//  photo
//
//  Created by ngnice on 2019/7/16.
//  Copyright © 2019 ngnice. All rights reserved.
//

#import "ImgViewController.h"

@interface ImgViewController ()

@end

@implementation ImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat windowWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat windowHeight = [UIScreen mainScreen].bounds.size.height;
    
    // 设置当前title
    self.navigationController.title = @"图片展示";
    
    //添加一个imageView到视图中
    // 类内通过成员变量访问
    
    CGFloat height = 450*windowWidth/800;
    CGFloat y = (windowHeight - height)/2;
    _imageView = [[UIImageView alloc] init];
    _imageView.image = _image;
    _imageView.frame = CGRectMake(0, y, windowWidth, height);
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_imageView];
    
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
