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
		// create and initialize a Label
		Label* label = [Label labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
		
		// ask director the the window size
		CGSize size = [[Director sharedDirector] winSize];
		
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
	}
	
	return self;
}

@end
