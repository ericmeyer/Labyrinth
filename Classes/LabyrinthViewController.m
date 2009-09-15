//
//  LabyrinthViewController.m
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import "LabyrinthViewController.h"
#import "AccelerometerSimulation.h"

@implementation LabyrinthViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = ball;
	accelerometer.updateInterval = 1.0f/60.0f;
	
	[ball addObserver:self forKeyPath:@"xVelocity" options:NSKeyValueObservingOptionNew context:NULL];	
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context  
{
}

- (void)didReceiveMemoryWarning 
{
  [super didReceiveMemoryWarning];
}

- (void)dealloc 
{
	[ball release];
	[super dealloc];
}

@end
