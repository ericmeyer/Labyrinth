#import "DirectorWrapperTest.h"
#import "Director.h"
#import "DirectorWrapper.h"

@implementation DirectorWrapperTest

-(void) setUp
{
	[DirectorWrapper clearDirector];
}

-(void) testShouldReturnTheSharedDirectorIfDirectorNotSet
{
	STAssertEqualObjects([DirectorWrapper sharedDirector], [Director sharedDirector], nil);
}

-(void) testShouldReturnAnOverriddenDirectorIfDirectorIsSet
{
	[DirectorWrapper setSharedDirector:@"Monkey See, Monkey Do"];
	
	STAssertEqualStrings([DirectorWrapper sharedDirector], @"Monkey See, Monkey Do", nil);
}

@end
