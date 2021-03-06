//
//  ViewController.m
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "ViewController.h"
#import "RogueViewControllerTranstion.h"

@interface ViewController3 : UIViewController

@end

@implementation ViewController3

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
}

- (void)dealloc {
    
    NSLog(@"---  %@", [self class]);
    
}

@end

@interface ViewController2 : UIViewController

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:100/255.f green:200/255.f blue:120/255.f alpha:1];
    
    UIButton *d1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d1 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d1.frame = CGRectMake(20, 70, 280, 40);
    d1.tag = 20000;
    d1.backgroundColor = [UIColor orangeColor];
    [d1 setTitle:@"上下" forState:UIControlStateNormal];
    [self.view addSubview:d1];
    
    UIButton *d2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d2 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d2.frame = CGRectMake(20, 120, 280, 40);
    d2.tag = 20001;
    d2.backgroundColor = [UIColor orangeColor];
    [d2 setTitle:@"下上" forState:UIControlStateNormal];
    [self.view addSubview:d2];
    
    UIButton *d3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d3 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d3.frame = CGRectMake(20, 170, 280, 40);
    d3.tag = 20002;
    d3.backgroundColor = [UIColor orangeColor];
    [d3 setTitle:@"左右" forState:UIControlStateNormal];
    [self.view addSubview:d3];
    
    UIButton *d4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d4 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d4.frame = CGRectMake(20, 220, 280, 40);
    d4.tag = 20003;
    d4.backgroundColor = [UIColor orangeColor];
    [d4 setTitle:@"右左" forState:UIControlStateNormal];
    [self.view addSubview:d4];
    
    UIButton *d5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d5 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d5.frame = CGRectMake(20, 270, 280, 40);
    d5.tag = 20004;
    d5.backgroundColor = [UIColor orangeColor];
    [d5 setTitle:@"渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d5];
    
    UIButton *d6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d6 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d6.frame = CGRectMake(20, 320, 280, 40);
    d6.tag = 20005;
    d6.backgroundColor = [UIColor orangeColor];
    [d6 setTitle:@"上下渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d6];
    
    UIButton *d7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d7 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d7.frame = CGRectMake(20, 370, 280, 40);
    d7.tag = 20006;
    d7.backgroundColor = [UIColor orangeColor];
    [d7 setTitle:@"下上渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d7];
    
    UIButton *d8 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d8 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d8.frame = CGRectMake(20, 420, 280, 40);
    d8.tag = 20007;
    d8.backgroundColor = [UIColor orangeColor];
    [d8 setTitle:@"左右渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d8];
    
    UIButton *d9 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d9 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d9.frame = CGRectMake(20, 470, 280, 40);
    d9.tag = 20008;
    d9.backgroundColor = [UIColor orangeColor];
    [d9 setTitle:@"右左渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d9];
}

- (void)push:(UIButton *)sender {
    
    switch (sender.tag) {
        case 20000: {
            [self popTopToBottomPresent_popViewControllerAnimated:YES];
        }
            break;
        case 20001: {
            [self popBottomToTopPresent_popViewControllerAnimated:YES];
        }
            break;
        case 20002: {
            [self popLeftToRight_popViewControllerAnimated:YES];
        }
            break;
        case 20003: {
            [self popRightToLeft_popViewControllerAnimated:YES];
        }
            break;
        case 20004: {
            [self popAlpha_popViewControllerAnimated:YES];
        }
            break;
        case 20005: {
            [self popAlphaTopToBottomPresent_popViewControllerAnimated:YES];
        }
            break;
        case 20006: {
            [self popAlphaBottomToTopPresent_popViewControllerAnimated:YES];
        }
            break;
        case 20007: {
            [self popAlphaLeftToRight_popViewControllerAnimated:YES];
        }
            break;
        case 20008: {
            [self popAlphaRightToLeft_popViewControllerAnimated:YES];
        }
            break;
            
    }
    
}

- (void)dealloc {
    
    NSLog(@"---  %@", [self class]);
    
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:230/255.f green:230/255.f blue:230/255.f alpha:1];
    
    UIButton *d1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d1 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d1.frame = CGRectMake(20, 70, 280, 40);
    d1.tag = 10000;
    d1.backgroundColor = [UIColor orangeColor];
    [d1 setTitle:@"上下" forState:UIControlStateNormal];
    [self.view addSubview:d1];
    
    UIButton *d2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d2 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d2.frame = CGRectMake(20, 120, 280, 40);
    d2.tag = 10001;
    d2.backgroundColor = [UIColor orangeColor];
    [d2 setTitle:@"下上" forState:UIControlStateNormal];
    [self.view addSubview:d2];
    
    UIButton *d3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d3 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d3.frame = CGRectMake(20, 170, 280, 40);
    d3.tag = 10002;
    d3.backgroundColor = [UIColor orangeColor];
    [d3 setTitle:@"左右" forState:UIControlStateNormal];
    [self.view addSubview:d3];
    
    UIButton *d4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d4 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d4.frame = CGRectMake(20, 220, 280, 40);
    d4.tag = 10003;
    d4.backgroundColor = [UIColor orangeColor];
    [d4 setTitle:@"右左" forState:UIControlStateNormal];
    [self.view addSubview:d4];
    
    UIButton *d5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d5 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d5.frame = CGRectMake(20, 270, 280, 40);
    d5.tag = 10004;
    d5.backgroundColor = [UIColor orangeColor];
    [d5 setTitle:@"渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d5];
    
    UIButton *d6 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d6 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d6.frame = CGRectMake(20, 320, 280, 40);
    d6.tag = 10005;
    d6.backgroundColor = [UIColor orangeColor];
    [d6 setTitle:@"上下渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d6];
    
    UIButton *d7 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d7 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d7.frame = CGRectMake(20, 370, 280, 40);
    d7.tag = 10006;
    d7.backgroundColor = [UIColor orangeColor];
    [d7 setTitle:@"下上渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d7];
    
    UIButton *d8 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d8 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d8.frame = CGRectMake(20, 420, 280, 40);
    d8.tag = 10007;
    d8.backgroundColor = [UIColor orangeColor];
    [d8 setTitle:@"左右渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d8];
    
    UIButton *d9 = [UIButton buttonWithType:UIButtonTypeCustom];
    [d9 addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    d9.frame = CGRectMake(20, 470, 280, 40);
    d9.tag = 10008;
    d9.backgroundColor = [UIColor orangeColor];
    [d9 setTitle:@"右左渐隐" forState:UIControlStateNormal];
    [self.view addSubview:d9];
}

- (void)push:(UIButton *)sender {
    
    ViewController2 *v2 = [ViewController2 new];
    
    switch (sender.tag) {
        case 10000: {
            [self pushTopToBottomPresent_pushViewController:v2 animated:YES];
        }
            break;
        case 10001: {
            [self pushBottomToTopPresent_pushViewController:v2 animated:YES];
        }
            break;
        case 10002: {
            [self pushLeftToRight_pushViewController:v2 animated:YES];
        }
            break;
        case 10003: {
            [self pushRightToLeft_pushViewController:v2 animated:YES];
        }
            break;
        case 10004: {
            [self pushAlpha_pushViewController:v2 animated:YES];
        }
            break;
            
        case 10005: {
            [self pushAlphaTopToBottomPresent_pushViewController:v2 animated:YES];
        }
            break;
        case 10006: {
            [self pushAlphaBottomToTopPresent_pushViewController:v2 animated:YES];
        }
            break;
        case 10007: {
            [self pushAlphaLeftToRight_pushViewController:v2 animated:YES];
        }
            break;
        case 10008: {
            [self pushAlphaRightToLeft_pushViewController:v2 animated:YES];
        }
            break;
            
    }
    
}

@end
