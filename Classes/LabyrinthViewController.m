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



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	[super loadView];
	NSLog(@"hey");
	NSLog(@"%@", ball);
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	accelerometer.delegate = ball;
	accelerometer.updateInterval = 1.0f/60.0f;
	
	[ball addObserver:self forKeyPath:@"xVelocity" options:NSKeyValueObservingOptionNew context:NULL];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
//- (void)viewDidLoad {
//	[super viewDidLoad];
//}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	NSLog(@"************************************************observe me!");
	[label setText: [NSString stringWithFormat: @"%f", ball.xVelocity]];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
