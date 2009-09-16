#import "Ball.h"

@implementation Ball

@synthesize xVelocity;
@synthesize yVelocity;
@synthesize zVelocity;
@synthesize xPos;
@synthesize yPos;
@synthesize accelerationCoefficient;

-(id) init {
	[super init];
	
	self.xVelocity = 0;
	self.yVelocity = 0;
	self.zVelocity = 0;
	self.xPos = 50;
	self.yPos = 50;
	self.accelerationCoefficient = 9.0f;
	
	return self;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration 
{
	self.xVelocity = accelerationCoefficient * acceleration.x * -1.0f + self.xVelocity;
	self.xPos = 1/60.0f * self.xVelocity + self.xPos;
	self.yVelocity = accelerationCoefficient * acceleration.y + self.yVelocity;
	self.yPos = 1/60.0f * self.yVelocity + self.yPos;
	
	if(self.xPos < 0 || self.xPos > 320)
	{
		self.xVelocity = self.xVelocity * -0.9;
		if(self.xPos > 320)
			self.xPos = 319;
		
		if(self.xPos < 0)
			self.xPos = 1;
	}

	if(self.yPos < 0 || self.yPos > 450)
	{
		self.yVelocity = self.yVelocity * -0.9;
		
		if(self.yPos > 450)
			self.yPos = 449;
		
		if(self.yPos < 0)
			self.yPos = 1;
	}
}

@end
