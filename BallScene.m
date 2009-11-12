//
//  LabyrinthLayer.m
//  Labyrinth
//
//  Created by Eric Smith on 9/26/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "BallScene.h"
#import "Label.h"
#import "DirectorWrapper.h"

@implementation BallScene
@synthesize ballBody;

-(void) addBall
{
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"ball.png"];
	[self addChild:mgr z:0 tag:kTagBallManager];
	
	ball = [AtlasSprite spriteWithRect:CGRectMake(0.0, 0.0, 30.0, 30.0) spriteManager:mgr];
	ball.position = ccp(50.0, 50.0);
	[mgr addChild:ball z:0 tag:kTagBall];
	
	cpFloat ball_radius = 15.0f;
  cpFloat ball_mass = 1.0f;
  cpFloat ball_moment = cpMomentForCircle(ball_mass, ball_radius, 0.0f, cpvzero);
	
	ballBody = cpBodyNew(ball_mass, ball_moment);
  ballBody->p = ball.position;
	cpSpaceAddBody(space, ballBody);
	
	cpShape *shape = cpCircleShapeNew(ballBody, ball_radius, cpvzero);
	shape->e = 0.5f;
  cpSpaceAddShape(space, shape);
}

-(void) addBackgroundSprite
{
	AtlasSpriteManager *mgr = [AtlasSpriteManager spriteManagerWithFile:@"table.png"];
	[self addChild:mgr z:0 tag:kTagBackgroundManager];
	
	CGSize size = [[DirectorWrapper sharedDirector] winSize];
	AtlasSprite *backgroundSprite = [AtlasSprite spriteWithRect:CGRectMake(0.0, 0.0, size.width, size.height) spriteManager:mgr];
	backgroundSprite.position = ccp(size.width / 2, size.height / 2);
	[mgr addChild:backgroundSprite z:0 tag:kTagBackground];
}

-(void) buildWallAtStart:(CGPoint) startPoint end:(CGPoint) endPoint
{
	cpShape *shape = cpSegmentShapeNew(staticBody, startPoint, endPoint, 0.0f);
	shape->u = 1.0f;
	shape->e = 1.0f;
	cpSpaceAddStaticShape(space, shape); // When do I free all this stuff?
}

-(void) initializeSides 
{
  CGSize size = [[DirectorWrapper sharedDirector] winSize];
	staticBody = cpBodyNew(INFINITY, INFINITY);
	
	[self buildWallAtStart: ccp(0, 0) end: ccp(size.width, 0)];
	[self buildWallAtStart: ccp(size.width, size.height) end: ccp(size.width, 0)];
	[self buildWallAtStart: ccp(0, size.height) end: ccp(0, 0)];
	[self buildWallAtStart: ccp(0, size.height) end: ccp(size.width, size.height)];
}

-(void) initializeChipmunk
{
	cpInitChipmunk();
	space = cpSpaceNew();
	space->elasticIterations = space->iterations;
	
	[self initializeSides];

}

-(id) init
{
	if(self = [super init])
	{
		self.isAccelerometerEnabled = YES;
		[self initializeChipmunk];
		[self addBackgroundSprite];
		[self addBall];
		[self schedule: @selector(updateBall:)];
	}
	
	return self;
}

-(void) updateBall: (ccTime) delta
{
	int steps = 2;
	CGFloat dt = delta/(CGFloat)steps;
	
	for(int i = 0; i< steps; i++)
	{
		cpSpaceStep(space, dt);
	}
	
	[ball setPosition: ballBody->p];
}

-(void) accelerometer: (UIAccelerometer *)accelerometer didAccelerate: (UIAcceleration *)acceleration
{
	space->gravity = ccp(acceleration.x * GRAVITY, acceleration.y * GRAVITY);
}

-(CGPoint) gravity
{
	return space->gravity;
}

-(NSMutableDictionary *) scheduledSelectors
{
	return scheduledSelectors;
}


@end
