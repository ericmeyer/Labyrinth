#import "LabyrinthAppDelegate.h"
#import "LabyrinthViewController.h"
#import "LabyrinthLayer.h"
#import "DirectorWrapper.h"
#import "Scene.h"

@implementation LabyrinthAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{	
	//[[Director sharedDirector] attachInView:window];
	[window setUserInteractionEnabled:YES];
	
	Scene *scene = [Scene node];
	[scene addChild:[LabyrinthLayer node]];
	[[DirectorWrapper sharedDirector] runWithScene:scene];
}

- (void)dealloc 
{
	[window release];
	[super dealloc];
}


@end
