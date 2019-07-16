//
//  Image.h
//  photo
//
//  Created by ngnice on 2019/7/16.
//  Copyright © 2019 ngnice. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImgViewController : UIViewController

// 申明属性
@property(nonatomic, assign) NSUInteger imageTag;
@property(nonatomic, retain) UIImage *image;
@property(nonatomic, retain) UIImageView *imageView;

@end

NS_ASSUME_NONNULL_END
