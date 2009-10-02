//
//  DirectorWrapper.h
//  Labyrinth
//
//  Created by Eric Smith on 10/1/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Director.h"

@interface DirectorWrapper : NSObject {

}

+(Director*) sharedDirector;
+(void) setSharedDirector:(id) newDirector;
+(void) clearDirector;

@end
