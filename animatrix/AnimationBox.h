//
//  AnimationBox.h
//  animatrix
//
//  Created by Igor on 25/12/2017.
//  Copyright © 2017 Igor Rudym. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface AnimationBox : SKSpriteNode
+(id) createWithFrames: (NSArray*) frames;

-(void) setFrame: (SKTexture*) frame;
-(void) setFrameNumber: (int) frameNum;

-(void) play;
-(void) stop;

@property NSArray *animationFrames;
@property float animationSpeed;

@end
