#import "LabyrinthDelegateTest.h"
#import "Director.h"
#import <OCMock/OCMock.h>

@implementation LabyrinthDelegateTest

// TODO - WELC needs to get re-read.  Testing a singleton
// Also 'My Application is all API calls'
- (void) testSceneIsRunOnDirector
{
	OCMockObject *mockDirector = [OCMockObject mockForClass:[Director class]];
}

@end
