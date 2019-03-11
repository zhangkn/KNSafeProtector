//
//  AppDelegate.m
//  KNSafeProtector
//
//  Created by mac on 2019/3/11.
//  Copyright © 2019 kunnan. All rights reserved.
//

#import "AppDelegate.h"
#import "LSSafeProtector.h"

//调试模式
#ifdef DEBUG
#define NSLog(...)     NSLog(__VA_ARGS__)
#define KisDebug 1

//#define NSLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#else//发布模式
#define NSLog(...)
#define KisDebug 0
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [LSSafeProtector openSafeProtectorWithIsDebug]一定要在其他SDK之前调用
    
    
    BOOL isDebug = KisDebug;
//     isDebug = 0;// 测试发布版本的效果
    
    //#if DEBUG
    //    isDebug = YES;
    //#else
    //    isDebug = NO;
    //#endif
    
    
//    [Bugly startWithAppId:@""];

    //注意线上环境isDebug一定要设置为NO)
    [LSSafeProtector openSafeProtectorWithIsDebug:isDebug block:^(NSException *exception, LSSafeProtectorCrashType crashType) {
        //[Bugly reportException:exception];
        
        //此方法相对于上面的方法，好处在于bugly后台查看bug崩溃位置时，不用点击跟踪数据，再点击crash_attach.log，查看里面的额外信息来查看崩溃位置
//        [Bugly reportExceptionWithCategory:3 name:exception.name reason:[NSString stringWithFormat:@"%@  崩溃位置:%@",exception.reason,exception.userInfo[@"location"]] callStack:@[exception.userInfo[@"callStackSymbols"]] extraInfo:exception.userInfo terminateApp:NO];
    }];

//        id testnil = nil;
//    [@"" stringByAppendingString:testnil];
    

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


@end
