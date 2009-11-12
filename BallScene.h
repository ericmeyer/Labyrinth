//
//  LabyrinthLayer.h
//  Labyrinth
//
//  Created by Eric Smith on 9/26/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Layer.h"
#include "chipmunk.h"
#import "cocos2d.h"

typedef enum tagManagers
{
	kTagBackgroundManager,
	kTagBallManager
} Manager;

typedef enum tagSprites
{
	kTagBackground,
	kTagBall
} GameSprite;

#define GRAVITY 96.04f

@interface BallScene : Layer {
	cpSpace			*space;
	cpBody			*ballBody;
	cpBody			*staticBody;
	AtlasSprite *ball;
}

@property(nonatomic, readonly) cpBody *ballBody;
-(CGPoint) gravity;
-(NSMutableDictionary *) scheduledSelectors;
-(void) updateBall: (ccTime) delta;

@end
