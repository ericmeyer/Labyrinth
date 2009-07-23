//
//  SettableUIAccelerate.h
//  Labyrinth
//
//  Created by Eric Meyer on 7/16/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIAccelerometer.h>

@interface UIAcceleration (Settable) {
	double myX;
	double myY;
	double myZ;
}

@property(assign) double myX;
@property(assign) double myY;
@property(assign) double myZ;

-(id)init;

-(double) getx;
-(double) gety;
-(double) getz;


@end
