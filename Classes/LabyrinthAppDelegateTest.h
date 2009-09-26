#import "GTMSenTestCase.h"

@interface LabyrinthAppDelegateTest : GTMTestCase
{
	OCMockObject *mockDirector;
	OCMockObject *mockDirectorFactory;
	LabyrinthAppDelegate *delegate;
}
@end
