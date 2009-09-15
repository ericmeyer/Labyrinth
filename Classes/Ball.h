#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Ball : NSObject <UIAccelerometerDelegate> {
	float xVelocity;
	float yVelocity;
	float zVelocity;	
	float xPos;
	float yPos;
	float accelerationCoefficient;
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration;

@property float xVelocity;
@property float yVelocity;
@property float zVelocity;
@property float xPos;
@property float yPos;
@property float accelerationCoefficient;

@end
