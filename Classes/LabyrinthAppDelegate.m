#import "LabyrinthAppDelegate.h"
#import "LabyrinthViewController.h"
#import "Scene.h"

@implementation LabyrinthAppDelegate

@synthesize directorFactory;
@synthesize director;

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{	
	Scene *scene = [Scene node];

	[[Director sharedDirector] runWithScene:scene];
}

- (void)dealloc 
{
	[super dealloc];
}


@end
