//
//  LabyrinthLayer.m
//  Labyrinth
//
//  Created by Eric Smith on 9/26/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "LabyrinthLayer.h"
#import "cocos2d.h"
#import "Label.h"
#import "Director.h"

@implementation LabyrinthLayer

-(id) init
{
	if(self = [super init])
	{
		Sprite *bg = [Sprite spriteWithFile:@"table.png"];

		// add the label as a child to this Layer
		[self addChild:bg z:0 tag:BACKGROUND];
	}
	
	return self;
}

@end
