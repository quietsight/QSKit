//
//  QSKTAppDelegate.m
//  QSKit-iOS-Tests
//
//  Created by Skylar Schipper on 7/22/12.
//  Copyright (c) 2012 Quiet Sight Inc. All rights reserved.
//

#import "QSKTAppDelegate.h"

#import "QSKTViewController.h"
#import "QSKeychain.h"
@implementation QSKTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[QSKTViewController alloc] initWithNibName:@"QSKTViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
//    QSKeychainCredential *c = [QSKeychainCredential credentialWithUsername:@"skylar" password:@"test" identifier:@"my_user"];
//    c.encriptionKey = @"test_key";
//    [QSKeychain saveCredential:c];
    
    QSKeychainCredential *saved = [QSKeychain credentialWithIdentifier:@"my_user" key:@"test_key"];
    [saved dump];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
