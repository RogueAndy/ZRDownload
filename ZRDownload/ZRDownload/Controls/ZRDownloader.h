//
//  ZRDownloader.h
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IfCondition(condition, xx, ...) {if((condition)) {\
ITTDPRINT(xx, ##__VA_ARGS__); \
} \

@interface ZRDownloader : NSObject

@property (nonatomic, strong) void(^progressBlock)(double progress);

+ (instancetype)shareInstance;

+ (void)beginDownWithURL:(NSString *)url;

@end
