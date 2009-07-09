//
//  BallTest.m
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 2009 8th Light. All rights reserved.
//



@implementation BallTest

#if USE_DEPENDENT_UNIT_TEST     // all "code under test" is in the iPhone Application

- (void) testAppDelegate {
    
    id yourApplicationDelegate = [[UIApplication sharedApplication] delegate];
    STAssertNotNil(yourApplicationDelegate, @"UIAppliation failed to find the AppDelegate");
    
}

#else                           // all "code under test" must be linked into the Unit Test bundle

- (void) testMath {
    
    STAssertTrue((1+1)==2, @"Compiler isn't feeling well today :-(" );
    
}


#endif


@end
