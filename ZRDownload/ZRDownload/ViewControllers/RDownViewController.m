//
//  RDownViewController.m
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "RDownViewController.h"
#import "ZRDownloader.h"
#import <ZRProgressView/ZProgressView.h>

@interface RDownViewController ()

@property (nonatomic, strong) ZProgressView *z1;

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
    
    self.z1 = [[ZProgressView alloc] initWithFrame:CGRectMake(0, 0, 200, 200) circleFrame:CGRectMake(0, 0, 160, 160) strokeColor:[UIColor orangeColor] animationType:ZSlow];
    self.z1.frame = CGRectMake(0, 0, 240, 240);
    self.z1.circleFrame = CGRectMake(0, 0, 240, 240);
    self.z1.center = self.view.center;
    [self.view addSubview:self.z1];

}

- (void)btnClick:(UIButton *)sender {

    __weak RDownViewController *weakSelf = self;
    [[ZRDownloader shareInstance] setProgressBlock:^(CGFloat progress) {
        weakSelf.z1.controlProgress = progress;
        NSLog(@"------------progress: %f%%", progress);
    }];
    [ZRDownloader beginDownWithURL:@"http://sbslive.cnrmobile.com/storage/storage2/18/01/18/46eeb50b3f21325a6f4bd0e8ba4d2357.3gp"];
    
}

@end
