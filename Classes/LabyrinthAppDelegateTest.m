#import <OCMock/OCMock.h>
#import "LabyrinthAppDelegate.h"
#import "Director.h"
#import "DirectorWrapper.h"
#import "Scene.h"
#import "LabyrinthLayer.h"
#import "LabyrinthAppDelegateTest.h"
#import "OCMConstraint+SceneCheck.h"
#import <OCMock/OCMock.h>


@implementation LabyrinthAppDelegateTest

-(void) mockWindow 
{
  UIWindow *testWindow = [[UIWindow alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 1.0f, 1.0f)];
	delegate.window = testWindow;
	[testWindow release];
}

-(void) mockDirector
{
	director = [OCMockObject niceMockForClass:[Director class]];
	[DirectorWrapper setSharedDirector:director];
}

-(void) setUp
{
	delegate = [[LabyrinthAppDelegate alloc] init];
	[self mockWindow];
	[self mockDirector];
}

-(void) tearDown
{
	[DirectorWrapper clearDirector];
	[delegate release];
}

-(void) testRunsWithScene
{	
	[[director expect] runWithScene:[OCMConstraint sceneWithLayer:[LabyrinthLayer class]]];
	
	[delegate applicationDidFinishLaunching:nil];
	
	[director verify];
}

-(void) testSetsWindowUserInteractionEnabled
{
	delegate.window.userInteractionEnabled = NO;
	
	[delegate applicationDidFinishLaunching:nil];
	
	STAssertEquals(delegate.window.userInteractionEnabled, YES, nil);
}

//-(void) testDirectorIsAttachedToWindow
//{
//	[self finishLaunchingApplication];
//	
//	STAssertNotNil([Director sharedDirector].openGLView, nil);
//}

//// cocos2d will inherit these values
//[window setUserInteractionEnabled:YES];	
//[window setMultipleTouchEnabled:YES];

@end
