//
//  VCRootViewController.m
//  photo
//
//  Created by ngnice on 2019/7/16.
//  Copyright © 2019 ngnice. All rights reserved.
//

#import "VCRootViewController.h"
#import "ImgViewController.h"

@interface VCRootViewController ()

@end

@implementation VCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"照片墙";
    // 设置导航栏透明度
//    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.barTintColor = UIColor
    
    // 初始化scrollview
    int NUM = 30;
    CGFloat gap = 10;
    
    UIScrollView * sv = [[UIScrollView alloc] init];
    CGFloat width =  [UIScreen mainScreen].bounds.size.width;
    CGFloat height =  [UIScreen mainScreen].bounds.size.height;
    CGFloat imgWidth = (width - 10*4)/3;
    CGFloat imgHeight = imgWidth*450/800;
    // 设置sv的位置大小
    sv.frame = CGRectMake(0, 0, width, height);
    // 设置scrollView的空间大小
    sv.contentSize = CGSizeMake(width, (imgHeight+gap)*NUM/3+gap);
    sv.userInteractionEnabled = YES;
    sv.backgroundColor = [UIColor whiteColor];
    sv.showsVerticalScrollIndicator = NO;
    // 遍历添加图片到sv中
    for (int i = 0; i < NUM; i++) {
        // 获取图片名称
        NSLog(@"(i/3)=%d",(i/3));
        NSString *imgName = [NSString stringWithFormat:@"%d.jpg", i%6+1];
        // 获取图片资源
        UIImage *img = [UIImage imageNamed:imgName];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        
        imgView.frame = CGRectMake((i%3)*(imgWidth+gap)+gap, (i/3)*(imgHeight+gap) + gap, imgWidth, imgHeight);
        
        // 启动事件接收
        imgView.userInteractionEnabled = YES;
        imgView.tag =i%6+1;
        // 创建点击手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pressTap:)];
        
        // 单次点击
        tap.numberOfTapsRequired = 1;
        // 点个手指
        tap.numberOfTouchesRequired = 1;
        [imgView addGestureRecognizer:tap];
        [sv addSubview:imgView];
        
    }
    
    [self.view addSubview:sv];
    
}

// 方法声明
-(void) pressTap:(UITapGestureRecognizer*) tap{
    NSLog(@"tap it");
    UIImageView *imgView = tap.view;
    
    // 初始化图片展示控制器
    ImgViewController *imageView = [[ImgViewController alloc] init];
    // bug
    // 一个视图只能有一个根视图 传递视图的方法不可行
//    imageView.imageView = imgView;
    imageView.image = imgView.image;
    imageView.imageTag = imgView.tag;
    
    [self.navigationController pushViewController:imageView animated:YES];
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
