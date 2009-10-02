//
//  OCMockConstraint+SceneCheck.m
//  Labyrinth
//
//  Created by Eric Smith on 10/2/09.
//  Copyright 2009 8th Light. All rights reserved.
//

#import "OCMConstraint+SceneCheck.h"
#import "Scene.h"

@interface OCMSceneConstraint : OCMConstraint
{
	id layerClass;
}
@property(nonatomic, retain) id layerClass;
-(bool) evaluate:(id)value;
@end

@implementation OCMSceneConstraint
@synthesize layerClass;

-(bool) evaluate:(id)value
{
	id storedLayer = [[(Scene *)value children] objectAtIndex:0];
	return [storedLayer isKindOfClass:layerClass];
}

@end

@implementation OCMConstraint (SceneCheck)

+(id) sceneWithLayer:(id) layerClass
{
	OCMSceneConstraint *constraint = [OCMSceneConstraint constraint];
	constraint.layerClass = layerClass;
	return constraint;
}


@end
