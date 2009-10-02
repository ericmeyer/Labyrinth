//
//  DirectorWrapper.m
//  Labyrinth
//
//  Created by Eric Smith on 10/1/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "DirectorWrapper.h"
#import "Director.h"

@implementation DirectorWrapper

static Director *director = nil;

+(Director *) sharedDirector
{
	if (director == nil)
	{
		return [Director sharedDirector];
	}
	
	return director;
}

+(void) setSharedDirector:(id) newDirector
{
	director = (Director *)newDirector;
}

+(void) clearDirector
{
	director = nil;
}
	
@end
