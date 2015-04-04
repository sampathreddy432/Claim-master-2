//
//  AppDelegate.m
//  AutoClaim
//
//  Created by sampath on 2015-02-23.
//  Copyright (c) 2015 sampath. All rights reserved.
//

#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>
#import <GooglePlus/GooglePlus.h>
#import <GoogleOpenSource/GoogleOpenSource.h>
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [Fabric with:@[TwitterKit]];
    
    [FBAppEvents activateApp];
    
    [[GPPSignIn sharedInstance] setClientID:@"705935661686-lgsbcqgebgk4k7b4qo67ahorgv1mh9ei.apps.googleusercontent.com"];
    
    return YES;
}
- (BOOL)application: (UIApplication *)application
            openURL: (NSURL *)url
  sourceApplication: (NSString *)sourceApplication
         annotation: (id)annotation {
    //BOOL washandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
    
    NSLog(@"%@ %@", [url absoluteString], sourceApplication);
    if ([[url absoluteString] rangeOfString:@"com.sampath.autoclaim"].location == NSNotFound)
    {
        // Call FBAppCall's handleOpenURL:sourceApplication to handle Facebook app responses
        BOOL wasHandled = [FBAppCall handleOpenURL:url sourceApplication:sourceApplication];
        // You can add your app-specific url handling code here if needed
        return wasHandled;
    }
    else
    {
        
        NSLog(@"%d", [GPPURLHandler handleURL:url
                            sourceApplication:sourceApplication
                                   annotation:annotation]);
        
        return [GPPURLHandler handleURL:url
                  sourceApplication:sourceApplication
                            annotation:annotation];
    }
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [FBAppCall handleDidBecomeActive];


}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
