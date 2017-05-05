//
//  AppDelegate.m
//  ZRDownload
//
//  Created by rogue on 2017/3/23.
//  Copyright © 2017年 RogueAndy. All rights reserved.
//

#import "AppDelegate.h"
#import "RViewController_1.h"
#import "AppIFViewController.h"

typedef void (^CompletionHandlerType)(void) ;

@interface AppDelegate ()<NSURLSessionDelegate>

@property (nonatomic, strong) NSMutableDictionary *completionHandlerDictionary;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[AppIFViewController new]];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler {

    NSURLSession *backgroundSession = [self backgroundURLSession];
    [self addCompletionHandler:completionHandler forSession:backgroundSession];

}

- (NSURLSession *)backgroundURLSession {
    static NSURLSession *session = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *identifier = @"com.rogue.ZRDownload.backgroundSession";
        NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier];
        session = [NSURLSession sessionWithConfiguration:sessionConfig
                                                delegate:self
                                           delegateQueue:[NSOperationQueue mainQueue]];
    });
    
    return session;
}

- (void)addCompletionHandler:(CompletionHandlerType)handler
                  forSession:(NSString *)identifier {

    if([self.completionHandlerDictionary objectForKey:identifier]) {
    
        NSLog(@"Error: Got multiple handlers for a single session identifier.  This should not happen.\n");
    
    }
    
    [self.completionHandlerDictionary setObject:handler forKey:identifier];

}

- (NSMutableDictionary *)completionHandlerDictionary {

    if(!_completionHandlerDictionary) {
    
        _completionHandlerDictionary = [[NSMutableDictionary alloc] init];
    
    }
    
    return _completionHandlerDictionary;

}

#pragma mark - URLSession Delegate

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {

    if(session.configuration.identifier) {
    
        [self callCompletionHandlerForSession:NSURLTypeIdentifierKey];
    
    }

}

- (void)callCompletionHandlerForSession:(NSString *)identifier {

    CompletionHandlerType handler = [self.completionHandlerDictionary objectForKey:identifier];
    if(handler) {
    
        [self.completionHandlerDictionary removeObjectForKey:identifier];
        handler();
    
    }

}

@end
