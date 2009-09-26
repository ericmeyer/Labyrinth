//
//  LabyrinthAppDelegate.h
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DirectorFactory.h"
#import "Director.h"

@class LabyrinthViewController;

@interface LabyrinthAppDelegate : NSObject <UIApplicationDelegate> 
{
	DirectorFactory					*directorFactory;
	Director								*director;
}

@property (nonatomic, retain) IBOutlet DirectorFactory *directorFactory;
@property (nonatomic, retain) Director *director;

@end

