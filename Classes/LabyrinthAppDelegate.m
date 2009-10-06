#import "LabyrinthAppDelegate.h"
#import "LabyrinthViewController.h"
#import "TableLayer.h"
#import "DirectorWrapper.h"
#import "Scene.h"

@implementation LabyrinthAppDelegate

@synthesize window;

-(void) runWithLabyrinthLayer
{
	Scene *scene = [Scene node];
	[scene addChild:[TableLayer node]];
	[[DirectorWrapper sharedDirector] runWithScene:scene];
}

-(void) attachViewToDirector
{
	[[DirectorWrapper sharedDirector] attachInView:window];
}

-(void) initWindow
{
	[window setUserInteractionEnabled:YES];
	[window setMultipleTouchEnabled:YES];
}

-(void) applicationDidFinishLaunching:(UIApplication *)application 
{	
	[self attachViewToDirector];
	[self initWindow];
	[self runWithLabyrinthLayer];
}

-(void) dealloc 
{
	[window release];
	[super dealloc];
}


@end
