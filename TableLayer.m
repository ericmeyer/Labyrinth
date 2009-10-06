//
//  LabyrinthLayer.m
//  Labyrinth
//
//  Created by Eric Smith on 9/26/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "TableLayer.h"
#import "cocos2d.h"
#import "Label.h"
#import "DirectorWrapper.h"

@implementation TableLayer

-(id) init
{
	if(self = [super init])
	{
		AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"table.png"];
		[self addChild:mgr z:0 tag:kTagBackgroundManager];
		
		CGSize size = [[DirectorWrapper sharedDirector] winSize];
		
		AtlasSprite *backgroundSprite = [AtlasSprite spriteWithRect:CGRectMake(0.0, 0.0, size.width, size.height) spriteManager:mgr];
		backgroundSprite.position = ccp(size.width / 2, size.height / 2);
		[mgr addChild:backgroundSprite z:0 tag:kTagBackground];
	}
	
	return self;
}

@end
