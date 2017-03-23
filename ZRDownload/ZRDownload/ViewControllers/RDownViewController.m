//
//  RDownViewController.m
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "RDownViewController.h"
#import "ZRDownloader.h"

@interface RDownViewController ()

@end

@implementation RDownViewController

- (void)loadView {
    
    [super loadView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 35);
    [btn setTitle:@"下 载" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor whiteColor];

}

- (void)btnClick:(UIButton *)sender {

    [ZRDownloader beginDownWithURL:@"http://sbslive.cnrmobile.com/storage/storage2/18/01/18/46eeb50b3f21325a6f4bd0e8ba4d2357.3gp"];

}

@end
