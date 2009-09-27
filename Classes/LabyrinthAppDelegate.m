#import "LabyrinthAppDelegate.h"
#import "LabyrinthViewController.h"
#import "LabyrinthLayer.h"
#import "Scene.h"

@implementation LabyrinthAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{	
	Scene *scene = [Scene node];
	[scene addChild:[LabyrinthLayer node]];
	[[Director sharedDirector] runWithScene:scene];
}

- (void)dealloc 
{
	[super dealloc];
}


@end
