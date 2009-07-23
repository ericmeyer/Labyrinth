//
//  LabyrinthViewController.h
//  Labyrinth
//
//  Created by Eric Meyer on 7/9/09.
//  Copyright 8th Light 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ball.h"

@interface LabyrinthViewController : UIViewController {
	IBOutlet Ball *ball;
	IBOutlet UILabel *label;
	IBOutlet UILabel *yVelocity;
	IBOutlet UILabel *zVelocity;
}

@end

