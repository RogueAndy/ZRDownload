//
//  AppIFViewController.m
//  ZRDownload
//
//  Created by rogue on 2017/5/5.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "AppIFViewController.h"
#import "Masonry.h"
#import "AFNetWorking.h"

@interface AppIFViewController ()

@property (nonatomic, strong) UIButton *beginButton;

@end

@implementation AppIFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadViews];
    [self loadSubviews];
    
}

- (void)loadViews {

    self.beginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.beginButton addTarget:self action:@selector(beginAction:) forControlEvents:UIControlEventTouchUpInside];
    self.beginButton.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.beginButton];

}

- (void)loadSubviews {

    [self.beginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.mas_equalTo(40);
        
    }];

}

- (void)beginAction:(UIButton *)sender {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://localhost:3000/haha" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];


}

@end
