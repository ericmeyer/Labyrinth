#import "LabyrinthLayerTest.h"
#import "LabyrinthLayer.h"
#import "Sprite.h"

@implementation LabyrinthLayerTest

-(void) testDrawsBackground
{
	LabyrinthLayer *layer = [[[LabyrinthLayer alloc] init] autorelease];
	Sprite *bg = [Sprite spriteWithFile:@"table.png"];
	
	STAssertEquals([layer getChildByTag:BACKGROUND], bg, nil);
}

@end
