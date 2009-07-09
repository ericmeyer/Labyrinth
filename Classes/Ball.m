//
//  Ball.m
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "Ball.h"


@implementation Ball

@synthesize velocity;

-(id) init {
	[super init];
	
	self.velocity = 0;
	
	return self;
}

@end
