//
//  GameScene.h
//  animatrix
//
//  Created by Igor on 24/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

#import "AnimationBox.h"
#import "UI.h"
#import "UIComponent.h"

@interface GameScene : SKScene

-(void) setAnimation: (NSMutableArray*) frames;

-(int) nextFrame;
-(int) prevFrame;
-(void) updateFrameCountLabel;

@property NSMutableArray* animationFrames;
@property AnimationBox* animationBox;
@property float animationSpeed;
@property UI *mainUI;
@property int currentFrame;

@end
