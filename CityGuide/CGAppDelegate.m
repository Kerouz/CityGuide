//
//  CGAppDelegate.m
//  CityGuide
//
//  Created by Apple on 28/07/13.
//  Copyright (c) 2013 Apple. All rights reserved.
//

#import "CGAppDelegate.h"
#import "CGViewController.h"
#import "City.h"

@implementation CGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    City *london = [[City alloc] init];
    london.cityName = @"London";
    london.cityDescription = @"The capital of the United Kingdom and England";
    london.cityPicture = [UIImage imageNamed:@"London.jpg"];
    
    City *sanFrancisco = [[City alloc] init];
    sanFrancisco.cityName = @"San Francisco";
    sanFrancisco.cityDescription = @"The heart of the San Francisco Bay Area";
    sanFrancisco.cityPicture = [UIImage imageNamed:@"SanFrancisco.jpg"];
    
    City *madrid = [[City alloc] init];
    madrid.cityName = @"Madrid";
    madrid.cityDescription = @"The capital and Largest City of Spain";
    madrid.cityPicture = [UIImage imageNamed:@"Madrid.jpg"];
 
    City *sydney = [[City alloc] init];
    sydney.cityName = @"Sydney";
    sydney.cityDescription = @"The largest city in Australia";
    sydney.cityPicture = [UIImage imageNamed:@"Sydney.jpg"];
    
    self.cities = [[NSMutableArray alloc]initWithObjects:london, sanFrancisco, madrid, sydney, nil];
    
    
    // Override point for customization after application launch.
    self.viewController = [[CGViewController alloc] initWithNibName:@"CGViewController" bundle:nil];
//    self.window.rootViewController = self.viewController;
    self.navController = [[UINavigationController alloc]
                         initWithRootViewController:self.viewController];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
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
