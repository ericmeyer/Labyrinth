#import "BallTest.h"
#import "Ball.h"
#import "UIAcceleration+Settable.h"

@implementation BallTest

- (void) testBallExists {
	Ball* ball = [[Ball alloc] init];
	
	STAssertNotNil(ball, @"");
}

- (void) testInitialVelocity {
	Ball* ball = [[Ball alloc] init];
	STAssertEquals(0.0f, ball.xVelocity, nil);
	STAssertEquals(0.0f, ball.yVelocity, nil);
	STAssertEquals(0.0f, ball.zVelocity, nil);
}

-(void) testInitialPosition {
	Ball* ball = [[Ball alloc] init];
	STAssertEquals(50.0f, ball.xPos, nil);
	STAssertEquals(50.0f, ball.yPos, nil);
}

-(void) testChangeXVelocity {
	Ball* ball = [[Ball alloc] init];
	UIAcceleration* acceleration;
	acceleration = [[UIAcceleration alloc] initWithX: 1.0f withY: 0.0 andZ: 0.0f];
	//v = a * t
	UIAccelerometer *accelerometer = [[UIAccelerometer alloc] init];
	[ball accelerometer: accelerometer didAccelerate: acceleration];
	
	STAssertEquals(1.0f * ball.accelerationCoefficient, ball.xVelocity, nil);
	STAssertEquals(50.0f + (1/60.0f * ball.accelerationCoefficient), ball.xPos, nil);
}

-(void) testMoveOneTick {
	Ball* ball = [[Ball alloc] init];
	[ball setXVelocity:60.0f];
	 
	UIAcceleration* acceleration;
	acceleration = [[UIAcceleration alloc] initWithX: 0.0f withY: 0.0 andZ: 0.0f];
	//v = a * t
	UIAccelerometer *accelerometer = [[UIAccelerometer alloc] init];

	[ball accelerometer: accelerometer didAccelerate: acceleration];
	
	STAssertEquals(60.0f, ball.xVelocity, nil);
	STAssertEquals(51.0f, ball.xPos, nil);
	//velocity is pixels / second
}

-(void) testChangeYVelocity {
	Ball* ball = [[Ball alloc] init];
	UIAcceleration* acceleration;
	acceleration = [[UIAcceleration alloc] initWithX: 0.0f withY: 1.0f andZ: 0.0f];
	UIAccelerometer *accelerometer = [[UIAccelerometer alloc] init];
	[ball accelerometer: accelerometer didAccelerate: acceleration];
	
	STAssertEquals(1.0f * ball.accelerationCoefficient, ball.yVelocity, nil);
	STAssertEquals(50.0f + (1/60.0f * ball.accelerationCoefficient), ball.yPos, nil);
}	

-(void)	testMoveOneTickY {
	Ball* ball = [[Ball alloc] init];
	[ball setYVelocity:60.0f];
	
	UIAcceleration* acceleration;
	acceleration = [[UIAcceleration alloc] initWithX: 0.0f withY: 0.0 andZ: 0.0f];
	//v = a * t
	UIAccelerometer *accelerometer = [[UIAccelerometer alloc] init];
	
	[ball accelerometer: accelerometer didAccelerate: acceleration];
	
	STAssertEquals(60.0f, ball.yVelocity, nil);
	STAssertEquals(51.0f, ball.yPos, nil);
}

@end