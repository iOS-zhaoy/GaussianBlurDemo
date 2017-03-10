//
//  ViewController.m
//  GaussianBlurDemo
//
//  Created by hanzhanbing on 16/8/29.
//  Copyright © 2016年 asj. All rights reserved.
//

#import "ViewController.h"
#import "FXBlurView.h" //模糊视图

@interface ViewController ()

@property (nonatomic,retain) FXBlurView *bgView; //模糊弹框背景视图
    
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    imageView.image = [UIImage imageNamed:@"bg"];
    [self.view addSubview:imageView];
    
    _bgView = [[FXBlurView alloc] initWithFrame:self.view.frame];
    _bgView.tintColor = [UIColor blackColor];
    _bgView.dynamic = YES;
    _bgView.blurRadius = 20; //调节模糊程度
    [self.view addSubview:_bgView];
    
    UITapGestureRecognizer *showTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBlurView)];
    [self.view addGestureRecognizer:showTap]; //显示模糊视图
    
    UITapGestureRecognizer *hideTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideBlurView)];
    [_bgView addGestureRecognizer:hideTap]; //隐藏模糊视图
}

#pragma mark - methods

- (void)showBlurView {
    _bgView.hidden = NO;
}

- (void)hideBlurView {
    _bgView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
