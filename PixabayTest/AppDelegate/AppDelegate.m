//
//  AppDelegate.m
//  PixabayTest
//
//  Created by azat on 26/05/16.
//  Copyright (c) 2016 Azat Zul. All rights reserved.
//


#import "AppDelegate.h"


@interface AppDelegate ()

@property (nonatomic, strong) UIViewController *rootViewController;

@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end