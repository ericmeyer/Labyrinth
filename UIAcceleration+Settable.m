#import "UIAcceleration+Settable.h"

@implementation UIAcceleration (Settable)

-(id)initWithX: (double) myX withY: (double) myY andZ: (double) myZ
{
	[super init];
	x = myX;
	y = myY;
	z = myZ;
	return self;
}

@end
