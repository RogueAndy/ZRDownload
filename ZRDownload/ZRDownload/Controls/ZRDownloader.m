//
//  ZRDownloader.m
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "ZRDownloader.h"

static ZRDownloader *mainDownloader = nil;

@interface ZRDownloader()<NSURLSessionDelegate, NSURLSessionDownloadDelegate>

@property (nonatomic, strong) NSURLSession *backgroundSession;

@end

@implementation ZRDownloader

#pragma mark - 设置单例变量

+ (instancetype)shareInstance {

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        mainDownloader = [[self alloc] init];
//        static NSString *identifier = @"com.rogue.ZRDownload.backgroundSession";
        NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];//[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier];
        mainDownloader.backgroundSession = [NSURLSession sessionWithConfiguration:sessionConfig
                                                                         delegate:mainDownloader
                                                                    delegateQueue:[NSOperationQueue mainQueue]];
        
    });
    
    return mainDownloader;

}

#pragma mark - Static Method

/**
 开始下载
 
 @param url 下载文件的地址
 */
+ (void)beginDownWithURL:(NSString *)url {

    [[self shareInstance] beginDownWithURL:url];

}

#pragma mark - Dynamic Method

/**
 开始下载

 @param url 下载文件的地址
 */
- (void)beginDownWithURL:(NSString *)url {

    NSURL *downURL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:downURL];
    NSURLSessionDownloadTask *downTask = [self.backgroundSession downloadTaskWithRequest:request];
    [downTask resume]; // 使用resume 启动下载

}

#pragma mark - NSURLSessionDelegate

#pragma mark - NSURLSessionDownloadDelegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {

    double currentProgress = totalBytesWritten / (double)totalBytesExpectedToWrite;
//    NSLog(@"------------progress: %f%%", currentProgress);
    if(self.progressBlock) {
    
        self.progressBlock(currentProgress);
    
    }

}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {

    NSLog(@" function == %s, line == %d, error ==  %@",__FUNCTION__,__LINE__,error);

}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {

    // 存储本地
    
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSString *appendPath = [NSString stringWithFormat:@"/zlj.mp4"];
    NSString *file = [documentPath stringByAppendingString:appendPath];
    
    BOOL remove = [manager removeItemAtPath:file error:nil];
    if(!remove) {
        
        NSLog(@"--------- because can't remove old files, may has some wrong!");
        return;
        
    }
    BOOL success = [manager copyItemAtPath:location.path toPath:file error:nil];
    if(success) {
    
        NSLog(@"--------- didFinishDownloadingToURL SUCCESS \n path:%@", file);
    
    }

}

@end
