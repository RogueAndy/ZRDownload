//
//  ZRDownloader.m
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "ZRDownloader.h"

static ZRDownloader *mainDownloader = nil;

@interface ZRDownloader()<NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *backgroundSession;

@end

@implementation ZRDownloader

#pragma mark - 设置单例变量

+ (instancetype)shareInstance {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        mainDownloader = [[self alloc] init];
        static NSString *identifier = @"com.rogue.ZRDownload.backgroundSession";
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier];
        mainDownloader.backgroundSession = [NSURLSession sessionWithConfiguration:sessionConfig
                                                                         delegate:mainDownloader
                                                                    delegateQueue:[NSOperationQueue mainQueue]];
        
    });
    
    return mainDownloader;

}

#pragma mark - Static Method

+ (void)beginDownWithURL:(NSString *)url {

    

}

#pragma mark - Dynamic Method

- (void)beginDownWithURL:(NSString *)url {

    

}



@end
