//
//  Ball.m
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "Ball.h"

@implementation Ball

@synthesize xVelocity;
@synthesize yVelocity;
@synthesize zVelocity;
@synthesize xPos;
@synthesize yPos;

-(id) init {
	[super init];
	
	self.xVelocity = 0;
	self.yVelocity = 0;
	self.zVelocity = 0;
	self.xPos = 50;
	self.yPos = 50;
	
	return self;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
//	[self handleAcceleration: acceleration.x y: acceleration.y z: acceleration.z];
	//	self.xVelocity = acceleration.x;
//	self.xPos = (xVelocity/60.0 + xPos)*100;
//	self.yPos = (yVelocity/60.0 + yPos)*100;
//	self.xPos = 200;
//	self.yPos = 50;
	if(acceleration.x < 0) {
		xPos++;
	}
	else {
		xPos--;
	}
	if(acceleration.y > 0) {
		yPos++;
	}
	else {
		yPos--;
	}
	
	self.xVelocity = xVelocity + acceleration.x/60.0;
	self.yVelocity = yVelocity + acceleration.y/60.0;
	self.zVelocity = acceleration.z;
	
	if(xPos < 10 || xPos > 200) {
		self.xVelocity = -0.9*xVelocity;
	}
	
	if(yPos < 10 || yPos > 200) {
		self.yVelocity = -0.9*yVelocity;
	}
	
	NSLog(@"in accelerometer %d, %d", self.xPos, self.yPos);
}

@end
