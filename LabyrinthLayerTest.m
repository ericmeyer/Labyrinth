#import "LabyrinthLayerTest.h"
#import "LabyrinthLayer.h"
#import "AtlasSprite.h"
#import "AtlasSpriteManager.h"
#import "Director.h"
#import "DirectorWrapper.h"
#import "cocos2d.h"
#import <OCMock/OCMock.h>

@implementation LabyrinthLayerTest

-(void) setupFixedSizeDirector
{
	CGSize size;
	size.height = 100;
	size.width = 100;
	
	OCMockObject *fixedSizeDirector = [OCMockObject niceMockForClass:[Director class]];
	[[[fixedSizeDirector stub] andReturnValue: [NSValue valueWithCGSize:size]] winSize];
	
	[DirectorWrapper setSharedDirector:fixedSizeDirector];
}	

-(void) testCreatesBackgroundSpriteAtDirectorWidth
{
	[self setupFixedSizeDirector];
	
	LabyrinthLayer *layer = [[[LabyrinthLayer alloc] init] autorelease];
	
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[layer getChildByTag:kTagBackgroundManager];
	AtlasSprite *sprite = (AtlasSprite *) [mgr getChildByTag:kTagBackground];
	
	STAssertEquals(sprite.textureRect, CGRectMake(0, 0, 100, 100), nil);
}

-(void) testSetsBackgroundSpriteToCenter
{
	[self setupFixedSizeDirector];
	
	LabyrinthLayer *layer = [[[LabyrinthLayer alloc] init] autorelease];
	
	AtlasSpriteManager *mgr = (AtlasSpriteManager *)[layer getChildByTag:kTagBackgroundManager];
	AtlasSprite *sprite = (AtlasSprite *) [mgr getChildByTag:kTagBackground];
	
	STAssertEquals(sprite.position, ccp(50.0, 50.0), nil);
}
@end
