#import "LabyrinthLayerTest.h"
#import "LabyrinthLayer.h"

@implementation LabyrinthLayerTest

-(void) testDrawsBackground
{
	LabyrinthLayer *layer = [[[LabyrinthLayer alloc] init] autorelease];
	
	STAssertEquals([layer.children count], (NSUInteger) 1, nil);
}

@end
