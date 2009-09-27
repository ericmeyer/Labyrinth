#import <OCMock/OCMock.h>
#import "LabyrinthAppDelegate.h"
#import "Director.h"
#import "Scene.h"
#import "LabyrinthLayer.h"
#import "LabyrinthAppDelegateTest.h"

@implementation LabyrinthAppDelegateTest

-(void) finishLaunchingApplication
{
	[delegate applicationDidFinishLaunching:nil];
	[[Director sharedDirector] performSelector:@selector(mainLoop)];
}

-(LabyrinthLayer *) layerFromRunningScene
{
	Scene *runningScene = [[Director sharedDirector] runningScene];
	return (LabyrinthLayer *)[[runningScene children] objectAtIndex: 0];
}

-(void) testAddsLabyrinthLayerToSceneAtZero
{
	delegate = [[LabyrinthAppDelegate alloc] init];
	
	[self finishLaunchingApplication];

	LabyrinthLayer *labyrinthLayer = [self layerFromRunningScene];
	
	STAssertEquals(labyrinthLayer.zOrder, 0, nil);
}


@end
