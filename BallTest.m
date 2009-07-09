#import "BallTest.h"
#import "Ball.h"

@implementation BallTest

- (void) testBallExists {
	Ball *ball = [[Ball alloc] init];
	
	STAssertNotNil(ball, @"");
}

- (void) testInitialVelocity {
	Ball *ball = [[Ball alloc] init];
	
	STAssertEquals(0.0f, ball.velocity, nil);
}



@end