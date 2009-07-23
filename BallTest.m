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

-(void) testChangeXVelocity {
	UIAcceleration* acceleration;
	acceleration = [[UIAcceleration alloc] init];
	acceleration.x = 1.5f;
	STAssertEquals(0.5f, (float)acceleration.x, nil);
}

@end