#import <OCMock/OCMock.h>
#import "LabyrinthAppDelegate.h"
#import "Director.h"
#import "Scene.h"
#import "LabyrinthAppDelegateTest.h"

@implementation LabyrinthAppDelegateTest

-(void) testAddsSceneToSharedDirector
{
	delegate = [[LabyrinthAppDelegate alloc] init];
	
	[delegate applicationDidFinishLaunching:nil];
	[[Director sharedDirector] performSelector:@selector(mainLoop)];
	
	Scene *runningScene = [[Director sharedDirector] runningScene];
	
	STAssertNotNil(runningScene, nil);
}


@end
