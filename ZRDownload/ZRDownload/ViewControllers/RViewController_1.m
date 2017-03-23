//
//  RViewController_1.m
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "RViewController_1.h"
#import "RDownViewController.h"

@interface RViewController_1 ()

@end

@implementation RViewController_1

- (void)loadView {

    [super loadView];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 35);
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)btnClick:(UIButton *)sender {

    [self.navigationController pushViewController:[RDownViewController new] animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
