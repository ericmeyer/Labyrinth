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
#import "DirectorWrapper.h"

@implementation LabyrinthLayer

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
//return self;
//}
//
//-(void) addNewSpriteWithCoords:(CGPoint)p
//{
//	AtlasSpriteManager *mgr = (AtlasSpriteManager*) [self getChildByTag:kTagSpriteManager];
//	
//	int idx = CCRANDOM_0_1() * 1400 / 100;
//	int x = (idx%5) * 85;
//	int y = (idx/5) * 121;
//	
//	
//	AtlasSprite *sprite = [AtlasSprite spriteWithRect:CGRectMake(x,y,85,121) spriteManager:mgr];
//	[mgr addChild:sprite];
//}



@end
