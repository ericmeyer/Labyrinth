#import "BallSceneTest.h"
#import "AtlasSprite.h"
#import "AtlasSpriteManager.h"
#import "Director.h"
#import "DirectorWrapper.h"
#import "cocos2d.h"
#import <OCMock/OCMock.h>
#include "chipmunk.h"
#include "UIAcceleration+Settable.h"

@implementation BallSceneTest

-(void) setupFixedSizeDirector
{
	CGSize size;
	size.height = 100;
	size.width = 100;
	
	// Might want to make my own version of this if I use it a lot
	OCMockObject *fixedSizeDirector = [OCMockObject niceMockForClass:[Director class]];
	[[[fixedSizeDirector stub] andReturnValue: [NSValue valueWithCGSize:size]] winSize];
	
	[DirectorWrapper setSharedDirector:fixedSizeDirector];
}

-(AtlasSprite *)getBallSprite
{
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[layer getChildByTag:kTagBallManager];
	AtlasSprite *sprite = (AtlasSprite *) [mgr getChildByTag:kTagBall];
	return sprite;
}

-(void) setUp 
{
	[self setupFixedSizeDirector];
	layer = [[BallScene alloc] init]; // Keep an eye on this.  Do you really need this for every test?
}

-(void) tearDown
{
	[layer release];
}

-(void) testCreatesBackgroundSpriteAtDirectorWidth
{	
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[layer getChildByTag:kTagBackgroundManager];
	AtlasSprite *sprite = (AtlasSprite *) [mgr getChildByTag:kTagBackground];
	
	STAssertEquals(sprite.textureRect, CGRectMake(0, 0, 100, 100), nil);
}

-(void) testSetsBackgroundSpriteToCenter
{
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[layer getChildByTag:kTagBackgroundManager];
	AtlasSprite *sprite = (AtlasSprite *) [mgr getChildByTag:kTagBackground];
	
	STAssertEquals(sprite.position, ccp(50.0, 50.0), nil);
}

-(void) testCreatesBallOfCorrectSize
{	
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[layer getChildByTag:kTagBallManager];
	AtlasSprite *sprite = (AtlasSprite *) [mgr getChildByTag:kTagBall];
	
	STAssertEquals(sprite.textureRect, CGRectMake(0, 0, 30.0, 30.0), nil);
}

-(void) testSetsBallInCenter
{	
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[layer getChildByTag:kTagBallManager];
	AtlasSprite *sprite = (AtlasSprite *) [mgr getChildByTag:kTagBall];
	
	STAssertEquals(sprite.position, ccp(50.0, 50.0), nil);
}

-(void) testAccelerometerEnabled
{
	STAssertTrue(layer.isAccelerometerEnabled, nil);
}

-(void) testSchedulesTheUpdateLoop
{
	Timer *timer = [[layer scheduledSelectors] objectForKey:@"updateBall:"];
	
	STAssertNotNil(timer, nil);
}

-(void) testBallDoesntGoPastBottomOfScreen
{
	AtlasSprite *ball = [self getBallSprite];
	ball.position = ccp(50.0f, 15.0f);
	layer.ballBody->p = ball.position;
	
	[layer updateBall: 0.9f];
	
	STAssertEquals(ball.position, ccp(50.0, 15.0f), nil);
}

-(void) testInitialGravityPortraitPosition
{
	UIAcceleration *acceleration = [[[UIAcceleration alloc] initWithX: 0.0f withY: 1.0 andZ: 0.0f] autorelease];
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	
	[layer accelerometer: accelerometer didAccelerate: acceleration];
	
	STAssertEquals([layer gravity], ccp(0.0f, GRAVITY), nil);
}

-(void) testAccelerometerGravityIsScaledInXAndY
{
	float fortyFiveDegreeVector = 0.707106781186548f; // This is the x and y component for a Unit length vector at a 45 degree angle
	UIAcceleration *acceleration = [[[UIAcceleration alloc] initWithX: fortyFiveDegreeVector withY: fortyFiveDegreeVector andZ: 0.0f] autorelease];
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];

	[layer accelerometer: accelerometer didAccelerate: acceleration];
	
	STAssertEquals([layer gravity].x, fortyFiveDegreeVector * GRAVITY, nil);
	STAssertEquals([layer gravity].y, fortyFiveDegreeVector * GRAVITY, nil);
}

-(void) setGravityRight 
{
  UIAcceleration *acceleration = [[[UIAcceleration alloc] initWithX: 1.0f withY: 0.0 andZ: 0.0f] autorelease];
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	[layer accelerometer: accelerometer didAccelerate: acceleration];
}

-(void) testBallDoesntGoPastRightOfScreen
{
	AtlasSprite *ball = [self getBallSprite];
	ball.position = ccp(85.0f, 50.0f)	;
	layer.ballBody->p = ball.position;
	
	[self setGravityRight];
	
	[layer updateBall:0.1f];
	
	STAssertEquals(ball.position, ccp(85.0f, 50.0f), nil);
}

-(void) setGravityLeft
{
  UIAcceleration *acceleration = [[[UIAcceleration alloc] initWithX: -1.0f withY: 0.0 andZ: 0.0f] autorelease];
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	[layer accelerometer: accelerometer didAccelerate: acceleration];
}

-(void) testBallDoesntGoPastLeftOfScreen
{
	AtlasSprite *ball = [self getBallSprite];
	ball.position = ccp(15.0f, 50.0f)	;
	layer.ballBody->p = ball.position;
	
	[self setGravityLeft];
	
	[layer updateBall:0.1f];
	
	STAssertEquals(ball.position, ccp(15.0f, 50.0f), nil);
}

-(void) setGravityUp
{
  UIAcceleration *acceleration = [[[UIAcceleration alloc] initWithX: 0.0f withY: 1.0 andZ: 0.0f] autorelease];
	UIAccelerometer *accelerometer = [UIAccelerometer sharedAccelerometer];
	[layer accelerometer: accelerometer didAccelerate: acceleration];
}

-(void) testBallDoesntGoPastTopOfScreen
{
	AtlasSprite *ball = [self getBallSprite];
	ball.position = ccp(15.0f, 85.0f)	;
	layer.ballBody->p = ball.position;
	
	[self setGravityUp];
	
	[layer updateBall:0.1f];
	
	STAssertEquals(ball.position, ccp(15.0f, 85.0f), nil);
}
	

@end
