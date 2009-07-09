//
//  LabyrinthAppDelegate.m
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import "LabyrinthAppDelegate.h"
#import "LabyrinthViewController.h"

@implementation LabyrinthAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
