//
//  LabyrinthAppDelegate.h
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LabyrinthViewController;

@interface LabyrinthAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    LabyrinthViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet LabyrinthViewController *viewController;

@end

