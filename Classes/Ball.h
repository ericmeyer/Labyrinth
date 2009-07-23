//
//  Ball.h
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Ball : NSObject <UIAccelerometerDelegate> {
	float xVelocity;
	float yVelocity;
	float zVelocity;	
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;

@property float xVelocity;
@property float yVelocity;
@property float zVelocity;

@end
